import 'package:grpc/grpc.dart';
import 'package:flashy_start/application/responses/authorization_and_user/ChangePasswordResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/GetUserResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/PasswordRecoveryResult.dart';
import 'package:flashy_start/application/responses/authorization_and_user/SendVerificationCode.dart';
import 'package:flashy_start/application/responses/authorization_and_user/VerifyEmailResult.dart';
import '../../application/responses/authorization_and_user/CreateUserResult.dart';
import '../../application/responses/authorization_and_user/DeleteUser.dart';
import '../../generated/user/user/user.pbgrpc.dart';
import 'package:flashy_start/domain/entities/User.dart' as domain;

class UserGrpcClient {
  final UserServiceClient stub;
  UserGrpcClient(ClientChannel channel) : stub = UserServiceClient(channel);
  Future<GetUserResult> getUser({
    required String accessToken
  }) async {
    final request = GetUserRequest()
      ..accessToken = accessToken;

    final response = await stub.getUser(request);

    var user = domain.User(
        userName: response.userName,
        email: response.email,
        createdAt: response.createdAt.toDateTime()
    );
    return GetUserResult(
      user: user,
    );
  }

  Future<CreateUserResult> createUser({
    required String userName,
    required String email,
    required String password,
  }) async {
    final request = CreateUserRequest()
      ..userName = userName
      ..email = email
      ..password = password;

    final response = await stub.createUser(request);
    return CreateUserResult(
        userID: response.userID,
    );
  }
  Future<CreateDefUserResult> createDefUser() async {
    final request = CreateDefUserRequest();
    final response = await stub.createDefUser(request);
    return CreateDefUserResult(
      userID: response.userID,
      access_token: response.accessToken,
      refresh_token: response.refreshToken,
    );
  }
  Future<VerifyEmailResult> verifyEmail({
    required String code,
    required int userID,
  }) async {
    final request = VerifyEmailRequest()
      ..code = code.toString()
      ..userId = userID;

    final response = await stub.verifyEmail(request);
    return VerifyEmailResult(
      isSuccess: response.isSuccess,
      refreshToken: response.refreshToken,
      accessToken: response.accessToken,
    );
  }
  Future<SendVerificationCodeResult> sendVerificationCode({
    required int userID,
  }) async {
    final request = SendVerificationCodeRequest()
      ..userId = userID;

    final response = await stub.sendVerificationCode(request);
    return SendVerificationCodeResult(
      isSuccess: response.isSuccess,
    );
  }
  Future<ChangePasswordResult> changePassword({
    required String accessToken,
    required String password,
    required String newPassword,
  }) async {
    final request = ChangePasswordRequest()
      ..password = password
      ..newPassword = newPassword;
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.changePassword(request, options: callOptions);
    return ChangePasswordResult(isSuccess: response.isSuccess, refreshToken: response.refreshToken, accessToken: response.accessToken);
  }

  Future<PasswordRecoveryResult> passwordRecovery({
    required String usernameOrEmail,
  }) async {
    final request = PasswordRecoveryRequest()
      ..usernameOrEmail= usernameOrEmail;

    final response = await stub.passwordRecovery(request);
    return PasswordRecoveryResult(isSuccess: response.isSuccess);
  }


  Future<DeleteUserResult> deleteUser({
    required String accessToken,
  }) async {
    final request = DeleteUserRequest();
    final callOptions = CallOptions(metadata: {
      'authorization': 'Bearer $accessToken',
    });
    final response = await stub.deleteUser(request, options: callOptions);
    return DeleteUserResult(isSuccess: response.isSuccess, );
  }
}
