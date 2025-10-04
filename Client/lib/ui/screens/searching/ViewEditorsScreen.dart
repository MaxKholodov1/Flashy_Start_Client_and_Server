import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/NavigationCubit.dart';
import 'package:flashy_start/cubits/searching_screen_cubit/SearchingScreenCubit.dart';

import '../../../cubits/searching_screen_cubit/SearchingStates.dart';
import '../../widgets/ViewEditorsWidget.dart';
import '../../widgets/searching/DeckInfoScreenWidget.dart';

class ViewEditorsScreen extends StatefulWidget {
  const ViewEditorsScreen({super.key});

  @override
  State<ViewEditorsScreen> createState() => _ViewEditorsScreenState();
}

class _ViewEditorsScreenState extends State<ViewEditorsScreen> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SearchingScreensCubit, SearchingScreenState>(
      builder: (context, state) {
        if (state is! ViewEditorsScreenState) {
          return const SizedBox.shrink();
        }
        return Scaffold(
          body: Stack(
            children: [
              DeckInfoScreenWidget(
                globalDeckInfo: state.globalDeckInfo,
                searchResultDeck: state.searchResultDeck,
                globalCards: state.globalCards,
              ),
              Positioned.fill(
                child: Container(
                  color: const Color.fromARGB(122, 0, 0, 0),
                ),
              ),
              Positioned.fill(
                child: SafeArea(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
                      return SingleChildScrollView(
                        reverse: true,
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight - (isKeyboardOpen ? MediaQuery.of(context).viewInsets.bottom : 0),
                          ),
                          child: Center(
                              child: ViewEditorsWidget(editors: state.globalDeckInfo.editorNames, authorName: state.globalDeckInfo.authorName, onClose: (){
                                context.read<SearchingScreensCubit>().closeViewEditorsScreen();
                              })
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
