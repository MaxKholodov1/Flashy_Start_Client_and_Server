
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/ui/widgets/editing/main/CreateDeckButtonWidget.dart';
import 'package:flashy_start/ui/widgets/editing/main/EditableDeckWidget.dart';

import '../../../../cubits/edit_screen_cubit/EditScreenCubit.dart';
import '../../../../cubits/NavigationCubit.dart';
import '../../../../cubits/edit_screen_cubit/EditingStates.dart';
import '../../../../domain/entities/GlobalDeck.dart';
import '../../../../generated/FailureCodeLocalizer.dart';


class MainEditScreenWidget extends StatefulWidget {
  final List<searchResultDeck>? editableGlobalDecks;
  final double? initialOffset;

  const MainEditScreenWidget({
    super.key,
    required this.editableGlobalDecks,
    this.initialOffset,
  });

  @override
  State<MainEditScreenWidget> createState() => _MainEditScreenWidgetState();
}

class _MainEditScreenWidgetState extends State<MainEditScreenWidget> {
  late final ScrollController controller;
  double currentOffset = 0.0;

  @override
  void initState() {
    super.initState();

    // Если передан начальный offset, используем его
    final offset = widget.initialOffset ?? 0.0;

    controller = ScrollController(initialScrollOffset: offset);
    currentOffset = offset;

    controller.addListener(() {
      setState(() {
        currentOffset = controller.offset;
      });
    });
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = context.read<EditScreensCubit>().state;
    if (state is MainEditingScreenState &&
        state.showSnackBarMessage == true &&
        state.failureCode != null) {
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.editableGlobalDecks != null) {
      return BlocListener<EditScreensCubit, EditingScreenState>(
        listener: (context, state) {
          if (state is MainEditingScreenState &&
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
        child: ListView.builder(
          controller: controller,
          itemCount: (widget.editableGlobalDecks!.isNotEmpty
              ? widget.editableGlobalDecks!.length + 1
              : 1),
          itemBuilder: (context, index) {
            if (index == 0) {
              return const CreateDeckButtonWidget();
            }
            return EditableDeckWidget(
              currentEditableGlobalDeck: widget.editableGlobalDecks![index - 1],
              currentOffset: currentOffset,
            );
          },
        ),
      );
    } else {
      return BlocListener<EditScreensCubit, EditingScreenState>(
        listener: (context, state) {
          if (state is MainEditingScreenState &&
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
        child: const CreateDeckButtonWidget(),
      );
    }
  }
}
