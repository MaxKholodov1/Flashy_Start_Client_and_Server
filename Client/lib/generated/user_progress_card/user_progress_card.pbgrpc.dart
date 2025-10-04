//
//  Generated code. Do not modify.
//  source: user_progress_card.proto
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

import 'user_progress_card.pb.dart' as $0;

export 'user_progress_card.pb.dart';

@$pb.GrpcServiceName('user_progress_card.UserProgressCardService')
class UserProgressCardServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  static final _$getProgressCardsByDeckID = $grpc.ClientMethod<$0.GetProgressCardsByDeckIDRequest, $0.GetProgressCardsByDeckIDResponse>(
      '/user_progress_card.UserProgressCardService/GetProgressCardsByDeckID',
      ($0.GetProgressCardsByDeckIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetProgressCardsByDeckIDResponse.fromBuffer(value));
  static final _$submitProgressCardReview = $grpc.ClientMethod<$0.CardReviewRequest, $0.CardReviewResponse>(
      '/user_progress_card.UserProgressCardService/SubmitProgressCardReview',
      ($0.CardReviewRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CardReviewResponse.fromBuffer(value));
  static final _$selectNewProgressCards = $grpc.ClientMethod<$0.ProgressCards, $0.ProgressCards>(
      '/user_progress_card.UserProgressCardService/SelectNewProgressCards',
      ($0.ProgressCards value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProgressCards.fromBuffer(value));
  static final _$selectFamiliarProgressCards = $grpc.ClientMethod<$0.ProgressCards, $0.ProgressCards>(
      '/user_progress_card.UserProgressCardService/SelectFamiliarProgressCards',
      ($0.ProgressCards value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProgressCards.fromBuffer(value));
  static final _$getCardsForTodayReview = $grpc.ClientMethod<$0.GetCardsForTodayReviewRequest, $0.ProgressCards>(
      '/user_progress_card.UserProgressCardService/GetCardsForTodayReview',
      ($0.GetCardsForTodayReviewRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProgressCards.fromBuffer(value));

  UserProgressCardServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetProgressCardsByDeckIDResponse> getProgressCardsByDeckID($0.GetProgressCardsByDeckIDRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProgressCardsByDeckID, request, options: options);
  }

  $grpc.ResponseFuture<$0.CardReviewResponse> submitProgressCardReview($0.CardReviewRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$submitProgressCardReview, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProgressCards> selectNewProgressCards($0.ProgressCards request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$selectNewProgressCards, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProgressCards> selectFamiliarProgressCards($0.ProgressCards request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$selectFamiliarProgressCards, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProgressCards> getCardsForTodayReview($0.GetCardsForTodayReviewRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCardsForTodayReview, request, options: options);
  }
}

@$pb.GrpcServiceName('user_progress_card.UserProgressCardService')
abstract class UserProgressCardServiceBase extends $grpc.Service {
  $core.String get $name => 'user_progress_card.UserProgressCardService';

  UserProgressCardServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetProgressCardsByDeckIDRequest, $0.GetProgressCardsByDeckIDResponse>(
        'GetProgressCardsByDeckID',
        getProgressCardsByDeckID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetProgressCardsByDeckIDRequest.fromBuffer(value),
        ($0.GetProgressCardsByDeckIDResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CardReviewRequest, $0.CardReviewResponse>(
        'SubmitProgressCardReview',
        submitProgressCardReview_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CardReviewRequest.fromBuffer(value),
        ($0.CardReviewResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProgressCards, $0.ProgressCards>(
        'SelectNewProgressCards',
        selectNewProgressCards_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProgressCards.fromBuffer(value),
        ($0.ProgressCards value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProgressCards, $0.ProgressCards>(
        'SelectFamiliarProgressCards',
        selectFamiliarProgressCards_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProgressCards.fromBuffer(value),
        ($0.ProgressCards value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetCardsForTodayReviewRequest, $0.ProgressCards>(
        'GetCardsForTodayReview',
        getCardsForTodayReview_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetCardsForTodayReviewRequest.fromBuffer(value),
        ($0.ProgressCards value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetProgressCardsByDeckIDResponse> getProgressCardsByDeckID_Pre($grpc.ServiceCall $call, $async.Future<$0.GetProgressCardsByDeckIDRequest> $request) async {
    return getProgressCardsByDeckID($call, await $request);
  }

  $async.Future<$0.CardReviewResponse> submitProgressCardReview_Pre($grpc.ServiceCall $call, $async.Future<$0.CardReviewRequest> $request) async {
    return submitProgressCardReview($call, await $request);
  }

  $async.Future<$0.ProgressCards> selectNewProgressCards_Pre($grpc.ServiceCall $call, $async.Future<$0.ProgressCards> $request) async {
    return selectNewProgressCards($call, await $request);
  }

  $async.Future<$0.ProgressCards> selectFamiliarProgressCards_Pre($grpc.ServiceCall $call, $async.Future<$0.ProgressCards> $request) async {
    return selectFamiliarProgressCards($call, await $request);
  }

  $async.Future<$0.ProgressCards> getCardsForTodayReview_Pre($grpc.ServiceCall $call, $async.Future<$0.GetCardsForTodayReviewRequest> $request) async {
    return getCardsForTodayReview($call, await $request);
  }

  $async.Future<$0.GetProgressCardsByDeckIDResponse> getProgressCardsByDeckID($grpc.ServiceCall call, $0.GetProgressCardsByDeckIDRequest request);
  $async.Future<$0.CardReviewResponse> submitProgressCardReview($grpc.ServiceCall call, $0.CardReviewRequest request);
  $async.Future<$0.ProgressCards> selectNewProgressCards($grpc.ServiceCall call, $0.ProgressCards request);
  $async.Future<$0.ProgressCards> selectFamiliarProgressCards($grpc.ServiceCall call, $0.ProgressCards request);
  $async.Future<$0.ProgressCards> getCardsForTodayReview($grpc.ServiceCall call, $0.GetCardsForTodayReviewRequest request);
}
