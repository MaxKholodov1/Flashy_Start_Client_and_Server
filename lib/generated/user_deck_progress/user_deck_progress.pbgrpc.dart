//
//  Generated code. Do not modify.
//  source: user_deck_progress.proto
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

import 'user_deck_progress.pb.dart' as $0;

export 'user_deck_progress.pb.dart';

@$pb.GrpcServiceName('user_deck_progress.UserDeckProgressService')
class UserDeckProgressServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  static final _$getUserLearningProgressDecks = $grpc.ClientMethod<$0.GetUserLearningProgressDecksRequest, $0.GetUserLearningProgressDecksResponse>(
      '/user_deck_progress.UserDeckProgressService/GetUserLearningProgressDecks',
      ($0.GetUserLearningProgressDecksRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUserLearningProgressDecksResponse.fromBuffer(value));
  static final _$selectDecksForTodayReview = $grpc.ClientMethod<$0.UserProgressDecks, $0.UserProgressDecks>(
      '/user_deck_progress.UserDeckProgressService/SelectDecksForTodayReview',
      ($0.UserProgressDecks value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserProgressDecks.fromBuffer(value));
  static final _$deleteDeckFromLearningDecks = $grpc.ClientMethod<$0.DeleteDeckFromLearningDecksRequest, $0.DeleteDeckFromLearningDecksResponse>(
      '/user_deck_progress.UserDeckProgressService/DeleteDeckFromLearningDecks',
      ($0.DeleteDeckFromLearningDecksRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteDeckFromLearningDecksResponse.fromBuffer(value));

  UserDeckProgressServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetUserLearningProgressDecksResponse> getUserLearningProgressDecks($0.GetUserLearningProgressDecksRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserLearningProgressDecks, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserProgressDecks> selectDecksForTodayReview($0.UserProgressDecks request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$selectDecksForTodayReview, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteDeckFromLearningDecksResponse> deleteDeckFromLearningDecks($0.DeleteDeckFromLearningDecksRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteDeckFromLearningDecks, request, options: options);
  }
}

@$pb.GrpcServiceName('user_deck_progress.UserDeckProgressService')
abstract class UserDeckProgressServiceBase extends $grpc.Service {
  $core.String get $name => 'user_deck_progress.UserDeckProgressService';

  UserDeckProgressServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetUserLearningProgressDecksRequest, $0.GetUserLearningProgressDecksResponse>(
        'GetUserLearningProgressDecks',
        getUserLearningProgressDecks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserLearningProgressDecksRequest.fromBuffer(value),
        ($0.GetUserLearningProgressDecksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserProgressDecks, $0.UserProgressDecks>(
        'SelectDecksForTodayReview',
        selectDecksForTodayReview_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserProgressDecks.fromBuffer(value),
        ($0.UserProgressDecks value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteDeckFromLearningDecksRequest, $0.DeleteDeckFromLearningDecksResponse>(
        'DeleteDeckFromLearningDecks',
        deleteDeckFromLearningDecks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteDeckFromLearningDecksRequest.fromBuffer(value),
        ($0.DeleteDeckFromLearningDecksResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetUserLearningProgressDecksResponse> getUserLearningProgressDecks_Pre($grpc.ServiceCall $call, $async.Future<$0.GetUserLearningProgressDecksRequest> $request) async {
    return getUserLearningProgressDecks($call, await $request);
  }

  $async.Future<$0.UserProgressDecks> selectDecksForTodayReview_Pre($grpc.ServiceCall $call, $async.Future<$0.UserProgressDecks> $request) async {
    return selectDecksForTodayReview($call, await $request);
  }

  $async.Future<$0.DeleteDeckFromLearningDecksResponse> deleteDeckFromLearningDecks_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteDeckFromLearningDecksRequest> $request) async {
    return deleteDeckFromLearningDecks($call, await $request);
  }

  $async.Future<$0.GetUserLearningProgressDecksResponse> getUserLearningProgressDecks($grpc.ServiceCall call, $0.GetUserLearningProgressDecksRequest request);
  $async.Future<$0.UserProgressDecks> selectDecksForTodayReview($grpc.ServiceCall call, $0.UserProgressDecks request);
  $async.Future<$0.DeleteDeckFromLearningDecksResponse> deleteDeckFromLearningDecks($grpc.ServiceCall call, $0.DeleteDeckFromLearningDecksRequest request);
}
