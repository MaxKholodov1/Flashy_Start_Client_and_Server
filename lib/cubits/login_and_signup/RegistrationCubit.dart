import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashy_start/application/use_cases/user/CheckUserNameAvailability.dart';
import 'package:flashy_start/application/use_cases/user/CheckUserEmailAvailability.dart';
import 'package:flashy_start/application/use_cases/user/CheckUserPasswordAvailability.dart';
import 'package:flashy_start/application/use_cases/user/CreateUser.dart';
import 'package:flashy_start/domain/failures/failures.dart';

abstract class RegistrationState{}
class RegistrationSuccess extends RegistrationState{
  final int userID;
  RegistrationSuccess({required this.userID});
}
class RegistrationDefUserSuccess extends RegistrationState{
  final int userID;
  RegistrationDefUserSuccess({required this.userID});
}
class RegistrationFieldsState extends RegistrationState{
  final String userName;
  final String? userNameError;

  final String userEmail;
  final String? userEmailError;

  final String password;
  final String? passwordError;

  final bool showErrorSnackbar;
  final String errorMessageSnackBar;
  final bool isChecking;
  final bool registrationSuccess;

  RegistrationFieldsState({
    this.userName = '',
    this.userNameError,
    this.userEmail = '',
    this.userEmailError,
    this.password = '',
    this.passwordError,
    this.showErrorSnackbar = false,
    this.errorMessageSnackBar = "",
    this.isChecking = false,
    this.registrationSuccess = false,
  });

  RegistrationFieldsState copyWith({
    String? userName,
    String? userNameError,
    String? userEmail,
    String? userEmailError,
    String? password,
    String? passwordError,
    bool? showErrorSnackbar,
    String? errorMessageSnackBar,
    bool? isChecking,
    bool? registrationSuccess,
  }) {
    return RegistrationFieldsState(
      userName: userName ?? this.userName,
      userNameError: userNameError,
      userEmail: userEmail ?? this.userEmail,
      userEmailError: userEmailError,
      password: password ?? this.password,
      passwordError: passwordError,
      showErrorSnackbar: showErrorSnackbar ?? false,
      errorMessageSnackBar: errorMessageSnackBar ?? "",
      isChecking: isChecking ?? false,
      registrationSuccess: registrationSuccess ?? this.registrationSuccess,
    );
  }
}

class RegistrationCubit extends Cubit<RegistrationState> {
  final CheckUserNameAvailability checkUserNameAvailability;
  final CheckUserEmailAvailability checkUserEmailAvailability;
  final CheckUserPasswordAvailability checkUserPasswordAvailability;
  final CreateUser createUser;

  RegistrationCubit({
    required this.checkUserNameAvailability,
    required this.checkUserEmailAvailability,
    required this.checkUserPasswordAvailability,
    required this.createUser,
  }) : super( RegistrationFieldsState());

  Future<void> userNameChanged(String userName) async {
    final currentState = state as RegistrationFieldsState;
    emit(currentState.copyWith(
      userName: userName,
      isChecking: true,
      showErrorSnackbar: false,
      errorMessageSnackBar: currentState.errorMessageSnackBar,
      userEmailError: currentState.userEmailError,
      passwordError: currentState.passwordError,
      userNameError: currentState.userNameError,
    ));

    final result = await checkUserNameAvailability.call(userName: userName);

    if (result.failure == null) {
      emit(currentState.copyWith(
        userName: userName,
        userNameError: result.isAvailable ? null : 'Имя занято',
        isChecking: false,
        errorMessageSnackBar: "",
        userEmailError: currentState.userEmailError,
        passwordError: currentState.passwordError,
      ));
    } else {
      _handleFailure(result.failure!);
    }
  }
  Future<void> userEmailChanged(String userEmail) async {
    final currentState = state as RegistrationFieldsState;
    emit(currentState.copyWith(
      userEmail: userEmail,
      isChecking: true,
      showErrorSnackbar: false,
      errorMessageSnackBar: "",
      userNameError: currentState.userNameError,
      passwordError: currentState.passwordError,
      userEmailError: currentState.userEmailError,
    ));

    final result = await checkUserEmailAvailability.call(userEmail: userEmail);

    if (result.failure == null) {
      emit(currentState.copyWith(
        userEmail: userEmail,
        userEmailError: result.isAvailable ? null : 'Email занят',
        isChecking: false,
        errorMessageSnackBar: "",
        userNameError: currentState.userNameError,
        passwordError: currentState.passwordError,
      ));
    } else {
      _handleFailure(result.failure!);
    }
  }

  Future<void> passwordChanged(String password) async {
    final currentState = state as RegistrationFieldsState;
    emit(currentState.copyWith(
      password: password,
      isChecking: true,
      showErrorSnackbar: false,
      errorMessageSnackBar: "",
      userNameError: currentState.userNameError,
      userEmailError: currentState.userEmailError,
      passwordError: currentState.passwordError
    ));

    final result = await checkUserPasswordAvailability.call(password: password);

    if (result.failure == null) {
      emit(currentState.copyWith(
        password: password,
        passwordError: null,
        isChecking: false,
        errorMessageSnackBar: "",
        userNameError: currentState.userNameError,
        userEmailError: currentState.userEmailError,
      ));
    } else {
      _handleFailure(result.failure!);
    }
  }

