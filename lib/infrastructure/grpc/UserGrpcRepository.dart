import 'package:flashy_start/application/responses/authorization_and_user/ChangePasswordResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/CreateUserResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/GetUserResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/PasswordRecoveryResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/RefreshTokenResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/SendVerificationCode.dart';
import 'package:flashy_start/application/responses/authorization_and_user/UserEmailAvailableResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/UserNameAvailableResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/UserPasswordAvailableResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/VerifyEmailResult.dart';
import 'package:flashy_start/domain/repositories/UserRepository.dart';
import 'package:flashy_start/infrastructure/grpc/AuthClient.dart';
import 'package:flashy_start/infrastructure/grpc/ValidationClient.dart';

import '../../application/responses/authorization_and_user/DeleteUser.dart';
import '../../application/responses/authorization_and_user/LoginResult.dart';
import 'UserClient.dart';

class UserGrpcRepository implements UserRepository {
  final UserGrpcClient userClient;
  final AuthGrpcClient authClient;
  final ValidationGrpcClient validationClient;

  UserGrpcRepository(this.userClient, this.authClient, this.validationClient);
  @override
  Future<CreateUserResult> createUser({
    required String userName,
    required String email,
    required String password,
  }) {
    return userClient.createUser(
      userName: userName,
      email: email,
      password: password,
    );
  }
  @override
  Future<CreateDefUserResult> createDefUser() {
    return userClient.createDefUser();
  }
  @override
  Future<UserNameAvailabilityResult> checkUserNameAvailability({
    required String userName
  }){
    return validationClient.checkUserNameAvailability(userName);
  }
  @override
  Future<UserEmailAvailabilityResult> checkUserEmailAvailability({
    required String userEmail
  }) async {
    return validationClient.checkUserEmailAvailability(userEmail);
  }
  @override
  Future<LoginResult> login({
    required String identifier,
    required String password
  }) async {
    return authClient.login(identifier, password);
  }
  @override
  Future<UserPasswordAvailabilityResult> checkUserPasswordAvailability({
    required String password
  }){
    return validationClient.checkUserPasswordAvailability(password);
  }
  @override
  Future<RefreshTokenResult> refreshToken({
    required String refreshToken
  }){
    return authClient.refreshToken(refreshToken);
  }
  @override
  Future<GetUserResult> getUser({
    required String accessToken
  }){
    return  userClient.getUser(accessToken: accessToken);
  }
  @override
  Future<VerifyEmailResult> verifyEmail({
    required String code,
    required int userID,
  }){
    return userClient.verifyEmail(code: code, userID: userID);
  }
  @override
  Future<SendVerificationCodeResult> sendVerificationCode({
    required int userID,
  }){
    return userClient.sendVerificationCode(userID: userID);
  }

  @override
  Future<ChangePasswordResult> changePassword({
    required String password,
    required String newPassword,
    required String accessToken
  }) async {
    var res = await userClient.changePassword(accessToken: accessToken, password: password, newPassword: newPassword);
    return res;
  }

  @override
  Future<PasswordRecoveryResult> passwordRecovery({
    required String usernameOrEmail
  }) async {
    var res = await userClient.passwordRecovery(usernameOrEmail: usernameOrEmail);
    return res;
  }
  @override
  Future<DeleteUserResult> deleteUser({
    required String accessToken
  })async{
    var res = await userClient.deleteUser(accessToken: accessToken);
    return res;
  }
}
