import 'package:grpc/grpc.dart';


import '../../application/responses/authorization_and_user/UserEmailAvailableResult.dart';
import '../../application/responses/authorization_and_user/UserNameAvailableResult.dart';
import '../../application/responses/authorization_and_user/UserPasswordAvailableResult.dart';
import '../../generated/user/validation/validation_service.pbgrpc.dart';

class ValidationGrpcClient {
  final ValidationServiceClient stub;

  ValidationGrpcClient(ClientChannel channel)
      : stub = ValidationServiceClient(channel);
  Future<UserNameAvailabilityResult> checkUserNameAvailability(String userName) async {
    final request = CheckUserNameAvailabilityRequest()..userName = userName;
    // ignore: unused_local_variable
    final response = await stub.checkUserNameAvailability(request);
    return UserNameAvailabilityResult.success();
  }

  // Проверка email
  Future<UserEmailAvailabilityResult> checkUserEmailAvailability(String userEmail) async {
    final request = CheckUserEmailAvailabilityRequest()..userEmail = userEmail;
    // ignore: unused_local_variable
    final response = await stub.checkUserEmailAvailability(request);
    return UserEmailAvailabilityResult.success();
  }

  // Проверка пароля
  Future<UserPasswordAvailabilityResult> checkUserPasswordAvailability(String password) async {
    // ignore: unused_local_variable
    final request = CheckUserPasswordAvailabilityRequest()..password = password;
    final response = await stub.checkPasswordValidity(request);
    return UserPasswordAvailabilityResult.success();
  }
}
