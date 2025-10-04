
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/generated/FailureCodeLocalizer.dart';

import '../../../cubits/NavigationCubit.dart';
import '../../../cubits/learning_screens_cubit/LearningScreensCubit.dart';
import '../../../cubits/learning_screens_cubit/LearningStates.dart';
import '../../../generated/l10n.dart';
import '../../widgets/learning/progress_deck_info/LearningDeckInfoScreenWidget.dart';

class LearningDeckInfoScreen extends StatefulWidget {
  const LearningDeckInfoScreen({super.key});

  @override
  State<LearningDeckInfoScreen> createState() => _LearningDeckInfoScreenState();
}

class _LearningDeckInfoScreenState extends State<LearningDeckInfoScreen> {
  bool _snackbarShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = context.read<LearningScreensCubit>().state;
    if (!_snackbarShown &&
        state is LearningDeckInfoScreenState &&
        state.showSnackBarMessage == true &&
        state.failureCode != null) {
      _snackbarShown = true;
      Future.microtask(() {
        Flushbar(
          message: getFailureMessage(context, state.failureCode!),
          duration: const Duration(seconds: 3),
          margin: const EdgeInsets.all(16),
          borderRadius: BorderRadius.circular(8),
          flushbarPosition: FlushbarPosition.TOP,
        ).show(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LearningScreensCubit, LearningScreenState>(
      builder: (context, state) {
        if (state is! LearningDeckInfoScreenState) {
          return const SizedBox.shrink();
        }
        return Scaffold(
          body: BlocListener<LearningScreensCubit, LearningScreenState>(
            listener: (context, listenerState) {
              if (listenerState is LearningDeckInfoScreenState &&
                  listenerState.showSnackBarMessage == true &&
                  listenerState.failureCode != null) {
                Flushbar(
                  message: getFailureMessage(context, listenerState.failureCode!),
                  duration: const Duration(seconds: 3),
                  margin: const EdgeInsets.all(16),
                  borderRadius: BorderRadius.circular(8),
                  flushbarPosition: FlushbarPosition.TOP,
                ).show(context);
              }
            },
            child: Stack(
              children: [
                LearningDeckInfoScreenWidget(
                  globalDeckInfo: state.globalDeckInfo,
                  progressCards: state.progressCards,
                ),
                if (state.refreshButton == true)
                  Positioned(
                    top: 16,
                    right: 16,
                    child: FloatingActionButton(
                      mini: true,
                      tooltip: S.of(context).refresh,
                      child: const Icon(Icons.refresh),
                      onPressed: () {
                        context.read<LearningScreensCubit>().showLearningDeckInfo(
                          state.globalDeckInfo.globalDeck.ID,
                          0,
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
