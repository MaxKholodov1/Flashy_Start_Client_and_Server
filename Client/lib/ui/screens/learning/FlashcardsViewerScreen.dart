import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/learning_screens_cubit/LearningScreensCubit.dart';
import 'package:flashy_start/cubits/learning_screens_cubit/LearningStates.dart';
import 'package:flashy_start/domain/entities/UserCardProgress.dart';

import '../../../generated/l10n.dart';
import '../../widgets/learning/learning_cards/AnimatedCard.dart';

class FlashcardsViewerScreen extends StatefulWidget {
  final List<UserProgressCard> cards;

  const FlashcardsViewerScreen({super.key, required this.cards});

  @override
  State<FlashcardsViewerScreen> createState() => _FlashcardsViewerScreenState();
}

class _FlashcardsViewerScreenState extends State<FlashcardsViewerScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool _showAnswer = false;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotationAnimation;
  bool defaultQuestion = true;

  Offset _dragOffset = Offset.zero;
  bool _isDragging = false;
  bool _isAnimating = false;
  int _swipeDirection = 0; // -1 = влево, 1 = вправо (только для анимации)


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          if (_swipeDirection != 0) {
            // Листаем вперед по модулю
            _currentIndex = (_currentIndex + 1) % widget.cards.length;
          }
          _showAnswer = false;
          _dragOffset = Offset.zero;
          _isAnimating = false;
          _swipeDirection = 0;
          _controller.reset();
        });
      }
    });
  }


  void _startSwipeAnimation() {
    final screenWidth = MediaQuery.of(context).size.width;

    final direction = _dragOffset.dx.sign; // -1 или 1
    _swipeDirection = direction.toInt();

    final endOffset = Offset(direction * screenWidth * 1.5, _dragOffset.dy);

    _slideAnimation = Tween<Offset>(
      begin: _dragOffset,
      end: endOffset,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_controller);

    _rotationAnimation = Tween<double>(
      begin: _dragOffset.dx / 300,
      end: direction * 0.5,
    ).animate(_controller);

    _isAnimating = true;
    _controller.forward();
  }

  void _cancelSwipeAnimation() {
    _slideAnimation = Tween<Offset>(
      begin: _dragOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 1,
      end: 1,
    ).animate(_controller);

    _rotationAnimation = Tween<double>(
      begin: _dragOffset.dx / 300,
      end: 0,
    ).animate(_controller);

    _isAnimating = true;
    _controller.forward();
  }

  void _onPanStart(DragStartDetails details) {
    if (_isAnimating) return;
    _isDragging = true;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (!_isDragging || _isAnimating) return;
    setState(() {
      _dragOffset += details.delta;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (!_isDragging || _isAnimating) return;
    _isDragging = false;

    final screenWidth = MediaQuery.of(context).size.width;
    final threshold = screenWidth / 4;

    if (_dragOffset.dx.abs() > threshold) {
      // Всегда свайп вперед, по модулю
      _startSwipeAnimation();
    } else {
      _cancelSwipeAnimation();
    }
  }

  void _toggleSide() {
    if (_isAnimating) return;
    setState(() {
      _showAnswer = !_showAnswer;
    });
  }

  void _goToPrev() {
    if (!_isAnimating) {
      setState(() {
        _currentIndex = (_currentIndex - 1 + widget.cards.length) % widget.cards.length;
        _showAnswer = false;
        _dragOffset = Offset.zero;
      });
    }
  }

  void _goToNext() {
    if (_isAnimating) return;

    final screenWidth = MediaQuery.of(context).size.width;

    _swipeDirection = 1;

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(screenWidth * 1.5, 0),  // карточка уезжает влево
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(begin: 1, end: 0).animate(_controller);

    _rotationAnimation = Tween<double>(begin: 0, end: 2).animate(_controller);

    _isAnimating = true;
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCard(UserProgressCard card) {
    final screenSize = MediaQuery.of(context).size;
    final isDesktop = screenSize.width > 500;
    final cardWidth = isDesktop ? screenSize.width * 0.7 : screenSize.width * 0.9;
    final screenAspectRatio = isDesktop
        ? screenSize.width / screenSize.height * 1.2
        : 3 / 4;
    final cardHeight = cardWidth / screenAspectRatio;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: WaterOverlayCard(
        key: ValueKey(_showAnswer),
        question: defaultQuestion ? card.question : card.answer,
        answer: defaultQuestion ? card.answer : card.question,
        cardWidth: cardWidth,
        cardHeight: cardHeight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cards = widget.cards;
    final currentCard = cards[_currentIndex];
    final nextCard = cards[(_currentIndex + 1) % cards.length];
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).cards),
        leading: BackButton(
          onPressed: () {
            final state = context.read<LearningScreensCubit>().state as FlashcardsViewerScreenState;
            context.read<LearningScreensCubit>().showLearningDeckInfo(
              state.globalDeckInfo.globalDeck.ID, null
            );
          },
        ),
        actions: [
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
        children: [
          Expanded(
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      double scale = 0.94 + 0.06 * _controller.value;
                      double opacity = 0.6 + 0.4 * _controller.value;
                      return IgnorePointer(
                        ignoring: true, // 👈 блокируем взаимодействие
                        child: Transform.scale(
                          scale: scale,
                          child: Opacity(
                            opacity: opacity,
                            child: child,
                          ),
                        ),
                      );
                    },
                    child: _buildCard(nextCard),
                  ),

                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final offset = _isAnimating ? _slideAnimation.value : _dragOffset;
                      final rotation = _isAnimating ? _rotationAnimation.value : (_dragOffset.dx / 300);
                      final opacity = _isAnimating ? _fadeAnimation.value : 1.0;

                      return Transform.translate(
                        offset: offset,
                        child: Transform.rotate(
                          angle: rotation,
                          child: Opacity(
                            opacity: opacity,
                            child: child,
                          ),
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: _toggleSide,
                      onPanStart: _onPanStart,
                      onPanUpdate: _onPanUpdate,
                      onPanEnd: _onPanEnd,
                      child: _buildCard(currentCard),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _goToPrev,
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 16),
              Text("${_currentIndex + 1} / ${cards.length}"),
              const SizedBox(width: 16),
              IconButton(
                onPressed: _goToNext,
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
