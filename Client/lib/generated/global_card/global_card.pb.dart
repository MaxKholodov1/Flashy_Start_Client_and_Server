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

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GlobalCard extends $pb.GeneratedMessage {
  factory GlobalCard({
    $core.int? id,
    $core.int? deckID,
    $core.String? question,
    $core.String? answer,
    $core.int? authorID,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
    $core.int? version,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (deckID != null) result.deckID = deckID;
    if (question != null) result.question = question;
    if (answer != null) result.answer = answer;
    if (authorID != null) result.authorID = authorID;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (version != null) result.version = version;
    return result;
  }

  GlobalCard._();

  factory GlobalCard.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GlobalCard.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GlobalCard', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_card'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'deckID', $pb.PbFieldType.O3, protoName: 'deckID')
    ..aOS(3, _omitFieldNames ? '' : 'question')
    ..aOS(4, _omitFieldNames ? '' : 'answer')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'authorID', $pb.PbFieldType.O3, protoName: 'authorID')
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'updatedAt', subBuilder: $1.Timestamp.create)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GlobalCard clone() => GlobalCard()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GlobalCard copyWith(void Function(GlobalCard) updates) => super.copyWith((message) => updates(message as GlobalCard)) as GlobalCard;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GlobalCard create() => GlobalCard._();
  @$core.override
  GlobalCard createEmptyInstance() => create();
  static $pb.PbList<GlobalCard> createRepeated() => $pb.PbList<GlobalCard>();
  @$core.pragma('dart2js:noInline')
  static GlobalCard getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GlobalCard>(create);
  static GlobalCard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get deckID => $_getIZ(1);
  @$pb.TagNumber(2)
  set deckID($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeckID() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeckID() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get question => $_getSZ(2);
  @$pb.TagNumber(3)
  set question($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasQuestion() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuestion() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get answer => $_getSZ(3);
  @$pb.TagNumber(4)
  set answer($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAnswer() => $_has(3);
  @$pb.TagNumber(4)
  void clearAnswer() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get authorID => $_getIZ(4);
  @$pb.TagNumber(5)
  set authorID($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAuthorID() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthorID() => $_clearField(5);

  @$pb.TagNumber(6)
  $1.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($1.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureCreatedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $1.Timestamp get updatedAt => $_getN(6);
  @$pb.TagNumber(7)
  set updatedAt($1.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureUpdatedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get version => $_getIZ(7);
  @$pb.TagNumber(8)
  set version($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasVersion() => $_has(7);
  @$pb.TagNumber(8)
  void clearVersion() => $_clearField(8);
}

class CreateGlobalCardRequest extends $pb.GeneratedMessage {
  factory CreateGlobalCardRequest({
    $core.String? question,
    $core.String? answer,
    $core.int? deckID,
  }) {
    final result = create();
    if (question != null) result.question = question;
    if (answer != null) result.answer = answer;
    if (deckID != null) result.deckID = deckID;
    return result;
  }

  CreateGlobalCardRequest._();

  factory CreateGlobalCardRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CreateGlobalCardRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateGlobalCardRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_card'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'question')
    ..aOS(2, _omitFieldNames ? '' : 'answer')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'deckID', $pb.PbFieldType.O3, protoName: 'deckID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGlobalCardRequest clone() => CreateGlobalCardRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGlobalCardRequest copyWith(void Function(CreateGlobalCardRequest) updates) => super.copyWith((message) => updates(message as CreateGlobalCardRequest)) as CreateGlobalCardRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateGlobalCardRequest create() => CreateGlobalCardRequest._();
  @$core.override
  CreateGlobalCardRequest createEmptyInstance() => create();
  static $pb.PbList<CreateGlobalCardRequest> createRepeated() => $pb.PbList<CreateGlobalCardRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateGlobalCardRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateGlobalCardRequest>(create);
  static CreateGlobalCardRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get question => $_getSZ(0);
  @$pb.TagNumber(1)
  set question($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuestion() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get answer => $_getSZ(1);
  @$pb.TagNumber(2)
  set answer($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnswer() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get deckID => $_getIZ(2);
  @$pb.TagNumber(3)
  set deckID($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDeckID() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeckID() => $_clearField(3);
}

class CreateGlobalCardResponse extends $pb.GeneratedMessage {
  factory CreateGlobalCardResponse({
    $core.int? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  CreateGlobalCardResponse._();

  factory CreateGlobalCardResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CreateGlobalCardResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateGlobalCardResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_card'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGlobalCardResponse clone() => CreateGlobalCardResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGlobalCardResponse copyWith(void Function(CreateGlobalCardResponse) updates) => super.copyWith((message) => updates(message as CreateGlobalCardResponse)) as CreateGlobalCardResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateGlobalCardResponse create() => CreateGlobalCardResponse._();
  @$core.override
  CreateGlobalCardResponse createEmptyInstance() => create();
  static $pb.PbList<CreateGlobalCardResponse> createRepeated() => $pb.PbList<CreateGlobalCardResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateGlobalCardResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateGlobalCardResponse>(create);
  static CreateGlobalCardResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class GetGlobalCardsByDeckIDRequest extends $pb.GeneratedMessage {
  factory GetGlobalCardsByDeckIDRequest({
    $core.int? deckID,
  }) {
    final result = create();
    if (deckID != null) result.deckID = deckID;
    return result;
  }

  GetGlobalCardsByDeckIDRequest._();

  factory GetGlobalCardsByDeckIDRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetGlobalCardsByDeckIDRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGlobalCardsByDeckIDRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_card'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'deckID', $pb.PbFieldType.O3, protoName: 'deckID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetGlobalCardsByDeckIDRequest clone() => GetGlobalCardsByDeckIDRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetGlobalCardsByDeckIDRequest copyWith(void Function(GetGlobalCardsByDeckIDRequest) updates) => super.copyWith((message) => updates(message as GetGlobalCardsByDeckIDRequest)) as GetGlobalCardsByDeckIDRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGlobalCardsByDeckIDRequest create() => GetGlobalCardsByDeckIDRequest._();
  @$core.override
  GetGlobalCardsByDeckIDRequest createEmptyInstance() => create();
  static $pb.PbList<GetGlobalCardsByDeckIDRequest> createRepeated() => $pb.PbList<GetGlobalCardsByDeckIDRequest>();
  @$core.pragma('dart2js:noInline')
  static GetGlobalCardsByDeckIDRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGlobalCardsByDeckIDRequest>(create);
  static GetGlobalCardsByDeckIDRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get deckID => $_getIZ(0);
  @$pb.TagNumber(1)
  set deckID($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeckID() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeckID() => $_clearField(1);
}

class GetGlobalCardsByDeckIDResponse extends $pb.GeneratedMessage {
  factory GetGlobalCardsByDeckIDResponse({
    $core.Iterable<GlobalCard>? globalCards,
  }) {
    final result = create();
    if (globalCards != null) result.globalCards.addAll(globalCards);
    return result;
  }

  GetGlobalCardsByDeckIDResponse._();

  factory GetGlobalCardsByDeckIDResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetGlobalCardsByDeckIDResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGlobalCardsByDeckIDResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_card'), createEmptyInstance: create)
    ..pc<GlobalCard>(1, _omitFieldNames ? '' : 'globalCards', $pb.PbFieldType.PM, protoName: 'globalCards', subBuilder: GlobalCard.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetGlobalCardsByDeckIDResponse clone() => GetGlobalCardsByDeckIDResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetGlobalCardsByDeckIDResponse copyWith(void Function(GetGlobalCardsByDeckIDResponse) updates) => super.copyWith((message) => updates(message as GetGlobalCardsByDeckIDResponse)) as GetGlobalCardsByDeckIDResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGlobalCardsByDeckIDResponse create() => GetGlobalCardsByDeckIDResponse._();
  @$core.override
  GetGlobalCardsByDeckIDResponse createEmptyInstance() => create();
  static $pb.PbList<GetGlobalCardsByDeckIDResponse> createRepeated() => $pb.PbList<GetGlobalCardsByDeckIDResponse>();
  @$core.pragma('dart2js:noInline')
  static GetGlobalCardsByDeckIDResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGlobalCardsByDeckIDResponse>(create);
  static GetGlobalCardsByDeckIDResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GlobalCard> get globalCards => $_getList(0);
}

class UpdateGlobalCardRequest extends $pb.GeneratedMessage {
  factory UpdateGlobalCardRequest({
    $core.String? question,
    $core.String? answer,
    $core.int? cardID,
    $core.int? version,
  }) {
    final result = create();
    if (question != null) result.question = question;
    if (answer != null) result.answer = answer;
    if (cardID != null) result.cardID = cardID;
    if (version != null) result.version = version;
    return result;
  }

  UpdateGlobalCardRequest._();

  factory UpdateGlobalCardRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UpdateGlobalCardRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateGlobalCardRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_card'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'question')
    ..aOS(2, _omitFieldNames ? '' : 'answer')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'cardID', $pb.PbFieldType.O3, protoName: 'cardID')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGlobalCardRequest clone() => UpdateGlobalCardRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGlobalCardRequest copyWith(void Function(UpdateGlobalCardRequest) updates) => super.copyWith((message) => updates(message as UpdateGlobalCardRequest)) as UpdateGlobalCardRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGlobalCardRequest create() => UpdateGlobalCardRequest._();
  @$core.override
  UpdateGlobalCardRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateGlobalCardRequest> createRepeated() => $pb.PbList<UpdateGlobalCardRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateGlobalCardRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateGlobalCardRequest>(create);
  static UpdateGlobalCardRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get question => $_getSZ(0);
  @$pb.TagNumber(1)
  set question($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuestion() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get answer => $_getSZ(1);
  @$pb.TagNumber(2)
  set answer($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnswer() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get cardID => $_getIZ(2);
  @$pb.TagNumber(3)
  set cardID($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCardID() => $_has(2);
  @$pb.TagNumber(3)
  void clearCardID() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get version => $_getIZ(3);
  @$pb.TagNumber(4)
  set version($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearVersion() => $_clearField(4);
}

class UpdateGlobalCardResponse extends $pb.GeneratedMessage {
  factory UpdateGlobalCardResponse({
    $core.bool? isSuccess,
    GlobalCard? conflictCard,
  }) {
    final result = create();
    if (isSuccess != null) result.isSuccess = isSuccess;
    if (conflictCard != null) result.conflictCard = conflictCard;
    return result;
  }

  UpdateGlobalCardResponse._();

  factory UpdateGlobalCardResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UpdateGlobalCardResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateGlobalCardResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_card'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isSuccess', protoName: 'isSuccess')
    ..aOM<GlobalCard>(2, _omitFieldNames ? '' : 'conflictCard', protoName: 'conflictCard', subBuilder: GlobalCard.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGlobalCardResponse clone() => UpdateGlobalCardResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGlobalCardResponse copyWith(void Function(UpdateGlobalCardResponse) updates) => super.copyWith((message) => updates(message as UpdateGlobalCardResponse)) as UpdateGlobalCardResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGlobalCardResponse create() => UpdateGlobalCardResponse._();
  @$core.override
  UpdateGlobalCardResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateGlobalCardResponse> createRepeated() => $pb.PbList<UpdateGlobalCardResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateGlobalCardResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateGlobalCardResponse>(create);
  static UpdateGlobalCardResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isSuccess => $_getBF(0);
  @$pb.TagNumber(1)
  set isSuccess($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  GlobalCard get conflictCard => $_getN(1);
  @$pb.TagNumber(2)
  set conflictCard(GlobalCard value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasConflictCard() => $_has(1);
  @$pb.TagNumber(2)
  void clearConflictCard() => $_clearField(2);
  @$pb.TagNumber(2)
  GlobalCard ensureConflictCard() => $_ensure(1);
}

class DeleteGlobalCardRequest extends $pb.GeneratedMessage {
  factory DeleteGlobalCardRequest({
    $core.int? cardId,
  }) {
    final result = create();
    if (cardId != null) result.cardId = cardId;
    return result;
  }

  DeleteGlobalCardRequest._();

  factory DeleteGlobalCardRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DeleteGlobalCardRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteGlobalCardRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_card'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'cardId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteGlobalCardRequest clone() => DeleteGlobalCardRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteGlobalCardRequest copyWith(void Function(DeleteGlobalCardRequest) updates) => super.copyWith((message) => updates(message as DeleteGlobalCardRequest)) as DeleteGlobalCardRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteGlobalCardRequest create() => DeleteGlobalCardRequest._();
  @$core.override
  DeleteGlobalCardRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteGlobalCardRequest> createRepeated() => $pb.PbList<DeleteGlobalCardRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteGlobalCardRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteGlobalCardRequest>(create);
  static DeleteGlobalCardRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cardId => $_getIZ(0);
  @$pb.TagNumber(1)
  set cardId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCardId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCardId() => $_clearField(1);
}

class DeleteGlobalCardResponse extends $pb.GeneratedMessage {
  factory DeleteGlobalCardResponse({
    $core.bool? isSuccess,
  }) {
    final result = create();
    if (isSuccess != null) result.isSuccess = isSuccess;
    return result;
  }

  DeleteGlobalCardResponse._();

  factory DeleteGlobalCardResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DeleteGlobalCardResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteGlobalCardResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_card'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isSuccess', protoName: 'isSuccess')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteGlobalCardResponse clone() => DeleteGlobalCardResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteGlobalCardResponse copyWith(void Function(DeleteGlobalCardResponse) updates) => super.copyWith((message) => updates(message as DeleteGlobalCardResponse)) as DeleteGlobalCardResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteGlobalCardResponse create() => DeleteGlobalCardResponse._();
  @$core.override
  DeleteGlobalCardResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteGlobalCardResponse> createRepeated() => $pb.PbList<DeleteGlobalCardResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteGlobalCardResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteGlobalCardResponse>(create);
  static DeleteGlobalCardResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isSuccess => $_getBF(0);
  @$pb.TagNumber(1)
  set isSuccess($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSuccess() => $_clearField(1);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