  Future<void> registerUser() async {
    final currentState = state as RegistrationFieldsState;
    emit(currentState.copyWith(
      isChecking: true,
      showErrorSnackbar: false,
      errorMessageSnackBar: "",
      registrationSuccess: false,
      userNameError: currentState.userNameError,
      userEmailError: currentState.userEmailError,
      passwordError: currentState.passwordError,
    ));

    final result = await createUser.call(
      userName: currentState.userName,
      email: currentState.userEmail,
      password: currentState.password,
    );

    if (result.failure == null) {
      emit(RegistrationSuccess( userID: result.userID!,));
    } else {
      final failure = result.failure!;
      if (failure is NetworkFailure) {
        emit(currentState.copyWith(
          showErrorSnackbar: true,
          errorMessageSnackBar: "check internet connection",
          isChecking: false,
          userNameError: currentState.userNameError,
          userEmailError: currentState.userEmailError,
          passwordError: currentState.passwordError,
        ));
      } else if (failure is CreateUserInvalidArgumentFailure) {
        emit(currentState.copyWith(
          isChecking: false,
          showErrorSnackbar: true,
          errorMessageSnackBar: failure.message,
          userNameError: currentState.userNameError,
          userEmailError: currentState.userEmailError,
          passwordError: currentState.passwordError,
        ));
      } else if (failure is UserAlreadyExistsFailure) {
        emit(currentState.copyWith(
          isChecking: false,
          showErrorSnackbar: true,
          errorMessageSnackBar: failure.message,
          userNameError: currentState.userNameError,
          userEmailError: currentState.userEmailError,
          passwordError: currentState.passwordError,
        ));
      } else {
        emit(currentState.copyWith(
          showErrorSnackbar: true,
          errorMessageSnackBar: "check internet connection",
          isChecking: false,
          // Сохраняем все ошибки
          userNameError: currentState.userNameError,
          userEmailError: currentState.userEmailError,
          passwordError: currentState.passwordError,
        ));
      }
    }
  }
  Future<void> registerDefUser() async {
    final currentState = state as RegistrationFieldsState;
    emit(currentState.copyWith(
      isChecking: true,
      showErrorSnackbar: false,
      errorMessageSnackBar: "",
      registrationSuccess: false,
      userNameError: currentState.userNameError,
      userEmailError: currentState.userEmailError,
      passwordError: currentState.passwordError,
    ));

    final result = await createUser.callDef();
    print(result.failure);
    if (result.failure == null) {
      emit(RegistrationDefUserSuccess( userID: result.userID!,));
    } else {
      final failure = result.failure!;
      if (failure is NetworkFailure) {
        emit(currentState.copyWith(
          showErrorSnackbar: true,
          errorMessageSnackBar: "check internet connection",
          isChecking: false,
          userNameError: currentState.userNameError,
          userEmailError: currentState.userEmailError,
          passwordError: currentState.passwordError,
        ));
      } else if (failure is CreateUserInvalidArgumentFailure) {
        emit(currentState.copyWith(
          isChecking: false,
          showErrorSnackbar: true,
          errorMessageSnackBar: failure.message,
          userNameError: currentState.userNameError,
          userEmailError: currentState.userEmailError,
          passwordError: currentState.passwordError,
        ));
      } else if (failure is UserAlreadyExistsFailure) {
        emit(currentState.copyWith(
          isChecking: false,
          showErrorSnackbar: true,
          errorMessageSnackBar: failure.message,
          userNameError: currentState.userNameError,
          userEmailError: currentState.userEmailError,
          passwordError: currentState.passwordError,
        ));
      } else {
        emit(currentState.copyWith(
          showErrorSnackbar: true,
          errorMessageSnackBar: "check internet connection",
          isChecking: false,
          // Сохраняем все ошибки
          userNameError: currentState.userNameError,
          userEmailError: currentState.userEmailError,
          passwordError: currentState.passwordError,
        ));
      }
    }
  }

  void _handleFailure(Failure failure) {
    final currentState = state as RegistrationFieldsState;
    if (failure is NetworkFailure) {
      emit(currentState.copyWith(
        showErrorSnackbar: true,
        errorMessageSnackBar: "check internet connection",
        isChecking: false,
        // Сохраняем ошибки других полей
        userNameError: currentState.userNameError,
        userEmailError: currentState.userEmailError,
        passwordError: currentState.passwordError,
      ));
    } else if (failure is UsernameValidationFailure) {
      emit(currentState.copyWith(
        userNameError: failure.message,
        isChecking: false,
        // Сохраняем ошибки других полей
        userEmailError: currentState.userEmailError,
        passwordError: currentState.passwordError,
      ));
    } else if (failure is EmailValidationFailure) {
      emit(currentState.copyWith(
        userEmailError: failure.message,
        isChecking: false,
        // Сохраняем ошибки других полей
        userNameError: currentState.userNameError,
        passwordError: currentState.passwordError,
      ));
    } else if (failure is PasswordValidationFailure) {
      emit(currentState.copyWith(
        passwordError: failure.message,
        isChecking: false,
        // Сохраняем ошибки других полей
        userNameError: currentState.userNameError,
        userEmailError: currentState.userEmailError,
      ));
    } else {
      emit(currentState.copyWith(
        showErrorSnackbar: true,
        isChecking: false,
        // Сохраняем все ошибки
        userNameError: currentState.userNameError,
        userEmailError: currentState.userEmailError,
        passwordError: currentState.passwordError,
      ));
    }
  }}
