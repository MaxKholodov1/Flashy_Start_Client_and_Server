import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flashy_start/ui/widgets/editing/edit_deck/EditingDeckScreenWidget.dart';
import '../../../cubits/NavigationCubit.dart';
import '../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../cubits/edit_screen_cubit/EditingStates.dart';
import '../../../generated/FailureCodeLocalizer.dart';
import '../../widgets/editing/card/CreatingCardWidget.dart';

class CreatingCardScreen extends StatefulWidget {
  const CreatingCardScreen({super.key});

  @override
  State<CreatingCardScreen> createState() => _CreatingCardScreenState();
}

class _CreatingCardScreenState extends State<CreatingCardScreen> {
  bool _snackbarShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final state = context.read<EditScreensCubit>().state;
    if (!_snackbarShown &&
        state is CreatingCardScreenState &&
        state.showSnackBarMessage == true &&
        state.failureCode != null) {
      _snackbarShown = true;
      Future.microtask(() {
        Flushbar(
          message: getFailureMessage(context, state.failureCode!) ,
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
    return BlocBuilder<EditScreensCubit, EditingScreenState>(
      builder: (context, state) {
        if (state is! CreatingCardScreenState) {
          return const SizedBox.shrink();
        }

        return Scaffold(
          body: BlocListener<EditScreensCubit, EditingScreenState>(
            listener: (context, listenerState) {
              if (listenerState is CreatingCardScreenState &&
                  listenerState.showSnackBarMessage == true &&
                  listenerState.failureCode != null) {
                Flushbar(
                  message: getFailureMessage(context, listenerState.failureCode!) ,
                  duration: const Duration(seconds: 3),
                  margin: const EdgeInsets.all(16),
                  borderRadius: BorderRadius.circular(8),
                  flushbarPosition: FlushbarPosition.TOP,
                ).show(context);
              }
            },
            child: Stack(
              children: [
                EditingDeckScreenWidget(
                  globalDeckInfo: state.globalDeckInfo,
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
                        final isKeyboardOpen =
                            MediaQuery.of(context).viewInsets.bottom > 0;
                        return SingleChildScrollView(
                          reverse: true,
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight -
                                  (isKeyboardOpen
                                      ? MediaQuery.of(context)
                                      .viewInsets
                                      .bottom
                                      : 0),
                            ),
                            child: const Center(
                              child: CreatingCardWidget(),
                            ),
                          ),
                        );
                      },
                    ),
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
