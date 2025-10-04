import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
import 'package:flashy_start/domain/entities/GlobalCard.dart';
import 'package:flashy_start/domain/entities/GlobalDeckInfo.dart';
import 'package:flashy_start/ui/widgets/editing/card/CardWidget.dart';
import '../../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../../generated/l10n.dart';
import '../../../themes/app_colors.dart';
import 'DeckCardWidget.dart';
import 'GradientGenerator.dart';
import 'MoreMenuButton.dart';

class EditingDeckScreenWidget extends StatefulWidget {
  final GlobalDeckInfo globalDeckInfo;
  final List<GlobalCard>? globalCards;

  const EditingDeckScreenWidget({
    super.key,
    required this.globalDeckInfo,
    required this.globalCards,
  });

  @override
  State<EditingDeckScreenWidget> createState() => _EditingDeckScreenWidgetState();
}

class _EditingDeckScreenWidgetState extends State<EditingDeckScreenWidget> {
  late final ScrollController _scrollController;
  String _searchQuery = '';
  bool _showSearchField = false;

  @override
  void initState() {
    super.initState();
    final initialOffset = context.read<EditScreensCubit>().getDeckEditingScreenOffset();
    _scrollController = ScrollController(initialScrollOffset: initialOffset);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<GlobalCard> get _filteredCards {
    if (_searchQuery.isEmpty) return widget.globalCards ?? [];
    return (widget.globalCards ?? []).where((card) {
      final query = _searchQuery.toLowerCase();
      return card.question.toLowerCase().contains(query) ||
          card.answer.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final topColor = GradientGenerator.getTopColorFromId(widget.globalDeckInfo.globalDeck.ID);
    final screenHeight = MediaQuery.of(context).size.height;
    final colors = Theme.of(context).extension<AppColors>()!;
    final backgroundColor = colors.backGround;
    final surfaceBackgroundColor = colors.surfaceBackground;
    final dividerColor = colors.dividerOnSurfaceBackground;
    final currentUserID = (context.read<StartupCubit>().state as StartupReady).userID;
    final isAuthor = widget.globalDeckInfo.globalDeck.authorID == currentUserID;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).editTheDecks),
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<EditScreensCubit>().showMainEditingScreen();
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
                              colors: [topColor, surfaceBackgroundColor],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        DeckCardWidget(globalDeckInfo: widget.globalDeckInfo),
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: screenHeight * 3 / 4),
                          child: Container(
                            width: double.infinity,
                            color: surfaceBackgroundColor.withOpacity(0.2),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.add_circle_outline, size: 35),
                                      onPressed: () {
                                        context.read<EditScreensCubit>().showCreatingCardScreen(
                                          widget.globalDeckInfo,
                                          widget.globalCards,
                                        );
                                      },
                                    ),
                                    isAuthor
                                        ? MoreMenuButtonForAuthor(
                                      globalCards: widget.globalCards,
                                      globalDeckInfo: widget.globalDeckInfo,
                                    )
                                        : MoreMenuButtonForEditor(
                                      globalCards: widget.globalCards,
                                      globalDeckInfo: widget.globalDeckInfo,
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      icon: const Icon(Icons.search, size: 35),
                                      onPressed: () {
                                        setState(() {
                                          _showSearchField = !_showSearchField;
                                          if (!_showSearchField) _searchQuery = '';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                if (_showSearchField)
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
                                ListView.separated(
                                  itemCount: _filteredCards.length,
                                  itemBuilder: (context, index) {
                                    final card = _filteredCards[index];
                                    return CardWidget(
                                      globalCard: card,
                                      getCurrentOffset: () => _scrollController.offset,
                                    );
                                  },
                                  separatorBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Divider(
                                      color: dividerColor,
                                      thickness: 1,
                                    ),
                                  ),
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
