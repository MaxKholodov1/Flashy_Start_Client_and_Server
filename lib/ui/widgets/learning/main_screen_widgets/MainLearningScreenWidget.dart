import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/ui/widgets/learning/main_screen_widgets/UserProgressDeckWidget.dart';

import '../../../../cubits/NavigationCubit.dart';
import '../../../../cubits/learning_screens_cubit/LearningScreensCubit.dart';
import '../../../../cubits/learning_screens_cubit/LearningStates.dart';
import '../../../../domain/entities/UserDeckProgress.dart';
import '../../../../generated/FailureCodeLocalizer.dart';
import '../../../../generated/l10n.dart';

class MainLearningScreenWidget extends StatefulWidget {
  final List<UserDeckProgress>? userProgressDecks;
  final double? initialOffset;
  final void Function(double offset)? onDispose;

  const MainLearningScreenWidget({
    super.key,
    required this.userProgressDecks,
    this.initialOffset,
    this.onDispose,
  });

  @override
  State<MainLearningScreenWidget> createState() => _MainLearningScreenWidgetState();
}

class _MainLearningScreenWidgetState extends State<MainLearningScreenWidget> {
  late final ScrollController _scrollController;
  bool _snackbarShown = false;

  @override
  void initState() {
    super.initState();

    final initialOffset = widget.initialOffset ??
        context.read<LearningScreensCubit>().getMainEditingOffset();

    _scrollController = ScrollController(initialScrollOffset: initialOffset);

    _scrollController.addListener(() {
      final offset = _scrollController.offset;
      context.read<LearningScreensCubit>().saveMainScreenOffset(offset);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = context.read<LearningScreensCubit>().state;
    if (!_snackbarShown &&
        state is MainLearningScreenState &&
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LearningScreensCubit, LearningScreenState>(
      listener: (context, state) {
        if (state is MainLearningScreenState &&
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
      child: widget.userProgressDecks != null && widget.userProgressDecks!.isNotEmpty
          ? ListView.builder(
        itemCount: widget.userProgressDecks!.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return UserProgressDeckWidget(
            getCurrentOffset: () => _scrollController.offset,
            currentUserDeckProgress: widget.userProgressDecks![index],
          );
        },
      )
          : Center(
        child: Text(S.of(context).noDecksForLearning),
      ),
    );
  }
}
