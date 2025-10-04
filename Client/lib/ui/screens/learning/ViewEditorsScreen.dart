import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/NavigationCubit.dart';
import 'package:flashy_start/cubits/learning_screens_cubit/LearningScreensCubit.dart';
import 'package:flashy_start/cubits/learning_screens_cubit/LearningStates.dart';
import 'package:flashy_start/ui/widgets/ViewEditorsWidget.dart';
import '../../widgets/learning/progress_deck_info/LearningDeckInfoScreenWidget.dart';

class ViewEditorsScreen extends StatefulWidget {
  const ViewEditorsScreen({super.key});

  @override
  State<ViewEditorsScreen> createState() => _ViewEditorsScreenState();
}

class _ViewEditorsScreenState extends State<ViewEditorsScreen> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LearningScreensCubit, LearningScreenState>(
      builder: (context, state) {
        if (state is! ViewEditorsScreenState) {
          return const SizedBox.shrink();
        }
        return Scaffold(
          body: Stack(
            children: [
              LearningDeckInfoScreenWidget(
                globalDeckInfo: state.globalDeckInfo,
                progressCards: state.progressCards,
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
                              context.read<LearningScreensCubit>().closeViewEditorsScreen();
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
