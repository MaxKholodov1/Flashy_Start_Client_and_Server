import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flashy_start/ui/widgets/editing/edit_deck/EditingDeckScreenWidget.dart';
import 'package:flashy_start/ui/widgets/editing/edit_deck/EditingDeckSkeletonScreenWidget.dart';
import '../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../cubits/NavigationCubit.dart';
import '../../../cubits/edit_screen_cubit/EditingStates.dart';
import '../../../generated/FailureCodeLocalizer.dart';
import '../../../generated/l10n.dart';
class EditingDeckSkeletonScreen extends StatefulWidget {
  const EditingDeckSkeletonScreen({super.key});

  @override
  State<EditingDeckSkeletonScreen> createState() => _EditingDeckSkeletonScreenState();
}

class _EditingDeckSkeletonScreenState extends State<EditingDeckSkeletonScreen> {
  bool _snackbarShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = context.read<EditScreensCubit>().state;
    if (!_snackbarShown &&
        state is EditingDeckScreenState &&
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
    return BlocBuilder<EditScreensCubit, EditingScreenState>(
      builder: (context, state) {
        if (state is! EditingDeckSkeletonScreenState) {
          return const SizedBox.shrink();
        }

        return Scaffold(
          body: BlocListener<EditScreensCubit, EditingScreenState>(
            listener: (context, listenerState) {
              if (listenerState is EditingDeckScreenState &&
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
                EditingDeckSkeletonScreenWidget(

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
