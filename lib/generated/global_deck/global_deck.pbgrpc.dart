//
//  Generated code. Do not modify.
//  source: global_deck.proto
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

import 'global_deck.pb.dart' as $0;

export 'global_deck.pb.dart';

@$pb.GrpcServiceName('global_deck.GlobalDeckService')
class GlobalDeckServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  static final _$createGlobalDeck = $grpc.ClientMethod<$0.CreateGlobalDeckRequest, $0.CreateGlobalDeckResponse>(
      '/global_deck.GlobalDeckService/CreateGlobalDeck',
      ($0.CreateGlobalDeckRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateGlobalDeckResponse.fromBuffer(value));
  static final _$getEditableGlobalDecks = $grpc.ClientMethod<$0.GetEditableDecksRequest, $0.GetEditableDecksResponse>(
      '/global_deck.GlobalDeckService/GetEditableGlobalDecks',
      ($0.GetEditableDecksRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetEditableDecksResponse.fromBuffer(value));
  static final _$updateGlobalDeck = $grpc.ClientMethod<$0.UpdateGlobalDeckRequest, $0.UpdateGlobalDeckResponse>(
      '/global_deck.GlobalDeckService/UpdateGlobalDeck',
      ($0.UpdateGlobalDeckRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateGlobalDeckResponse.fromBuffer(value));
  static final _$getGlobalDeckInfoByID = $grpc.ClientMethod<$0.GetGlobalDeckInfoByIDRequest, $0.GetGlobalDeckInfoByIDResponse>(
      '/global_deck.GlobalDeckService/GetGlobalDeckInfoByID',
      ($0.GetGlobalDeckInfoByIDRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetGlobalDeckInfoByIDResponse.fromBuffer(value));
  static final _$deleteGlobalDeck = $grpc.ClientMethod<$0.DeleteGlobalDeckRequest, $0.DeleteGlobalDeckResponse>(
      '/global_deck.GlobalDeckService/DeleteGlobalDeck',
      ($0.DeleteGlobalDeckRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteGlobalDeckResponse.fromBuffer(value));
  static final _$searchGlobalDecks = $grpc.ClientMethod<$0.SearchGlobalDecksRequest, $0.SearchGlobalDecksResponse>(
      '/global_deck.GlobalDeckService/SearchGlobalDecks',
      ($0.SearchGlobalDecksRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SearchGlobalDecksResponse.fromBuffer(value));
  static final _$addDeckToLearningDecks = $grpc.ClientMethod<$0.AddDeckToLearningDecksRequest, $0.AddDeckToLearningDecksResponse>(
      '/global_deck.GlobalDeckService/AddDeckToLearningDecks',
      ($0.AddDeckToLearningDecksRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AddDeckToLearningDecksResponse.fromBuffer(value));
  static final _$addEditorToGlobalDeck = $grpc.ClientMethod<$0.AddEditorToGlobalDeckRequest, $0.AddEditorToGlobalDeckResponse>(
      '/global_deck.GlobalDeckService/AddEditorToGlobalDeck',
      ($0.AddEditorToGlobalDeckRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AddEditorToGlobalDeckResponse.fromBuffer(value));
  static final _$demoteEditorToLearner = $grpc.ClientMethod<$0.DemoteEditorToLearnerRequest, $0.DemoteEditorToLearnerResponse>(
      '/global_deck.GlobalDeckService/DemoteEditorToLearner',
      ($0.DemoteEditorToLearnerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DemoteEditorToLearnerResponse.fromBuffer(value));

  GlobalDeckServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.CreateGlobalDeckResponse> createGlobalDeck($0.CreateGlobalDeckRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createGlobalDeck, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetEditableDecksResponse> getEditableGlobalDecks($0.GetEditableDecksRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getEditableGlobalDecks, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateGlobalDeckResponse> updateGlobalDeck($0.UpdateGlobalDeckRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateGlobalDeck, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetGlobalDeckInfoByIDResponse> getGlobalDeckInfoByID($0.GetGlobalDeckInfoByIDRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGlobalDeckInfoByID, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteGlobalDeckResponse> deleteGlobalDeck($0.DeleteGlobalDeckRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteGlobalDeck, request, options: options);
  }

  $grpc.ResponseFuture<$0.SearchGlobalDecksResponse> searchGlobalDecks($0.SearchGlobalDecksRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$searchGlobalDecks, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddDeckToLearningDecksResponse> addDeckToLearningDecks($0.AddDeckToLearningDecksRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addDeckToLearningDecks, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddEditorToGlobalDeckResponse> addEditorToGlobalDeck($0.AddEditorToGlobalDeckRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addEditorToGlobalDeck, request, options: options);
  }

  $grpc.ResponseFuture<$0.DemoteEditorToLearnerResponse> demoteEditorToLearner($0.DemoteEditorToLearnerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$demoteEditorToLearner, request, options: options);
  }
}

@$pb.GrpcServiceName('global_deck.GlobalDeckService')
abstract class GlobalDeckServiceBase extends $grpc.Service {
  $core.String get $name => 'global_deck.GlobalDeckService';

  GlobalDeckServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateGlobalDeckRequest, $0.CreateGlobalDeckResponse>(
        'CreateGlobalDeck',
        createGlobalDeck_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateGlobalDeckRequest.fromBuffer(value),
        ($0.CreateGlobalDeckResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetEditableDecksRequest, $0.GetEditableDecksResponse>(
        'GetEditableGlobalDecks',
        getEditableGlobalDecks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetEditableDecksRequest.fromBuffer(value),
        ($0.GetEditableDecksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateGlobalDeckRequest, $0.UpdateGlobalDeckResponse>(
        'UpdateGlobalDeck',
        updateGlobalDeck_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateGlobalDeckRequest.fromBuffer(value),
        ($0.UpdateGlobalDeckResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetGlobalDeckInfoByIDRequest, $0.GetGlobalDeckInfoByIDResponse>(
        'GetGlobalDeckInfoByID',
        getGlobalDeckInfoByID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetGlobalDeckInfoByIDRequest.fromBuffer(value),
        ($0.GetGlobalDeckInfoByIDResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteGlobalDeckRequest, $0.DeleteGlobalDeckResponse>(
        'DeleteGlobalDeck',
        deleteGlobalDeck_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteGlobalDeckRequest.fromBuffer(value),
        ($0.DeleteGlobalDeckResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SearchGlobalDecksRequest, $0.SearchGlobalDecksResponse>(
        'SearchGlobalDecks',
        searchGlobalDecks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SearchGlobalDecksRequest.fromBuffer(value),
        ($0.SearchGlobalDecksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddDeckToLearningDecksRequest, $0.AddDeckToLearningDecksResponse>(
        'AddDeckToLearningDecks',
        addDeckToLearningDecks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddDeckToLearningDecksRequest.fromBuffer(value),
        ($0.AddDeckToLearningDecksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddEditorToGlobalDeckRequest, $0.AddEditorToGlobalDeckResponse>(
        'AddEditorToGlobalDeck',
        addEditorToGlobalDeck_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddEditorToGlobalDeckRequest.fromBuffer(value),
        ($0.AddEditorToGlobalDeckResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DemoteEditorToLearnerRequest, $0.DemoteEditorToLearnerResponse>(
        'DemoteEditorToLearner',
        demoteEditorToLearner_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DemoteEditorToLearnerRequest.fromBuffer(value),
        ($0.DemoteEditorToLearnerResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateGlobalDeckResponse> createGlobalDeck_Pre($grpc.ServiceCall $call, $async.Future<$0.CreateGlobalDeckRequest> $request) async {
    return createGlobalDeck($call, await $request);
  }

  $async.Future<$0.GetEditableDecksResponse> getEditableGlobalDecks_Pre($grpc.ServiceCall $call, $async.Future<$0.GetEditableDecksRequest> $request) async {
    return getEditableGlobalDecks($call, await $request);
  }

  $async.Future<$0.UpdateGlobalDeckResponse> updateGlobalDeck_Pre($grpc.ServiceCall $call, $async.Future<$0.UpdateGlobalDeckRequest> $request) async {
    return updateGlobalDeck($call, await $request);
  }

  $async.Future<$0.GetGlobalDeckInfoByIDResponse> getGlobalDeckInfoByID_Pre($grpc.ServiceCall $call, $async.Future<$0.GetGlobalDeckInfoByIDRequest> $request) async {
    return getGlobalDeckInfoByID($call, await $request);
  }

  $async.Future<$0.DeleteGlobalDeckResponse> deleteGlobalDeck_Pre($grpc.ServiceCall $call, $async.Future<$0.DeleteGlobalDeckRequest> $request) async {
    return deleteGlobalDeck($call, await $request);
  }

  $async.Future<$0.SearchGlobalDecksResponse> searchGlobalDecks_Pre($grpc.ServiceCall $call, $async.Future<$0.SearchGlobalDecksRequest> $request) async {
    return searchGlobalDecks($call, await $request);
  }

  $async.Future<$0.AddDeckToLearningDecksResponse> addDeckToLearningDecks_Pre($grpc.ServiceCall $call, $async.Future<$0.AddDeckToLearningDecksRequest> $request) async {
    return addDeckToLearningDecks($call, await $request);
  }

  $async.Future<$0.AddEditorToGlobalDeckResponse> addEditorToGlobalDeck_Pre($grpc.ServiceCall $call, $async.Future<$0.AddEditorToGlobalDeckRequest> $request) async {
    return addEditorToGlobalDeck($call, await $request);
  }

  $async.Future<$0.DemoteEditorToLearnerResponse> demoteEditorToLearner_Pre($grpc.ServiceCall $call, $async.Future<$0.DemoteEditorToLearnerRequest> $request) async {
    return demoteEditorToLearner($call, await $request);
  }

  $async.Future<$0.CreateGlobalDeckResponse> createGlobalDeck($grpc.ServiceCall call, $0.CreateGlobalDeckRequest request);
  $async.Future<$0.GetEditableDecksResponse> getEditableGlobalDecks($grpc.ServiceCall call, $0.GetEditableDecksRequest request);
  $async.Future<$0.UpdateGlobalDeckResponse> updateGlobalDeck($grpc.ServiceCall call, $0.UpdateGlobalDeckRequest request);
  $async.Future<$0.GetGlobalDeckInfoByIDResponse> getGlobalDeckInfoByID($grpc.ServiceCall call, $0.GetGlobalDeckInfoByIDRequest request);
  $async.Future<$0.DeleteGlobalDeckResponse> deleteGlobalDeck($grpc.ServiceCall call, $0.DeleteGlobalDeckRequest request);
  $async.Future<$0.SearchGlobalDecksResponse> searchGlobalDecks($grpc.ServiceCall call, $0.SearchGlobalDecksRequest request);
  $async.Future<$0.AddDeckToLearningDecksResponse> addDeckToLearningDecks($grpc.ServiceCall call, $0.AddDeckToLearningDecksRequest request);
  $async.Future<$0.AddEditorToGlobalDeckResponse> addEditorToGlobalDeck($grpc.ServiceCall call, $0.AddEditorToGlobalDeckRequest request);
  $async.Future<$0.DemoteEditorToLearnerResponse> demoteEditorToLearner($grpc.ServiceCall call, $0.DemoteEditorToLearnerRequest request);
}
