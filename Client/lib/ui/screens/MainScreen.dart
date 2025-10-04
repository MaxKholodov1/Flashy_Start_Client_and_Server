import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/application/use_cases/deck_progress/DeleteDeckFromLearningDecks.dart';
import 'package:flashy_start/application/use_cases/deck_progress/GetUserLearningDeckProgressList.dart';
import 'package:flashy_start/application/use_cases/deck_progress/SelectDecksForTodayReview.dart';
import 'package:flashy_start/application/use_cases/global_card/CreateAndDeleteGlobalCard.dart';
import 'package:flashy_start/application/use_cases/global_card/GetGlobalCardsByDeckID.dart';
import 'package:flashy_start/application/use_cases/global_card/UpdateGlobalCard.dart';
import 'package:flashy_start/application/use_cases/global_deck/AddDeckToLearningDecks.dart';
import 'package:flashy_start/application/use_cases/global_deck/CreateAndDeleteGlobalDeck.dart';
import 'package:flashy_start/application/use_cases/global_deck/EditorUseCases.dart';
import 'package:flashy_start/application/use_cases/global_deck/GetEditableGlobalDecks.dart';
import 'package:flashy_start/application/use_cases/global_deck/GetGlobalDeckByID.dart';
import 'package:flashy_start/application/use_cases/global_deck/UpdateGlobalDeck.dart';
import 'package:flashy_start/application/use_cases/progress_card/GetProgressCards.dart';
import 'package:flashy_start/application/use_cases/progress_card/SelectProgressCards.dart';
import 'package:flashy_start/application/use_cases/progress_card/SubmitCardReview.dart';
import 'package:flashy_start/application/use_cases/user/ChangePassword.dart';
import 'package:flashy_start/application/use_cases/user/DeleteUser.dart';
import 'package:flashy_start/cubits/edit_screen_cubit/EditScreenCubit.dart';
import 'package:flashy_start/cubits/learning_screens_cubit/LearningScreensCubit.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
import '../../application/use_cases/global_deck/SearchGlobalDecks.dart';
import '../../application/use_cases/user/GetUser.dart';
import '../../cubits/NavigationCubit.dart';
import '../../cubits/SettingsScreenCubit.dart';
import '../../cubits/searching_screen_cubit/SearchingScreenCubit.dart';
import 'NavigationWrappers.dart';
import 'settings/SettingsScreen.dart';
class MainScreenWrapper extends StatefulWidget {
  const MainScreenWrapper({Key? key}) : super(key: key);

  @override
  State<MainScreenWrapper> createState() => _MainScreenWrapperState();
}

class _MainScreenWrapperState extends State<MainScreenWrapper> {
  late final EditScreensCubit editScreensCubit;
  late final SettingsScreenCubit settingsScreenCubit;
  late final SearchingScreensCubit searchingScreensCubit;
  late final LearningScreensCubit learningScreensCubit;

  @override
  void initState() {
    super.initState();

    final storage = context.read<StartupCubit>().storage;

    editScreensCubit = EditScreensCubit(
      createGlobalDeck: context.read<CreateAndDeleteGlobalDeck>(),
      getEditableGlobalDecks: context.read<GetEditableGlobalDecks>(),
      getGlobalDeckInfoById: context.read<GetGlobalDeckInfoById>(),
      updateGlobalDeck: context.read<UpdateGlobalDeck>(),
      createAndDeleteGlobalCard: context.read<CreateAndDeleteGlobalCard>(),
      getGlobalCardsByDeckID: context.read<GetGlobalCardsByDeckID>(),
      updateGlobalCard: context.read<UpdateGlobalCard>(),
      editorUseCases: context.read<EditorUseCases>(),
    );

    settingsScreenCubit = SettingsScreenCubit(
      initialState: MainSettingsScreen(),
      getUser: context.read<GetUser>(),
      changePasswordUseCases: context.read<ChangePassword>(),
      deleteUserUseCases: context.read<DeleteUser>(),
    );

    searchingScreensCubit = SearchingScreensCubit(
      getGlobalDeckInfoById: context.read<GetGlobalDeckInfoById>(),
      getGlobalCardsByDeckID: context.read<GetGlobalCardsByDeckID>(),
      searchGlobalDecks: context.read<SearchGlobalDecks>(),
      addDeckToLearningDecks: context.read<AddDeckToLearningDecks>(),
    );

    learningScreensCubit = LearningScreensCubit(
      getULDProgressList: context.read<GetUserLearningDeckProgressList>(),
      storage: storage,
      getGlobalDeckInfoById: context.read<GetGlobalDeckInfoById>(),
      getProgressCardsByDeckID: context.read<GetProgressCardsByDeckID>(),
      submitCardReviewUseCase: context.read<SubmitCardReview>(),
      selectProgressCards: context.read<SelectProgressCards>(),
      selectDecksForReviewToday: context.read<SelectDecksForReviewToday>(),
      deleteDeckFromLearningDecks: context.read<DeleteDeckFromLearningDecks>(),
    );
  }

  @override
  void dispose() {
    editScreensCubit.close();
    settingsScreenCubit.close();
    searchingScreensCubit.close();
    learningScreensCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: editScreensCubit),
        BlocProvider.value(value: settingsScreenCubit),
        BlocProvider.value(value: searchingScreensCubit),
        BlocProvider.value(value: learningScreensCubit),
      ],
      child: const MainScreen(),
    );
  }
}
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, MainScreenState>(
      builder: (context, state) {
        if (state is SettingsScreenState) {
          final settingsCubit = context.read<SettingsScreenCubit>();
          return BlocProvider.value(
            value: settingsCubit,
            child: SettingsScreen(),
          );
        } else if (state is EditingScreenState) {
          final editCubit = context.read<EditScreensCubit>();
          return BlocProvider.value(
            value: editCubit,
            child: const NavigationEditScreenWrapper(),
          );
        } else if (state is SearchingScreenState) {
          final searchingCubit = context.read<SearchingScreensCubit>();
          return BlocProvider.value(
            value: searchingCubit,
            child: NavigationSearchingScreenWrapper(),
          );
        } else if (state is LearningScreenState) {
          final learningCubit = context.read<LearningScreensCubit>();
          return BlocProvider.value(
            value: learningCubit,
            child: NavigationLearningScreenWrapper(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
