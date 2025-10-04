//
//  Generated code. Do not modify.
//  source: global_card.proto
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

import 'global_card.pb.dart' as $0;

export 'global_card.pb.dart';

@$pb.GrpcServiceName('global_card.GlobalCardService')
class GlobalCardServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  static final _$createGlobalCard = $grpc.ClientMethod<$0.CreateGlobalCardRequest, $0.CreateGlobalCardResponse>(
      '/global_card.GlobalCardService/CreateGlobalCard',
      ($0.CreateGlobalCardRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateGlobalCardResponse.fromBuffer(value));
  static final _$getGlobalCardsByDeckID = $grpc.ClientMethod<$0.GetGlobalCardsByDeckIDRequest, $0.GetGlobalCardsByDeckIDResponse>(
      '/global_card.GlobalCardService/GetGlobalCardsByDeckID',
      ($0.GetGlobalCardsByDeckIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetGlobalCardsByDeckIDResponse.fromBuffer(value));
  static final _$updateGlobalCard = $grpc.ClientMethod<$0.UpdateGlobalCardRequest, $0.UpdateGlobalCardResponse>(
      '/global_card.GlobalCardService/UpdateGlobalCard',
      ($0.UpdateGlobalCardRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateGlobalCardResponse.fromBuffer(value));
  static final _$deleteGlobalCard = $grpc.ClientMethod<$0.DeleteGlobalCardRequest, $0.DeleteGlobalCardResponse>(
      '/global_card.GlobalCardService/DeleteGlobalCard',
      ($0.DeleteGlobalCardRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteGlobalCardResponse.fromBuffer(value));

  GlobalCardServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.CreateGlobalCardResponse> createGlobalCard($0.CreateGlobalCardRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createGlobalCard, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetGlobalCardsByDeckIDResponse> getGlobalCardsByDeckID($0.GetGlobalCardsByDeckIDRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGlobalCardsByDeckID, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateGlobalCardResponse> updateGlobalCard($0.UpdateGlobalCardRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateGlobalCard, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteGlobalCardResponse> deleteGlobalCard($0.DeleteGlobalCardRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteGlobalCard, request, options: options);
  }
}

@$pb.GrpcServiceName('global_card.GlobalCardService')
abstract class GlobalCardServiceBase extends $grpc.Service {
  $core.String get $name => 'global_card.GlobalCardService';

  GlobalCardServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateGlobalCardRequest, $0.CreateGlobalCardResponse>(
        'CreateGlobalCard',
        createGlobalCard_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateGlobalCardRequest.fromBuffer(value),
        ($0.CreateGlobalCardResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetGlobalCardsByDeckIDRequest, $0.GetGlobalCardsByDeckIDResponse>(
        'GetGlobalCardsByDeckID',
        getGlobalCardsByDeckID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetGlobalCardsByDeckIDRequest.fromBuffer(value),
        ($0.GetGlobalCardsByDeckIDResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateGlobalCardRequest, $0.UpdateGlobalCardResponse>(
        'UpdateGlobalCard',
        updateGlobalCard_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateGlobalCardRequest.fromBuffer(value),
        ($0.UpdateGlobalCardResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteGlobalCardRequest, $0.DeleteGlobalCardResponse>(
        'DeleteGlobalCard',
        deleteGlobalCard_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteGlobalCardRequest.fromBuffer(value),
        ($0.DeleteGlobalCardResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateGlobalCardResponse> createGlobalCard_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateGlobalCardRequest> $request) async {
    return createGlobalCard($call, await $request);
  }

  $async.Future<$0.GetGlobalCardsByDeckIDResponse> getGlobalCardsByDeckID_Pre($grpc.ServiceCall $call, $async.Future<$0.GetGlobalCardsByDeckIDRequest> $request) async {
    return getGlobalCardsByDeckID($call, await $request);
  }

  $async.Future<$0.UpdateGlobalCardResponse> updateGlobalCard_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateGlobalCardRequest> $request) async {
    return updateGlobalCard($call, await $request);
  }

  $async.Future<$0.DeleteGlobalCardResponse> deleteGlobalCard_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteGlobalCardRequest> $request) async {
    return deleteGlobalCard($call, await $request);
  }

  $async.Future<$0.CreateGlobalCardResponse> createGlobalCard($grpc.ServiceCall call, $0.CreateGlobalCardRequest request);
  $async.Future<$0.GetGlobalCardsByDeckIDResponse> getGlobalCardsByDeckID($grpc.ServiceCall call, $0.GetGlobalCardsByDeckIDRequest request);
  $async.Future<$0.UpdateGlobalCardResponse> updateGlobalCard($grpc.ServiceCall call, $0.UpdateGlobalCardRequest request);
  $async.Future<$0.DeleteGlobalCardResponse> deleteGlobalCard($grpc.ServiceCall call, $0.DeleteGlobalCardRequest request);
}
