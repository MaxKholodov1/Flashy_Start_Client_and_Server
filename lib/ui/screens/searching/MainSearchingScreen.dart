import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flushbar/flushbar.dart';

import '../../../cubits/NavigationCubit.dart';
import '../../../cubits/searching_screen_cubit/SearchingScreenCubit.dart';
import '../../../cubits/searching_screen_cubit/SearchingStates.dart';
import '../../../generated/FailureCodeLocalizer.dart';
import '../../../generated/l10n.dart';
import '../../widgets/NavigationWidget.dart';
import '../../widgets/searching/MainSearchingScreenWidget.dart';

class MainSearchingScreen extends StatefulWidget {
  const MainSearchingScreen({super.key});

  @override
  State<MainSearchingScreen> createState() => _MainSearchingScreenState();
}

class _MainSearchingScreenState extends State<MainSearchingScreen> {
  bool _snackbarShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final state = context.read<SearchingScreensCubit>().state;
    if (!_snackbarShown &&
        state is MainSearchingScreenState &&
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
    return BlocListener<SearchingScreensCubit, SearchingScreenState>(
      listener: (context, state) {
        if (state is MainSearchingScreenState &&
            state.showSnackBarMessage == true &&
            state.failureCode != null) {
          Flushbar(
            message: getFailureMessage(context, state.failureCode!),
            duration: const Duration(seconds: 3),
            margin: const EdgeInsets.all(16),
            borderRadius: BorderRadius.circular(8),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        }
      },
      child: BlocBuilder<SearchingScreensCubit, SearchingScreenState>(
        builder: (context, state) {
          if (state is MainSearchingScreenState) {
            return Scaffold(
              appBar: AppBar(
                title: Text(S.of(context).deckSearch),
                actions: [
                  if (state.refreshButton == true)
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      tooltip: S.of(context).refresh,
                      onPressed: () {
                        context.read<SearchingScreensCubit>().init();
                      },
                    ),
                ],
              ),
              body: const MainSearchingScreenWidget(),
              bottomNavigationBar: SafeArea(
                top: false, // не добавлять отступ сверху для NavigationWidget
                child: const NavigationWidget(),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
