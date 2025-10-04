import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/use_cases/user/Login.dart';
import '../../domain/failures/failures.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {
  final String identifier;
  final String password;
  LoginInitial({this.identifier = '', this.password = ''});
}
class EmailVerificationState extends LoginState{
  final int userID;
  EmailVerificationState({required this.userID});
}
class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final int userID;
  LoginSuccess({required this.userID});
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}

class LoginCubit extends Cubit<LoginState> {
  final Login loginUseCase;

  LoginCubit({
    required this.loginUseCase,
  }) : super(LoginInitial());

  void updateIdentifier(String identifier) {
    if (state is LoginInitial) {
      emit(LoginInitial(
        identifier: identifier,
        password: (state as LoginInitial).password,
      ));
    }
  }

  void updatePassword(String password) {
    if (state is LoginInitial) {
      emit(LoginInitial(
        identifier: (state as LoginInitial).identifier,
        password: password,
      ));
    }
  }

  Future<void> submit() async {
    if (state is! LoginInitial) return;
    final current = state as LoginInitial;
    emit(LoginLoading());

    final result = await loginUseCase(
      identifier: current.identifier,
      password: current.password,
    );
    Failure? failure = result.failure;
    if (failure != null) {
      String message;
      if (result.failure is NetworkFailure) {
        message = 'Проверьте подключение к интернету.';
      } else if (failure is IncorrectPasswordFailure) {
        message = failure.message;
      } else if (failure is UserNotFoundFailure) {
        message = failure.message;
      } else if (failure is EmailVerificationFailure){
        emit(EmailVerificationState(userID: failure.userID!));
        return;
      }
      else {
        message = 'Неизвестная ошибка входа.';
        emit(LoginFailure(message));
      }
      emit(LoginFailure(message));
      emit(LoginInitial(
        identifier: current.identifier,
        password: current.password,
      ));
    } else {
      emit(LoginSuccess(userID: result.userID!));
    }
  }
}
