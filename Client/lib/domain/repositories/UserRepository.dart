import 'package:flashy_start/application/responses/authorization_and_user/CreateUserResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/GetUserResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/RefreshTokenResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/UserNameAvailableResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/VerifyEmailResult.dart';

import '../../application/responses/authorization_and_user/ChangePasswordResult.dart';
import '../../application/responses/authorization_and_user/DeleteUser.dart';
import '../../application/responses/authorization_and_user/LoginResult.dart';
import '../../application/responses/authorization_and_user/PasswordRecoveryResult.dart';
import '../../application/responses/authorization_and_user/SendVerificationCode.dart';
import '../../application/responses/authorization_and_user/UserEmailAvailableResult.dart';
import '../../application/responses/authorization_and_user/UserPasswordAvailableResult.dart';

abstract class UserRepository {
  Future<CreateUserResult> createUser({
    required String userName,
    required String email,
    required String password,
  });
  Future<CreateDefUserResult> createDefUser();
  Future<UserEmailAvailabilityResult> checkUserEmailAvailability({
    required String userEmail,
  });
  Future<UserNameAvailabilityResult> checkUserNameAvailability({
    required String userName,
  });
  Future<UserPasswordAvailabilityResult> checkUserPasswordAvailability({
    required String password,
  });
  Future<LoginResult> login({
    required String identifier,
    required String password,
  });
  Future<RefreshTokenResult> refreshToken({
    required String refreshToken
  });
  Future<GetUserResult> getUser({
    required String accessToken
  });
  Future<VerifyEmailResult> verifyEmail({
    required String code,
    required int userID,
  });
  Future<SendVerificationCodeResult> sendVerificationCode({
    required int userID,
  });
  Future<ChangePasswordResult> changePassword({
    required String password,
    required String newPassword,
    required String accessToken
  });
  Future<PasswordRecoveryResult> passwordRecovery({
    required String usernameOrEmail
  });
  Future<DeleteUserResult> deleteUser({
    required String accessToken
  });
}
