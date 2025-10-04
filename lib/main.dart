import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:grpc/grpc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flashy_start/application/use_cases/deck_progress/DeleteDeckFromLearningDecks.dart';
import 'package:flashy_start/application/use_cases/deck_progress/GetUserLearningDeckProgressList.dart';
import 'package:flashy_start/application/use_cases/deck_progress/SelectDecksForTodayReview.dart';
import 'package:flashy_start/application/use_cases/global_card/CreateAndDeleteGlobalCard.dart';
import 'package:flashy_start/application/use_cases/global_card/GetGlobalCardsByDeckID.dart';
import 'package:flashy_start/application/use_cases/global_card/UpdateGlobalCard.dart';
import 'package:flashy_start/application/use_cases/global_deck/AddDeckToLearningDecks.dart';
import 'package:flashy_start/application/use_cases/global_deck/CreateAndDeleteGlobalDeck.dart';
import 'package:flashy_start/application/use_cases/global_deck/GetEditableGlobalDecks.dart';
import 'package:flashy_start/application/use_cases/global_deck/GetGlobalDeckByID.dart';
import 'package:flashy_start/application/use_cases/global_deck/SearchGlobalDecks.dart';
import 'package:flashy_start/application/use_cases/global_deck/UpdateGlobalDeck.dart';
import 'package:flashy_start/application/use_cases/progress_card/GetProgressCards.dart';
import 'package:flashy_start/application/use_cases/progress_card/SelectProgressCards.dart';
import 'package:flashy_start/application/use_cases/progress_card/SubmitCardReview.dart';
import 'package:flashy_start/application/use_cases/user/ChangePassword.dart';
import 'package:flashy_start/application/use_cases/user/CheckSessionOnStart.dart';
import 'package:flashy_start/application/use_cases/user/DeleteUser.dart';
import 'package:flashy_start/application/use_cases/user/Logout.dart';
import 'package:flashy_start/application/use_cases/user/PasswordRecovery.dart';
import 'package:flashy_start/application/use_cases/user/VerifyEmail.dart';
import 'package:flashy_start/cubits/NavigationCubit.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
import 'package:flashy_start/infrastructure/grpc/GlobalCardClient.dart';
import 'package:flashy_start/infrastructure/grpc/GlobalCardGrpcRepository.dart';
import 'package:flashy_start/infrastructure/grpc/GlobalDeckClient.dart';
import 'package:flashy_start/infrastructure/grpc/GlobalDeckGrpcRepository.dart';
import 'package:flashy_start/infrastructure/grpc/UserDeckProgressClient.dart';
import 'package:flashy_start/infrastructure/grpc/UserDeckProgressGrpcRepository.dart';
import 'package:flashy_start/infrastructure/grpc/UserProgressCardClient.dart';
import 'package:flashy_start/infrastructure/grpc/UserProgressCardGrpcRepository.dart';
import 'package:flashy_start/ui/screens/StartupScreen.dart';
import 'package:flashy_start/ui/themes/Theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application/use_cases/global_deck/EditorUseCases.dart';
import 'application/use_cases/settings/ChangeLocalSettings.dart';
import 'application/use_cases/settings/GetSettings.dart';
import 'application/use_cases/user/CheckUserEmailAvailability.dart';
import 'application/use_cases/user/CheckUserNameAvailability.dart';
import 'application/use_cases/user/CheckUserPasswordAvailability.dart';
import 'application/use_cases/user/CreateUser.dart';
import 'application/use_cases/user/GetUser.dart';
import 'application/use_cases/user/Login.dart';
import 'cubits/DisplayCubit.dart';
import 'domain/entities/Settings.dart';
import 'generated/l10n.dart';
import 'infrastructure/grpc/AuthClient.dart';
import 'infrastructure/grpc/UserClient.dart';
import 'infrastructure/grpc/ValidationClient.dart';
import 'infrastructure/grpc/UserGrpcRepository.dart';
import 'infrastructure/models/SettingsDTO.dart';
import 'infrastructure/repositories/SettingsRepository.dart';
import 'infrastructure/storage/GetSecureStorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsDTOAdapter());
  if (!Hive.isBoxOpen('settings')) {
    await Hive.openBox<SettingsDTO>('settings');
  }
  final channel = ClientChannel(
    'flashystart.com',
    port: 8443,  // TLS обычно на 443
    options: const ChannelOptions(
      credentials: ChannelCredentials.secure(),
    ),
  );


  final userClient = UserGrpcClient(channel);
  final validationClient = ValidationGrpcClient(channel);
  final authClient = AuthGrpcClient(channel);
  final globalDeckClient = GlobalDeckClient(channel);
  final globalCardClient = GlobalCardClient(channel);
  final userDeckProgressClient = UserDeckProgressClient(channel);
  final userProgressCardClient = UserProgressCardClient(channel);
  final userGrpcRepository = UserGrpcRepository(
    userClient,
    authClient,
    validationClient,
  );
  final userDeckProgressGrpcRepository = UserDeckProgressGrpcRepository(userDeckProgressClient);
  final globalCardGrpcRepository = GlobalCardGrpcRepository(globalCardClient);
  final globalDeckGrpcRepository = GlobalDeckGrpcRepository(globalDeckClient);
  final userProgressCardGrpcRepository = UserProgressCardGrpcRepository(userProgressCardClient);

  // final prefs = await SharedPreferences.getInstance();
  // await prefs.clear();


  final checkUserNameAvailability = CheckUserNameAvailability(userGrpcRepository);
  final checkUserEmailAvailability = CheckUserEmailAvailability(userGrpcRepository);
  final checkUserPasswordAvailability = CheckUserPasswordAvailability(userGrpcRepository);
  final storage = getSecureStorage();
  final createUser = CreateUser(userGrpcRepository, storage);
  final login = Login(userGrpcRepository, storage);
  final checkSessionOnstart = CheckSessionOnStart(userGrpcRepository);
  final getUser = GetUser(userGrpcRepository, storage);
  final createDeck = CreateAndDeleteGlobalDeck(globalDeckGrpcRepository, storage, userGrpcRepository);
  final getEditableGlobalDecks = GetEditableGlobalDecks(globalDeckGrpcRepository, storage, userGrpcRepository);
  final logout = Logout(storage);
  final updateGlobalDeck = UpdateGlobalDeck(globalDeckGrpcRepository, storage, userGrpcRepository);

  final getSettings = GetSettings(SettingsRepository());
  final changeLocalSettings = ChangeLocalSettings(SettingsRepository());
  final getGlobalDeckByID = GetGlobalDeckInfoById(globalDeckGrpcRepository, storage, userGrpcRepository);
  final createAndDeleteGlobalCard = CreateAndDeleteGlobalCard(globalCardGrpcRepository, storage, userGrpcRepository);
  final getGlobalCardsByDeckID = GetGlobalCardsByDeckID(globalCardGrpcRepository, storage, userGrpcRepository);
  final updateGLobalCard = UpdateGlobalCard(globalCardGrpcRepository, storage, userGrpcRepository);
  final getUserLearningDeckProgressList = GetUserLearningDeckProgressList(userDeckProgressGrpcRepository, storage, userGrpcRepository);
  final searchGlobalDecks = SearchGlobalDecks(globalDeckGrpcRepository, storage, userGrpcRepository);
  final addDeckToLearningDecks = AddDeckToLearningDecks(globalDeckGrpcRepository, storage, userGrpcRepository);
  final getProgressCardsByDeckID = GetProgressCardsByDeckID(userProgressCardGrpcRepository, storage, userGrpcRepository);
  final submitCardReview = SubmitCardReview(userProgressCardGrpcRepository, storage, userGrpcRepository);
  final selectProgressCards = SelectProgressCards(userProgressCardGrpcRepository, storage, userGrpcRepository);
  final selectDecksForTodayReview = SelectDecksForReviewToday(userDeckProgressGrpcRepository, storage, userGrpcRepository);
  final editorUseCases = EditorUseCases(globalDeckGrpcRepository, storage, userGrpcRepository);
  final deleteDeckFromLearningDecks = DeleteDeckFromLearningDecks(userDeckProgressGrpcRepository, storage, userGrpcRepository);
  final verifyEmail = EmailUseCases(userGrpcRepository, storage);
  final changePassword = ChangePassword(storage, userGrpcRepository);
  final paswordRecovery = PasswordRecovery(userGrpcRepository);
  final deleteUser = DeleteUser(storage, userGrpcRepository);
  final displayCubit = DisplayCubit(
    changeLocalSettings: changeLocalSettings,
    initialSettings: Settings.defaultSettings,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<GetUser>.value(value: getUser),
        Provider<CreateAndDeleteGlobalDeck>.value(value: createDeck,),
        Provider<CheckUserPasswordAvailability>.value(value: checkUserPasswordAvailability,),
        Provider<CheckUserNameAvailability>.value(value: checkUserNameAvailability,),
        Provider<CheckUserEmailAvailability>.value(value: checkUserEmailAvailability,),
        Provider<GetEditableGlobalDecks>.value(value: getEditableGlobalDecks,),
        Provider<Login>.value(value: login),
        Provider<CreateUser>.value(value: createUser),
        Provider<GetGlobalDeckInfoById>.value(value: getGlobalDeckByID),
        Provider<UpdateGlobalDeck>.value(value: updateGlobalDeck),
        Provider<CreateAndDeleteGlobalCard>.value(value: createAndDeleteGlobalCard),
        Provider<GetGlobalCardsByDeckID>.value(value: getGlobalCardsByDeckID),
        Provider<UpdateGlobalCard>.value(value: updateGLobalCard),
        Provider<GetUserLearningDeckProgressList>.value(value: getUserLearningDeckProgressList),
        Provider<SearchGlobalDecks>.value(value: searchGlobalDecks),
        Provider<AddDeckToLearningDecks>.value(value: addDeckToLearningDecks),
        Provider<GetProgressCardsByDeckID>.value(value: getProgressCardsByDeckID),
        Provider<SubmitCardReview>.value(value: submitCardReview),
        Provider<SelectProgressCards>.value(value: selectProgressCards),
        Provider<SelectDecksForReviewToday>.value(value: selectDecksForTodayReview),
        Provider<EditorUseCases>.value(value: editorUseCases),
        Provider<DeleteDeckFromLearningDecks>.value(value: deleteDeckFromLearningDecks),
        Provider<ChangePassword>.value(value: changePassword),
        Provider<DeleteUser>.value(value: deleteUser),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: displayCubit),
          BlocProvider(
            create: (context) {
              final cubit = StartupCubit(
                getSettings,
                storage,
                checkSessionOnstart,
                logout,
                verifyEmail,
                paswordRecovery,
              );
              cubit.init(context);
              return cubit;
            },
          ),
          BlocProvider(
            create: (context) => NavigationCubit(SettingsScreenState()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayCubit, Settings>(
      builder: (context, displaySettings) {
        return BlocBuilder<StartupCubit, StartupState>(
          builder: (context, startupState) {
            return MaterialApp(
              locale: displaySettings.locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              theme: lightTheme(displaySettings),
              darkTheme: darkTheme(displaySettings),
              themeMode: displaySettings.isLightMode
                  ? ThemeMode.light
                  : ThemeMode.dark,
              home: const StartupScreen(),
            );
          },
        );
      },
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:grpc/grpc.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'package:flashy_start/application/use_cases/deck_progress/DeleteDeckFromLearningDecks.dart';
// import 'package:flashy_start/application/use_cases/deck_progress/GetUserLearningDeckProgressList.dart';
// import 'package:flashy_start/application/use_cases/deck_progress/SelectDecksForTodayReview.dart';
// import 'package:flashy_start/application/use_cases/global_card/CreateAndDeleteGlobalCard.dart';
// import 'package:flashy_start/application/use_cases/global_card/GetGlobalCardsByDeckID.dart';
// import 'package:flashy_start/application/use_cases/global_card/UpdateGlobalCard.dart';
// import 'package:flashy_start/application/use_cases/global_deck/AddDeckToLearningDecks.dart';
// import 'package:flashy_start/application/use_cases/global_deck/CreateAndDeleteGlobalDeck.dart';
// import 'package:flashy_start/application/use_cases/global_deck/GetEditableGlobalDecks.dart';
// import 'package:flashy_start/application/use_cases/global_deck/GetGlobalDeckByID.dart';
// import 'package:flashy_start/application/use_cases/global_deck/SearchGlobalDecks.dart';
// import 'package:flashy_start/application/use_cases/global_deck/UpdateGlobalDeck.dart';
// import 'package:flashy_start/application/use_cases/progress_card/GetProgressCards.dart';
// import 'package:flashy_start/application/use_cases/progress_card/SelectProgressCards.dart';
// import 'package:flashy_start/application/use_cases/progress_card/SubmitCardReview.dart';
// import 'package:flashy_start/application/use_cases/settings/ChangeLocalSettings.dart';
// import 'package:flashy_start/application/use_cases/settings/GetSettings.dart';
// import 'package:flashy_start/application/use_cases/user/ChangePassword.dart';
// import 'package:flashy_start/application/use_cases/user/CheckSessionOnStart.dart';
// import 'package:flashy_start/application/use_cases/user/DeleteUser.dart';
// import 'package:flashy_start/application/use_cases/user/Logout.dart';
// import 'package:flashy_start/application/use_cases/user/PasswordRecovery.dart';
// import 'package:flashy_start/application/use_cases/user/VerifyEmail.dart';
// import 'package:flashy_start/application/use_cases/user/CheckUserEmailAvailability.dart';
// import 'package:flashy_start/application/use_cases/user/CheckUserNameAvailability.dart';
// import 'package:flashy_start/application/use_cases/user/CheckUserPasswordAvailability.dart';
// import 'package:flashy_start/application/use_cases/user/CreateUser.dart';
// import 'package:flashy_start/application/use_cases/user/GetUser.dart';
// import 'package:flashy_start/application/use_cases/user/Login.dart';
// import 'package:flashy_start/cubits/NavigationCubit.dart';
// import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
// import 'package:flashy_start/cubits/DisplayCubit.dart';
// import 'package:flashy_start/domain/entities/Settings.dart';
// import 'package:flashy_start/generated/l10n.dart';
// import 'package:flashy_start/infrastructure/grpc/AuthClient.dart';
// import 'package:flashy_start/infrastructure/grpc/UserClient.dart';
// import 'package:flashy_start/infrastructure/grpc/ValidationClient.dart';
// import 'package:flashy_start/infrastructure/grpc/UserGrpcRepository.dart';
// import 'package:flashy_start/infrastructure/grpc/GlobalCardClient.dart';
// import 'package:flashy_start/infrastructure/grpc/GlobalCardGrpcRepository.dart';
// import 'package:flashy_start/infrastructure/grpc/GlobalDeckClient.dart';
// import 'package:flashy_start/infrastructure/grpc/GlobalDeckGrpcRepository.dart';
// import 'package:flashy_start/infrastructure/grpc/UserDeckProgressClient.dart';
// import 'package:flashy_start/infrastructure/grpc/UserDeckProgressGrpcRepository.dart';
// import 'package:flashy_start/infrastructure/grpc/UserProgressCardClient.dart';
// import 'package:flashy_start/infrastructure/grpc/UserProgressCardGrpcRepository.dart';
// import 'package:flashy_start/infrastructure/repositories/SettingsRepository.dart';
// import 'package:flashy_start/infrastructure/storage/GetSecureStorage.dart';
// import 'package:flashy_start/ui/screens/StartupScreen.dart';
// import 'package:flashy_start/ui/themes/Theme.dart';
//
// import 'application/use_cases/global_deck/EditorUseCases.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Hive
//   await Hive.initFlutter();
//   Hive.registerAdapter(SettingsDTOAdapter());
//   if (!Hive.isBoxOpen('settings')) {
//     await Hive.openBox<SettingsDTO>('settings');
//   }
//
//   // gRPC
//   final channel = ClientChannel(
//     'flashystart.com',
//     port: 8443,
//     options: const ChannelOptions(credentials: ChannelCredentials.secure()),
//   );
//
//   final userClient = UserGrpcClient(channel);
//   final validationClient = ValidationGrpcClient(channel);
//   final authClient = AuthGrpcClient(channel);
//   final globalDeckClient = GlobalDeckClient(channel);
//   final globalCardClient = GlobalCardClient(channel);
//   final userDeckProgressClient = UserDeckProgressClient(channel);
//   final userProgressCardClient = UserProgressCardClient(channel);
//
//   final userGrpcRepository = UserGrpcRepository(userClient, authClient, validationClient);
//   final userDeckProgressGrpcRepository = UserDeckProgressGrpcRepository(userDeckProgressClient);
//   final globalCardGrpcRepository = GlobalCardGrpcRepository(globalCardClient);
//   final globalDeckGrpcRepository = GlobalDeckGrpcRepository(globalDeckClient);
//   final userProgressCardGrpcRepository = UserProgressCardGrpcRepository(userProgressCardClient);
//
//   final storage = getSecureStorage();
//
//   // UseCases
//   final checkUserNameAvailability = CheckUserNameAvailability(userGrpcRepository);
//   final checkUserEmailAvailability = CheckUserEmailAvailability(userGrpcRepository);
//   final checkUserPasswordAvailability = CheckUserPasswordAvailability(userGrpcRepository);
//   final createUser = CreateUser(userGrpcRepository, storage);
//   final login = Login(userGrpcRepository, storage);
//   final checkSessionOnstart = CheckSessionOnStart(userGrpcRepository);
//   final getUser = GetUser(userGrpcRepository, storage);
//   final createDeck = CreateAndDeleteGlobalDeck(globalDeckGrpcRepository, storage, userGrpcRepository);
//   final getEditableGlobalDecks = GetEditableGlobalDecks(globalDeckGrpcRepository, storage, userGrpcRepository);
//   final logout = Logout(storage);
//   final updateGlobalDeck = UpdateGlobalDeck(globalDeckGrpcRepository, storage, userGrpcRepository);
//   final getSettings = GetSettings(SettingsRepository());
//   final changeLocalSettings = ChangeLocalSettings(SettingsRepository());
//   final getGlobalDeckByID = GetGlobalDeckInfoById(globalDeckGrpcRepository, storage, userGrpcRepository);
//   final createAndDeleteGlobalCard = CreateAndDeleteGlobalCard(globalCardGrpcRepository, storage, userGrpcRepository);
//   final getGlobalCardsByDeckID = GetGlobalCardsByDeckID(globalCardGrpcRepository, storage, userGrpcRepository);
//   final updateGLobalCard = UpdateGlobalCard(globalCardGrpcRepository, storage, userGrpcRepository);
//   final getUserLearningDeckProgressList = GetUserLearningDeckProgressList(userDeckProgressGrpcRepository, storage, userGrpcRepository);
//   final searchGlobalDecks = SearchGlobalDecks(globalDeckGrpcRepository, storage, userGrpcRepository);
//   final addDeckToLearningDecks = AddDeckToLearningDecks(globalDeckGrpcRepository, storage, userGrpcRepository);
//   final getProgressCardsByDeckID = GetProgressCardsByDeckID(userProgressCardGrpcRepository, storage, userGrpcRepository);
//   final submitCardReview = SubmitCardReview(userProgressCardGrpcRepository, storage, userGrpcRepository);
//   final selectProgressCards = SelectProgressCards(userProgressCardGrpcRepository, storage, userGrpcRepository);
//   final selectDecksForTodayReview = SelectDecksForReviewToday(userDeckProgressGrpcRepository, storage, userGrpcRepository);
//   final editorUseCases = EditorUseCases(globalDeckGrpcRepository, storage, userGrpcRepository);
//   final deleteDeckFromLearningDecks = DeleteDeckFromLearningDecks(userDeckProgressGrpcRepository, storage, userGrpcRepository);
//   final verifyEmail = EmailUseCases(userGrpcRepository, storage);
//   final changePassword = ChangePassword(storage, userGrpcRepository);
//   final paswordRecovery = PasswordRecovery(userGrpcRepository);
//   final deleteUser = DeleteUser(storage, userGrpcRepository);
//   final displayCubit = DisplayCubit(changeLocalSettings: changeLocalSettings, initialSettings: Settings.defaultSettings);
//
//   // Запуск приложения с DevicePreview
//   runApp(
//     DevicePreview(
//       enabled: true, // <-- включаем превью устройств
//       builder: (context) => MultiProvider(
//         providers: [
//           Provider<GetUser>.value(value: getUser),
//           Provider<CreateAndDeleteGlobalDeck>.value(value: createDeck),
//           Provider<CheckUserPasswordAvailability>.value(value: checkUserPasswordAvailability),
//           Provider<CheckUserNameAvailability>.value(value: checkUserNameAvailability),
//           Provider<CheckUserEmailAvailability>.value(value: checkUserEmailAvailability),
//           Provider<GetEditableGlobalDecks>.value(value: getEditableGlobalDecks),
//           Provider<Login>.value(value: login),
//           Provider<CreateUser>.value(value: createUser),
//           Provider<GetGlobalDeckInfoById>.value(value: getGlobalDeckByID),
//           Provider<UpdateGlobalDeck>.value(value: updateGlobalDeck),
//           Provider<CreateAndDeleteGlobalCard>.value(value: createAndDeleteGlobalCard),
//           Provider<GetGlobalCardsByDeckID>.value(value: getGlobalCardsByDeckID),
//           Provider<UpdateGlobalCard>.value(value: updateGLobalCard),
//           Provider<GetUserLearningDeckProgressList>.value(value: getUserLearningDeckProgressList),
//           Provider<SearchGlobalDecks>.value(value: searchGlobalDecks),
//           Provider<AddDeckToLearningDecks>.value(value: addDeckToLearningDecks),
//           Provider<GetProgressCardsByDeckID>.value(value: getProgressCardsByDeckID),
//           Provider<SubmitCardReview>.value(value: submitCardReview),
//           Provider<SelectProgressCards>.value(value: selectProgressCards),
//           Provider<SelectDecksForReviewToday>.value(value: selectDecksForTodayReview),
//           Provider<EditorUseCases>.value(value: editorUseCases),
//           Provider<DeleteDeckFromLearningDecks>.value(value: deleteDeckFromLearningDecks),
//           Provider<ChangePassword>.value(value: changePassword),
//           Provider<DeleteUser>.value(value: deleteUser),
//         ],
//         child: MultiBlocProvider(
//           providers: [
//             BlocProvider.value(value: displayCubit),
//             BlocProvider(
//               create: (context) {
//                 final cubit = StartupCubit(getSettings, storage, checkSessionOnstart, logout, verifyEmail, paswordRecovery);
//                 cubit.init(context);
//                 return cubit;
//               },
//             ),
//             BlocProvider(create: (context) => NavigationCubit(SettingsScreenState())),
//           ],
//           child: const MyApp(),
//         ),
//       ),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DisplayCubit, Settings>(
//       builder: (context, displaySettings) {
//         return BlocBuilder<StartupCubit, StartupState>(
//           builder: (context, startupState) {
//             return MaterialApp(
//               useInheritedMediaQuery: true,          // <-- важно для DevicePreview
//               locale: DevicePreview.locale(context), // <-- важно для DevicePreview
//               builder: DevicePreview.appBuilder,     // <-- важно для DevicePreview
//               localizationsDelegates: const [
//                 S.delegate,
//                 GlobalMaterialLocalizations.delegate,
//                 GlobalWidgetsLocalizations.delegate,
//                 GlobalCupertinoLocalizations.delegate,
//               ],
//               supportedLocales: S.delegate.supportedLocales,
//               debugShowCheckedModeBanner: false,
//               theme: lightTheme(displaySettings),
//               darkTheme: darkTheme(displaySettings),
//               themeMode: displaySettings.isLightMode ? ThemeMode.light : ThemeMode.dark,
//               home: const StartupScreen(),
//             );
//           },
//         );
//       },
//     );
//   }
// }

