import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flushbar/flushbar.dart';
import '../../../cubits/NavigationCubit.dart';
import '../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../cubits/edit_screen_cubit/EditingStates.dart';
import '../../../generated/FailureCodeLocalizer.dart';
import '../../widgets/editing/DeckCreatingWidget.dart';
import '../../widgets/editing/main/MainEditScreenWidget.dart';

class CreatingDeckScreen extends StatefulWidget {
  const CreatingDeckScreen({super.key});

  @override
  State<CreatingDeckScreen> createState() => _CreatingDeckScreenState();
}

class _CreatingDeckScreenState extends State<CreatingDeckScreen> {
  bool _snackbarShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = context.read<EditScreensCubit>().state;
    if (!_snackbarShown &&
        state is CreateDeckScreenState &&
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
    return BlocListener<EditScreensCubit, EditingScreenState>(
      listener: (context, state) {
        if (state is CreateDeckScreenState &&
            state.showSnackBarMessage == true &&
            state.failureCode != null) {
          Flushbar(
            message: getFailureMessage(context, state.failureCode!) ,
            duration: const Duration(seconds: 3),
            margin: const EdgeInsets.all(16),
            borderRadius: BorderRadius.circular(8),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(context);
        }
      },
      child: Stack(
        children: [
          // Список колод
          MainEditScreenWidget(
            editableGlobalDecks:
            (context.read<EditScreensCubit>().state as CreateDeckScreenState)
                .editableGlobalDecks,
          ),

          // Полупрозрачный фон
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                context.read<EditScreensCubit>().cancelCreatingDeck();
              },
              child: Container(
                color: const Color.fromARGB(122, 0, 0, 0),
              ),
            ),
          ),

          // Форма создания колоды
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
                                ? MediaQuery.of(context).viewInsets.bottom
                                : 0),
                      ),
                      child: const Center(
                        child: DeckCreatingWidget(),
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
  }
}
