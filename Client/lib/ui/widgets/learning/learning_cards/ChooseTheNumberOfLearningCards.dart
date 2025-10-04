import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/cubits/NavigationCubit.dart';
import 'package:flashy_start/cubits/learning_screens_cubit/LearningStates.dart';
import '../../../../generated/l10n.dart';
import '../../../../cubits/learning_screens_cubit/LearningScreensCubit.dart';
import '../../../themes/app_colors.dart';

class ChooseNumberOfLearningCardsWidget extends StatelessWidget {
  final int numberOfCards;

  const ChooseNumberOfLearningCardsWidget({
    super.key,
    required this.numberOfCards,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    return BlocBuilder<LearningScreensCubit, LearningScreenState>(
      builder: (context, state) {
        final options = <int>[];

        if (numberOfCards > 5) options.add(5);
        if (numberOfCards > 10) options.add(10);
        if (numberOfCards > 15) options.add(15);
        if (numberOfCards > 20) options.add(20);
        if (numberOfCards > 25) options.add(25);
        if (numberOfCards > 30) options.add(30);
        if (numberOfCards >= 80) options.add(numberOfCards ~/ 2);
        options.add(numberOfCards);

        return Scaffold(
          backgroundColor: colors.surfaceBackground,
          appBar: AppBar(
            backgroundColor: colors.backGround,
            elevation: 0,
            title: Text(
              S.of(context).chooseNumberOfCardsToLearn,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context
                    .read<LearningScreensCubit>()
                    .showLearningDeckInfo((state as SelectCountState).globalDeckInfo.globalDeck.ID, null);
              },
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: options.map((count) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                          width: 1.5,
                        ),
                      ),
                      onPressed: () {
                        context.read<LearningScreensCubit>().startLearning(
                          (state as SelectCountState).globalDeckInfo,
                          state.progressCards, count
                        );
                      },
                      child: Text(
                        count == numberOfCards
                            ? S.of(context).allCardsCount(count)
                            : S.of(context).countCards(count),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
