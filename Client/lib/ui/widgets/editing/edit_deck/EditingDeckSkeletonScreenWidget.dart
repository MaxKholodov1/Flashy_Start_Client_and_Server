import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/edit_screen_cubit/EditingStates.dart';
import 'package:flashy_start/ui/widgets/learning/progress_deck_info/MoreMenuButton.dart';
import '../../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../../generated/l10n.dart';
import '../../../themes/app_colors.dart';
import 'DeckCardSkeletonWidget.dart';
import 'DeckCardWidget.dart';
import 'GradientGenerator.dart';
import 'MoreMenuButton.dart';

class EditingDeckSkeletonScreenWidget extends StatefulWidget {

  const EditingDeckSkeletonScreenWidget({
    super.key,
  });

  @override
  State<EditingDeckSkeletonScreenWidget> createState() => _EditingDeckSkeletonScreenWidgetState();
}

class _EditingDeckSkeletonScreenWidgetState extends State<EditingDeckSkeletonScreenWidget> {
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


  @override
  Widget build(BuildContext context) {
    final topColor = GradientGenerator.getTopColorFromId((context.read<EditScreensCubit>().state as EditingDeckSkeletonScreenState).deckID);
    final screenHeight = MediaQuery.of(context).size.height;
    final colors = Theme.of(context).extension<AppColors>()!;
    final backgroundColor = colors.backGround;
    final surfaceBackgroundColor = colors.surfaceBackground;

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
                        DeckCardSkeletonWidget(title: (context.read<EditScreensCubit>().state as EditingDeckSkeletonScreenState).title, description: (context.read<EditScreensCubit>().state as EditingDeckSkeletonScreenState).description,),
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
                                      },
                                    ),
                                    MoreMenuButton(),
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
