import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/domain/entities/UserCardProgress.dart';
import 'package:flashy_start/ui/widgets/learning/progress_deck_info/ModeSelector.dart';
import 'package:flashy_start/ui/widgets/learning/progress_deck_info/MoreMenuButton.dart';
import 'package:flashy_start/ui/widgets/learning/progress_deck_info/ProgressDeckCardWidget.dart';

import '../../../../cubits/learning_screens_cubit/LearningScreensCubit.dart';
import '../../../../domain/entities/GlobalDeckInfo.dart';
import '../../../../generated/l10n.dart';
import '../../../themes/app_colors.dart';
import '../../editing/edit_deck/GradientGenerator.dart';
import 'ProgressCardWidget.dart';

class LearningDeckInfoScreenWidget extends StatefulWidget {
  final GlobalDeckInfo globalDeckInfo;
  final List<UserProgressCard>? progressCards;

  const LearningDeckInfoScreenWidget({
    super.key,
    required this.globalDeckInfo,
    required this.progressCards,
  });

  @override
  State<LearningDeckInfoScreenWidget> createState() => _LearningDeckInfoScreenWidgetState();
}

class _LearningDeckInfoScreenWidgetState extends State<LearningDeckInfoScreenWidget> {
  late final ScrollController _scrollController;
  String _searchQuery = '';
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<UserProgressCard> get _filteredCards {
    if (_searchQuery.isEmpty) {
      return widget.progressCards ?? [];
    }
    return (widget.progressCards ?? [])
        .where((card) =>
    card.question.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        card.answer.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final topColor = GradientGenerator.getTopColorFromId(widget.globalDeckInfo.globalDeck.ID);
    final screenHeight = MediaQuery.of(context).size.height;
    final colors = Theme.of(context).extension<AppColors>()!;
    final backgroundColor = colors.backGround;
    final surfaceBackgroundColor = colors.surfaceBackground;
    final dividerColor = colors.dividerOnSurfaceBackground;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).study),
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<LearningScreensCubit>().showMainLearningScreen();
          },
        ),
        toolbarHeight: 40,
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: surfaceBackgroundColor,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: screenHeight * 0.5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                topColor,
                                surfaceBackgroundColor,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ProgressDeckCardWidget(globalDeckInfo: widget.globalDeckInfo),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: screenHeight * 3 / 4,
                          ),
                          child: Container(
                            width: double.infinity,
                            color: surfaceBackgroundColor.withOpacity(0.2),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ModeSelector(),
                                    SizedBox(width: 12,),
                                    MoreMenuButton(),
                                    const Spacer(),
                                    IconButton(
                                      icon: Icon(_isSearching ? Icons.close : Icons.search, size: 35),
                                      onPressed: () {
                                        setState(() {
                                          if (_isSearching) {
                                            _searchQuery = '';
                                          }
                                          _isSearching = !_isSearching;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                if (_isSearching)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: S.of(context).search,
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      onChanged: (val) {
                                        setState(() {
                                          _searchQuery = val;
                                        });
                                      },
                                    ),
                                  ),
                                const Divider(
                                  color: Colors.white10,
                                  thickness: 1,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                ListView.builder(
                                  itemCount: _filteredCards.length,
                                  itemBuilder: (context, index) {
                                    final card = _filteredCards[index];
                                    return ProgressCardWidget(
                                      userProgressCard: card,
                                      getCurrentOffset: () => _scrollController.offset,
                                    );
                                  },
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
