
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/learning_screens_cubit/LearningScreensCubit.dart';
import '../../../cubits/learning_screens_cubit/LearningStates.dart';
import '../../../domain/entities/RecallQualityEnum.dart';
import '../../../domain/entities/UserCardProgress.dart';
import '../../../generated/l10n.dart';
import '../../widgets/learning/learning_cards/AnimatedCard.dart';
import '../../widgets/learning/learning_cards/RecallQualityButtons.dart';
import '../../widgets/learning/learning_cards/StatusBar.dart';

class LearningCardsScreen extends StatefulWidget {
  const LearningCardsScreen({Key? key}) : super(key: key);

  @override
  State<LearningCardsScreen> createState() => _LearningCardsScreenState();
}

class _LearningCardsScreenState extends State<LearningCardsScreen>
    with SingleTickerProviderStateMixin {
  bool _showAnswer = false;
  bool defaultQuestion = true;

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotationAnimation;

  Offset _dragOffset = Offset.zero;
  bool _isDragging = false;
  bool _isAnimating = false;
  int _swipeDirection = 0;

  List<UserProgressCard> _frozenCards = [];

  LearningCardsScreenState? _currentState;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        final state = context.read<LearningScreensCubit>().state;

        if (state is LearningCardsScreenState) {
          setState(() {
            _showAnswer = false;
            _dragOffset = Offset.zero;
            _isAnimating = false;
            _swipeDirection = 0;
            _controller.reset();

            _frozenCards = List.from(state.progressCards);
          });
        } else {
          setState(() {
            _showAnswer = false;
            _dragOffset = Offset.zero;
            _isAnimating = false;
            _swipeDirection = 0;
            _controller.reset();
          });
        }
      }
    });
  }

  void _swipeLeft(RecallQuality quality) {
    if (_isAnimating || _isLoading) return;

    final screenWidth = MediaQuery.of(context).size.width;

    _swipeDirection = 1;

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(-screenWidth * 1.5, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(begin: 1, end: 0).animate(_controller);
    _rotationAnimation = Tween<double>(begin: 0, end: -2).animate(_controller);

    _isAnimating = true;
    _controller.forward();

    context.read<LearningScreensCubit>().submitLearningCardReview(quality);
  }

  void _swipeRight(RecallQuality quality) {
    if (_isAnimating || _isLoading) return;

    final screenWidth = MediaQuery.of(context).size.width;

    _swipeDirection = 1;

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(screenWidth * 1.5, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(begin: 1, end: 0).animate(_controller);
    _rotationAnimation = Tween<double>(begin: 0, end: 2).animate(_controller);

    _isAnimating = true;
    _controller.forward();

    context.read<LearningScreensCubit>().submitLearningCardReview(quality);
  }

  void _startSwipeAnimation() {
    if (_isAnimating || _isLoading) return;

    final screenWidth = MediaQuery.of(context).size.width;
    final direction = _dragOffset.dx.sign; // -1 для влево, 1 для вправо
    _swipeDirection = direction.toInt();

    final endOffset = Offset(direction * screenWidth * 1.5, _dragOffset.dy);

    _slideAnimation = Tween<Offset>(
      begin: _dragOffset,
      end: endOffset,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(begin: 1, end: 0).animate(_controller);
    _rotationAnimation = Tween<double>(
      begin: _dragOffset.dx / 300,
      end: direction * 0.5,
    ).animate(_controller);

    _isAnimating = true;
    _controller.forward();

    // Отправляем оценку в зависимости от направления свайпа
    if (direction > 0) {
      context.read<LearningScreensCubit>().submitLearningCardReview(RecallQuality.perfect);
    } else {
      context.read<LearningScreensCubit>().submitLearningCardReview(RecallQuality.bad);
    }
  }

  void _cancelSwipeAnimation() {
    if (_isAnimating) return;

    _slideAnimation = Tween<Offset>(
      begin: _dragOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(begin: 1, end: 1).animate(_controller);
    _rotationAnimation = Tween<double>(
      begin: _dragOffset.dx / 300,
      end: 0,
    ).animate(_controller);

    _isAnimating = true;
    _controller.forward();
  }

  Widget _buildCard(UserProgressCard card, double cardWidth, double cardHeight) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: WaterOverlayCard(
        key: ValueKey(_showAnswer),
        question: defaultQuestion ? card.question : card.answer,
        answer: defaultQuestion ? card.answer : card.question,
        cardHeight: cardHeight,
        cardWidth: cardWidth,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LearningScreensCubit>().state;
    if (state is LearningCardsScreenState) {
      _currentState = state;
      _isLoading = state.isLoading;
    } else {
      _currentState = null;
      _isLoading = false;
    }
    if (_frozenCards.isEmpty) {
      _frozenCards = List.from(_currentState!.progressCards);
    }

    final currentCard = _frozenCards[0];
    final nextCard = _frozenCards.length > 1 ? _frozenCards[1] : null;
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 500;
    final cardWidth = isDesktop ? screenSize.width * 0.7 : screenSize.width * 0.85;
    final screenAspectRatio = isDesktop
        ? screenSize.width / screenSize.height * 1.2
        : 3 / 4;
    final cardHeight = cardWidth / screenAspectRatio;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).cards),
        leading: BackButton(
          onPressed: () {
            context.read<LearningScreensCubit>().showLearningDeckInfo(
              _currentState!.globalDeckInfo.globalDeck.ID, null
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            tooltip: S.of(context).clue,
            onPressed: _showHelpOverlay,
          ),
          IconButton(
            icon: Icon(
              defaultQuestion ? Icons.question_answer : Icons.remove_red_eye,
            ),
            tooltip: defaultQuestion ? S.of(context).showAnswerFirst : S.of(context).showQuestionFirst,
            onPressed: () {
              setState(() {
                defaultQuestion = !defaultQuestion;
              });
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: StatusBar(
                  width: cardWidth,
                  cards: _frozenCards,
                ),
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    if (nextCard != null)
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          double scale = 0.94 + 0.06 * _controller.value;
                          double opacity = 0.6 + 0.4 * _controller.value;
                          return IgnorePointer(
                            ignoring: true,
                            child: Transform.scale(
                              scale: scale,
                              child: Opacity(opacity: opacity, child: child),
                            ),
                          );
                        },
                        child: _buildCard(nextCard, cardWidth, cardHeight),
                      ),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        final offset =
                        _isAnimating ? _slideAnimation.value : _dragOffset;
                        final rotation = _isAnimating
                            ? _rotationAnimation.value
                            : (_dragOffset.dx / 300);
                        final opacity = _isAnimating ? _fadeAnimation.value : 1.0;

                        return Transform.translate(
                          offset: offset,
                          child: Transform.rotate(
                            angle: rotation,
                            child: Opacity(opacity: opacity, child: child),
                          ),
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          if (!_isAnimating && !_isLoading) {
                            setState(() => _showAnswer = !_showAnswer);
                          }
                        },
                        onPanStart: (_) {
                          if (_isAnimating || _isLoading) return;
                          _isDragging = true;
                        },
                        onPanUpdate: (details) {
                          if (!_isDragging || _isAnimating || _isLoading) return;
                          setState(() => _dragOffset += details.delta);
                        },
                        onPanEnd: (_) {
                          if (!_isDragging || _isAnimating || _isLoading) return;
                          _isDragging = false;
                          final screenWidth = MediaQuery.of(context).size.width;
                          final threshold = screenWidth / 4;
                          if (_dragOffset.dx.abs() > threshold) {
                            _startSwipeAnimation();
                          } else {
                            _cancelSwipeAnimation();
                          }
                        },
                        child: _buildCard(currentCard, cardWidth, cardHeight),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: 100,
                child: RecallQualityButtons(
                  isLoading: _isLoading,
                  onLeftSwipe: _swipeLeft,
                  onRightSwipe: _swipeRight,
                  cardWidth: cardWidth,
                  isDesktop: isDesktop,
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
  void _showHelpOverlay() {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) => Positioned(
        top: 80,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    S.of(context).learningHelpText,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => entry.remove(),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
