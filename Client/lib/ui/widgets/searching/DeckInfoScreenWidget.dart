
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/domain/entities/SearchGlobalDeck.dart';

import '../../../cubits/searching_screen_cubit/SearchingScreenCubit.dart';
import '../../../domain/entities/GlobalCard.dart';
import '../../../domain/entities/GlobalDeckInfo.dart';
import '../../../generated/l10n.dart';
import '../../themes/app_colors.dart';
import '../editing/edit_deck/GradientGenerator.dart';
import 'CardWidget.dart';
import 'DeckInfoCardWidget.dart';

class DeckInfoScreenWidget extends StatefulWidget {
  final GlobalDeckInfo globalDeckInfo;
  final SearchResultDeck searchResultDeck;
  final List<GlobalCard>? globalCards;

  const DeckInfoScreenWidget({
    super.key,
    required this.globalDeckInfo,
    required this.searchResultDeck,
    required this.globalCards,
  });

  @override
  State<DeckInfoScreenWidget> createState() => _DeckInfoScreenWidgetState();
}

class _DeckInfoScreenWidgetState extends State<DeckInfoScreenWidget> {
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

  List<GlobalCard> get _filteredCards {
    if (_searchQuery.isEmpty) {
      return widget.globalCards ?? [];
    }
    return (widget.globalCards ?? [])
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
        title: Text(S.of(context).deckSearch),
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<SearchingScreensCubit>().showMainSearchingScreen();
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
                        DeckInfoCardWidget(
                          globalDeckInfo: widget.globalDeckInfo,
                          searchResultDeck: widget.searchResultDeck,
                        ),
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
                                ),
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
