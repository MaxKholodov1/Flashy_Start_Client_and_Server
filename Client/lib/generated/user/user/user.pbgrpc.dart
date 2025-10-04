//
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $0;

export 'user.pb.dart';

@$pb.GrpcServiceName('user.service.UserService')
class UserServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  static final _$createUser = $grpc.ClientMethod<$0.CreateUserRequest, $0.CreateUserResponse>(
      '/user.service.UserService/CreateUser',
      ($0.CreateUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateUserResponse.fromBuffer(value));
  static final _$getUser = $grpc.ClientMethod<$0.GetUserRequest, $0.GetUserResponse>(
      '/user.service.UserService/GetUser',
      ($0.GetUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUserResponse.fromBuffer(value));
  static final _$verifyEmail = $grpc.ClientMethod<$0.VerifyEmailRequest, $0.VerifyEmailResponse>(
      '/user.service.UserService/VerifyEmail',
      ($0.VerifyEmailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.VerifyEmailResponse.fromBuffer(value));
  static final _$sendVerificationCode = $grpc.ClientMethod<$0.SendVerificationCodeRequest, $0.SendVerificationCodeResponse>(
      '/user.service.UserService/SendVerificationCode',
      ($0.SendVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SendVerificationCodeResponse.fromBuffer(value));
  static final _$changePassword = $grpc.ClientMethod<$0.ChangePasswordRequest, $0.ChangePasswordResponse>(
      '/user.service.UserService/ChangePassword',
      ($0.ChangePasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChangePasswordResponse.fromBuffer(value));
  static final _$passwordRecovery = $grpc.ClientMethod<$0.PasswordRecoveryRequest, $0.PasswordRecoveryResponse>(
      '/user.service.UserService/PasswordRecovery',
      ($0.PasswordRecoveryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PasswordRecoveryResponse.fromBuffer(value));
  static final _$deleteUser = $grpc.ClientMethod<$0.DeleteUserRequest, $0.DeleteUserResponse>(
      '/user.service.UserService/DeleteUser',
      ($0.DeleteUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteUserResponse.fromBuffer(value));
  static final _$createDefUser = $grpc.ClientMethod<$0.CreateDefUserRequest, $0.CreateDefUserResponse>(
      '/user.service.UserService/CreateDefUser',
      ($0.CreateDefUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateDefUserResponse.fromBuffer(value));

  UserServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.CreateUserResponse> createUser($0.CreateUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUserResponse> getUser($0.GetUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerifyEmailResponse> verifyEmail($0.VerifyEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyEmail, request, options: options);
  }

  $grpc.ResponseFuture<$0.SendVerificationCodeResponse> sendVerificationCode($0.SendVerificationCodeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendVerificationCode, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChangePasswordResponse> changePassword($0.ChangePasswordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changePassword, request, options: options);
  }

  $grpc.ResponseFuture<$0.PasswordRecoveryResponse> passwordRecovery($0.PasswordRecoveryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$passwordRecovery, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteUserResponse> deleteUser($0.DeleteUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateDefUserResponse> createDefUser($0.CreateDefUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createDefUser, request, options: options);
  }
}

@$pb.GrpcServiceName('user.service.UserService')
abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'user.service.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateUserRequest, $0.CreateUserResponse>(
        'CreateUser',
        createUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateUserRequest.fromBuffer(value),
        ($0.CreateUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUserRequest, $0.GetUserResponse>(
        'GetUser',
        getUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserRequest.fromBuffer(value),
        ($0.GetUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyEmailRequest, $0.VerifyEmailResponse>(
        'VerifyEmail',
        verifyEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VerifyEmailRequest.fromBuffer(value),
        ($0.VerifyEmailResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendVerificationCodeRequest, $0.SendVerificationCodeResponse>(
        'SendVerificationCode',
        sendVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendVerificationCodeRequest.fromBuffer(value),
        ($0.SendVerificationCodeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChangePasswordRequest, $0.ChangePasswordResponse>(
        'ChangePassword',
        changePassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChangePasswordRequest.fromBuffer(value),
        ($0.ChangePasswordResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PasswordRecoveryRequest, $0.PasswordRecoveryResponse>(
        'PasswordRecovery',
        passwordRecovery_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PasswordRecoveryRequest.fromBuffer(value),
        ($0.PasswordRecoveryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteUserRequest, $0.DeleteUserResponse>(
        'DeleteUser',
        deleteUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteUserRequest.fromBuffer(value),
        ($0.DeleteUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateDefUserRequest, $0.CreateDefUserResponse>(
        'CreateDefUser',
        createDefUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateDefUserRequest.fromBuffer(value),
        ($0.CreateDefUserResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateUserResponse> createUser_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateUserRequest> $request) async {
    return createUser($call, await $request);
  }

  $async.Future<$0.GetUserResponse> getUser_Pre($grpc.ServiceCall $call, $async.Future<$0.GetUserRequest> $request) async {
    return getUser($call, await $request);
  }

  $async.Future<$0.VerifyEmailResponse> verifyEmail_Pre($grpc.ServiceCall $call, $async.Future<$0.VerifyEmailRequest> $request) async {
    return verifyEmail($call, await $request);
  }

  $async.Future<$0.SendVerificationCodeResponse> sendVerificationCode_Pre($grpc.ServiceCall $call, $async.Future<$0.SendVerificationCodeRequest> $request) async {
    return sendVerificationCode($call, await $request);
  }

  $async.Future<$0.ChangePasswordResponse> changePassword_Pre($grpc.ServiceCall $call, $async.Future<$0.ChangePasswordRequest> $request) async {
    return changePassword($call, await $request);
  }

  $async.Future<$0.PasswordRecoveryResponse> passwordRecovery_Pre($grpc.ServiceCall $call, $async.Future<$0.PasswordRecoveryRequest> $request) async {
    return passwordRecovery($call, await $request);
  }

  $async.Future<$0.DeleteUserResponse> deleteUser_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteUserRequest> $request) async {
    return deleteUser($call, await $request);
  }

  $async.Future<$0.CreateDefUserResponse> createDefUser_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateDefUserRequest> $request) async {
    return createDefUser($call, await $request);
  }

  $async.Future<$0.CreateUserResponse> createUser($grpc.ServiceCall call, $0.CreateUserRequest request);
  $async.Future<$0.GetUserResponse> getUser($grpc.ServiceCall call, $0.GetUserRequest request);
  $async.Future<$0.VerifyEmailResponse> verifyEmail($grpc.ServiceCall call, $0.VerifyEmailRequest request);
  $async.Future<$0.SendVerificationCodeResponse> sendVerificationCode($grpc.ServiceCall call, $0.SendVerificationCodeRequest request);
  $async.Future<$0.ChangePasswordResponse> changePassword($grpc.ServiceCall call, $0.ChangePasswordRequest request);
  $async.Future<$0.PasswordRecoveryResponse> passwordRecovery($grpc.ServiceCall call, $0.PasswordRecoveryRequest request);
  $async.Future<$0.DeleteUserResponse> deleteUser($grpc.ServiceCall call, $0.DeleteUserRequest request);
  $async.Future<$0.CreateDefUserResponse> createDefUser($grpc.ServiceCall call, $0.CreateDefUserRequest request);
}
