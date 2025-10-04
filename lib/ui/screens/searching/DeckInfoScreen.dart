import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flashy_start/cubits/searching_screen_cubit/SearchingStates.dart';
import 'package:flashy_start/generated/FailureCodeLocalizer.dart';
import '../../../cubits/NavigationCubit.dart';
import '../../../cubits/searching_screen_cubit/SearchingScreenCubit.dart';
import '../../../generated/l10n.dart';
import '../../widgets/searching/DeckInfoScreenWidget.dart';

class DeckInfoScreen extends StatefulWidget {
  const DeckInfoScreen({super.key});

  @override
  State<DeckInfoScreen> createState() => _DeckInfoScreenState();
}

class _DeckInfoScreenState extends State<DeckInfoScreen> {
  bool _snackbarShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = context.read<SearchingScreensCubit>().state;
    if (!_snackbarShown &&
        state is DeckInfoScreenState &&
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
    return BlocBuilder<SearchingScreensCubit, SearchingScreenState>(
      builder: (context, state) {
        if (state is! DeckInfoScreenState) {
          return const SizedBox.shrink();
        }

        return Scaffold(
          body: BlocListener<SearchingScreensCubit, SearchingScreenState>(
            listener: (context, listenerState) {
              if (listenerState is DeckInfoScreenState &&
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
                DeckInfoScreenWidget(
                  globalDeckInfo: state.globalDeckInfo,
                  globalCards: state.globalCards,
                  searchResultDeck: state.searchResultDeck,
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
                        context.read<SearchingScreensCubit>().showGlobalDeckInfo(
                          state.searchResultDeck,
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
