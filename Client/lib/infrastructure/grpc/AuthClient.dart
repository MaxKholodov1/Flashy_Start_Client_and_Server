import 'package:grpc/grpc.dart';

import '../../application/responses/authorization_and_user/LoginResult.dart';
import '../../application/responses/authorization_and_user/RefreshTokenResult.dart';
import '../../generated/user/auth/auth_service.pbgrpc.dart';

class AuthGrpcClient {
  final AuthServiceClient stub;

  AuthGrpcClient(ClientChannel channel) : stub = AuthServiceClient(channel);

  Future<LoginResult> login(String identifier, String password) async {
    final request = LoginRequest()
      ..identifier = identifier
      ..password = password;
    final response = await stub.login(request);
    return LoginResult(
      isPasswordCorrect: response.isPasswordCorrect,
      accessToken: response.accessToken.isNotEmpty ? response.accessToken : null,
      refreshToken: response.refreshToken.isNotEmpty ? response.refreshToken : null,
      userID: response.userID,
      isEmailVerified: response.isVerified,
    );
  }

  Future<RefreshTokenResult> refreshToken(String refreshToken) async {
    final request = RefreshTokenRequest()..refreshToken = refreshToken;
    final response = await stub.refreshToken(request);
    return RefreshTokenResult(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
      userID: response.userID,
    );
  }
}
