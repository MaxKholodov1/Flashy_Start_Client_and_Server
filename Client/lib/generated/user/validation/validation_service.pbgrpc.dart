//
//  Generated code. Do not modify.
//  source: validation_service.proto
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

import 'validation_service.pb.dart' as $0;

export 'validation_service.pb.dart';

@$pb.GrpcServiceName('user.validation.ValidationService')
class ValidationServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  static final _$checkUserNameAvailability = $grpc.ClientMethod<$0.CheckUserNameAvailabilityRequest, $0.CheckUserNameAvailabilityResponse>(
      '/user.validation.ValidationService/CheckUserNameAvailability',
      ($0.CheckUserNameAvailabilityRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CheckUserNameAvailabilityResponse.fromBuffer(value));
  static final _$checkUserEmailAvailability = $grpc.ClientMethod<$0.CheckUserEmailAvailabilityRequest, $0.CheckUserEmailAvailabilityResponse>(
      '/user.validation.ValidationService/CheckUserEmailAvailability',
      ($0.CheckUserEmailAvailabilityRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CheckUserEmailAvailabilityResponse.fromBuffer(value));
  static final _$checkPasswordValidity = $grpc.ClientMethod<$0.CheckUserPasswordAvailabilityRequest, $0.CheckUserPasswordAvailabilityResponse>(
      '/user.validation.ValidationService/CheckPasswordValidity',
      ($0.CheckUserPasswordAvailabilityRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CheckUserPasswordAvailabilityResponse.fromBuffer(value));

  ValidationServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.CheckUserNameAvailabilityResponse> checkUserNameAvailability($0.CheckUserNameAvailabilityRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkUserNameAvailability, request, options: options);
  }

  $grpc.ResponseFuture<$0.CheckUserEmailAvailabilityResponse> checkUserEmailAvailability($0.CheckUserEmailAvailabilityRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkUserEmailAvailability, request, options: options);
  }

  $grpc.ResponseFuture<$0.CheckUserPasswordAvailabilityResponse> checkPasswordValidity($0.CheckUserPasswordAvailabilityRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkPasswordValidity, request, options: options);
  }
}

@$pb.GrpcServiceName('user.validation.ValidationService')
abstract class ValidationServiceBase extends $grpc.Service {
  $core.String get $name => 'user.validation.ValidationService';

  ValidationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CheckUserNameAvailabilityRequest, $0.CheckUserNameAvailabilityResponse>(
        'CheckUserNameAvailability',
        checkUserNameAvailability_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CheckUserNameAvailabilityRequest.fromBuffer(value),
        ($0.CheckUserNameAvailabilityResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CheckUserEmailAvailabilityRequest, $0.CheckUserEmailAvailabilityResponse>(
        'CheckUserEmailAvailability',
        checkUserEmailAvailability_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CheckUserEmailAvailabilityRequest.fromBuffer(value),
        ($0.CheckUserEmailAvailabilityResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CheckUserPasswordAvailabilityRequest, $0.CheckUserPasswordAvailabilityResponse>(
        'CheckPasswordValidity',
        checkPasswordValidity_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CheckUserPasswordAvailabilityRequest.fromBuffer(value),
        ($0.CheckUserPasswordAvailabilityResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CheckUserNameAvailabilityResponse> checkUserNameAvailability_Pre($grpc.ServiceCall $call, $async.Future<$0.CheckUserNameAvailabilityRequest> $request) async {
    return checkUserNameAvailability($call, await $request);
  }

  $async.Future<$0.CheckUserEmailAvailabilityResponse> checkUserEmailAvailability_Pre($grpc.ServiceCall $call, $async.Future<$0.CheckUserEmailAvailabilityRequest> $request) async {
    return checkUserEmailAvailability($call, await $request);
  }

  $async.Future<$0.CheckUserPasswordAvailabilityResponse> checkPasswordValidity_Pre($grpc.ServiceCall $call, $async.Future<$0.CheckUserPasswordAvailabilityRequest> $request) async {
    return checkPasswordValidity($call, await $request);
  }

  $async.Future<$0.CheckUserNameAvailabilityResponse> checkUserNameAvailability($grpc.ServiceCall call, $0.CheckUserNameAvailabilityRequest request);
  $async.Future<$0.CheckUserEmailAvailabilityResponse> checkUserEmailAvailability($grpc.ServiceCall call, $0.CheckUserEmailAvailabilityRequest request);
  $async.Future<$0.CheckUserPasswordAvailabilityResponse> checkPasswordValidity($grpc.ServiceCall call, $0.CheckUserPasswordAvailabilityRequest request);
}
