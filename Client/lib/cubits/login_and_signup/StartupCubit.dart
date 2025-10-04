import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/application/use_cases/user/CheckSessionOnStart.dart';
import 'package:flashy_start/application/use_cases/user/Logout.dart';
import 'package:flashy_start/application/use_cases/user/PasswordRecovery.dart';
import 'package:flashy_start/application/use_cases/user/VerifyEmail.dart';
import 'package:flashy_start/domain/failures/failures.dart';
import 'package:flashy_start/infrastructure/storage/SecureStorageService.dart';
import '../../application/use_cases/settings/GetSettings.dart';
import '../../domain/entities/Settings.dart';
import '../../domain/failures/FailureCode.dart';

sealed class StartupState {}

class StartupLoading extends StartupState {}
class StartupConnecting extends StartupState{}
class StartupNeedsLogIn extends StartupState {
}
class Authorization extends StartupNeedsLogIn{
}
class PasswordRecoveryState extends StartupState{
  final FailureCode? failureCode;
  PasswordRecoveryState({this.failureCode});
}
class Registration extends StartupNeedsLogIn{
}
class GetSettingsForDisplayCubit extends StartupState{
  Settings? settings;
  GetSettingsForDisplayCubit(this.settings);
}
class EmailVerification extends StartupState{
  final FailureCode? failureCode;
  int userID;
  EmailVerification({required this.userID, this.failureCode});
}
class StartupReady extends StartupState {
  final int userID;
  StartupReady ({required this.userID});
}
class StartupCubit extends Cubit<StartupState> {
  final GetSettings getSettings;
  final SecureStorageService storage;
  final CheckSessionOnStart checkSessionOnStart;
  final Logout logoutUseCase;
  final EmailUseCases emailUseCases;
  final PasswordRecovery passwordRecoveryUseCases;
  StartupCubit(
      this.getSettings,
      this.storage,
      this.checkSessionOnStart,
      this.logoutUseCase,
      this.emailUseCases,
      this.passwordRecoveryUseCases,
      ) : super(StartupLoading());

  Future<void> init(BuildContext context) async {
    emit(StartupLoading());
    final stopwatch = Stopwatch()..start();
    Settings? existingSettings = await getSettings.execute();
    var res =  await checkSessionOnStart.call(storage: storage, );
    if (res.isActive == false){
      if (res.failure == null) {
        final elapsed = stopwatch.elapsed;
        final remaining = Duration(seconds: 1) - elapsed;
        if (remaining > Duration.zero) {
          await Future.delayed(remaining);
        }
        emit(Authorization());
      }else{
        emit(StartupConnecting());
      }
    }else {
      emit(GetSettingsForDisplayCubit(existingSettings));
      final   elapsed = stopwatch.elapsed;
      final remaining = Duration(seconds: 1) - elapsed;
      if (remaining > Duration.zero) {
        await Future.delayed(remaining);
      }
      emit(StartupReady(userID:  res.userID!));
    }
  }
  Future<void> showAuthorizationScreen() async {
    emit(Authorization());
  }
  Future<void> showRegistrationScreen() async {
    emit(Registration());
  }
  Future<void> logout() async{
    await logoutUseCase.call();
    emit(Registration());
  }
  void showEmailVerificationScreen(int userID){
    emit(EmailVerification(userID: userID));
  }
  void showFinishScreen(int userID){
    emit(StartupReady(userID: userID));
  }
  Future<void> verifyEmailFunction(String code) async {
    var sstate = state as EmailVerification;
    var res = await emailUseCases.verify(userID: sstate.userID, code: code);
    if (res.failure == null){
      emit(StartupReady(userID: sstate.userID));
    }else if (res.failure is EmailVerificationInvalidCode){
      emit(EmailVerification(userID: sstate.userID, failureCode: FailureCode.incorrectOrExpiredCode));
    }else{
      emit(EmailVerification(userID: sstate.userID, failureCode: FailureCode.unknownError));
    }
  }
  Future<void> sendVerificationCode() async {
    var sstate = state as EmailVerification;
    var res = await emailUseCases.send(userID: sstate.userID);
    if (res.failure == null){
      emit(EmailVerification(userID: sstate.userID));
    }else if (res.failure is EmailVerificationInvalidCode){
      emit(EmailVerification(userID: sstate.userID, failureCode: FailureCode.unknownError));
    }else{
      emit(EmailVerification(userID: sstate.userID, failureCode: FailureCode.unknownError));
    }
  }
  Future<void> passwordRecovery(String usernameOrEmail) async {
    var res = await passwordRecoveryUseCases.call(usernameOrEmail: usernameOrEmail);
    if (res.failure == null){
      emit(PasswordRecoveryState(failureCode: FailureCode.newPasswordSuccessfullySent));
      await Future.delayed(const Duration(seconds: 2));
      emit(Authorization());
      return;
    }
    if (res.failure is NetworkFailure){
      emit(PasswordRecoveryState(failureCode: FailureCode.networkError));
    }else if (res.failure is IncorrectPasswordFailure){
      emit(PasswordRecoveryState(failureCode: FailureCode.incorrectPassword));
    }else if (res.failure is UserNotFoundFailure){
      emit(PasswordRecoveryState(failureCode: FailureCode.userNotFound));
    }else{
      emit(PasswordRecoveryState(failureCode: FailureCode.unknownError));
    }
  }
  void showPasswordRecoveryScreen(){
  emit(PasswordRecoveryState());
  }
}
