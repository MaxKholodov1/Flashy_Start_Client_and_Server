import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/application/use_cases/user/ChangePassword.dart';
import 'package:flashy_start/application/use_cases/user/DeleteUser.dart';
import 'package:flashy_start/cubits/login_and_signup/StartupCubit.dart';
import 'package:flashy_start/domain/failures/FailureCode.dart';
import '../application/use_cases/user/GetUser.dart';
import '../domain/entities/User.dart';
import '../domain/failures/failures.dart';
import 'NavigationCubit.dart';


class MainSettingsScreen extends SettingsScreenState {}
class AccountScreen extends SettingsScreenState{
  final User user;
  AccountScreen({required this.user});
}
class MainSettingsScreenError extends SettingsScreenState{
  final FailureCode? failureCode;
  final String buttonMessage;
  final void Function(BuildContext) onRetry;
  MainSettingsScreenError({required this.failureCode, required this.onRetry, required this.buttonMessage});
}
class EditingPasswordScreenState extends SettingsScreenState{
  final User user;
  final FailureCode? failureCode;
  final bool? showSnackBarMessage;
  EditingPasswordScreenState({required this.user, this.failureCode, this.showSnackBarMessage});
}
class AccountDeletedSuccessfullyState extends SettingsScreenState{}
class SettingsScreenCubit extends Cubit<SettingsScreenState> {
  final GetUser getUser;
  final ChangePassword changePasswordUseCases;
  final DeleteUser deleteUserUseCases;
  SettingsScreenCubit({
    required MainSettingsScreen initialState,
    required this.getUser,
    required this.changePasswordUseCases,
    required this.deleteUserUseCases,
  }) : super(initialState);
  Future<void> showAccountScreen() async {
    final result = await getUser.call();

    if (result.failure != null) {
      if (result.failure is NetworkFailure){
        emit(MainSettingsScreenError(
            failureCode: FailureCode.networkError,
            buttonMessage: "refresh",
            onRetry: (BuildContext context ){
              context.read<SettingsScreenCubit>().showAccountScreen();
            }
        ));
      }else if (result.failure is AuthFailure){
        emit(MainSettingsScreenError(failureCode: FailureCode.needAuthorization,
            onRetry: (BuildContext context){
              context.read<StartupCubit>().showAuthorizationScreen();
            }, buttonMessage: "Authorization"
        ));
      }else{
        emit(MainSettingsScreenError(
            failureCode: FailureCode.unknownError,
            buttonMessage: "try again",
            onRetry: (BuildContext context ){
              context.read<SettingsScreenCubit>().showAccountScreen();
            }
        ));
      }
      return;
    }
    final User user = result.user!;
    emit(AccountScreen(user: user));
    return;
  }
  void showEditingPasswordScreen(){
    var sstate = state as AccountScreen;
    emit(EditingPasswordScreenState(user: sstate.user));
  }
  Future<void> changePassword({required String password,required String newPassword}) async{
    var sstate = state as EditingPasswordScreenState;
    var changeRes = await changePasswordUseCases.change(password: password, newPassword: newPassword);
    if (changeRes.failure == null){
      emit(AccountScreen(user: sstate.user));
    }else if (changeRes.failure is IncorrectPasswordFailure){
      emit(EditingPasswordScreenState(user: sstate.user, failureCode: FailureCode.incorrectPassword, showSnackBarMessage: true));
    }
  }
  void backToAccountScreen(){
    var sstate = state as EditingPasswordScreenState;
    emit(AccountScreen(user: sstate.user));
  }
  Future<void> deleteUser() async{
    var res = await deleteUserUseCases.delete();
    if (res.failure == null){
      emit(AccountDeletedSuccessfullyState());
    }
  }
}