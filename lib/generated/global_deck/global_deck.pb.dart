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

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GlobalDeck extends $pb.GeneratedMessage {
  factory GlobalDeck({
    $core.int? id,
    $core.String? title,
    $core.String? description,
    $core.int? authorID,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
    $core.bool? isPublic,
    $core.Iterable<$core.String>? tags,
    $core.int? version,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (title != null) result.title = title;
    if (description != null) result.description = description;
    if (authorID != null) result.authorID = authorID;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (isPublic != null) result.isPublic = isPublic;
    if (tags != null) result.tags.addAll(tags);
    if (version != null) result.version = version;
    return result;
  }

  GlobalDeck._();

  factory GlobalDeck.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GlobalDeck.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GlobalDeck', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'authorID', $pb.PbFieldType.O3, protoName: 'authorID')
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'updatedAt', subBuilder: $1.Timestamp.create)
    ..aOB(7, _omitFieldNames ? '' : 'isPublic', protoName: 'isPublic')
    ..pPS(8, _omitFieldNames ? '' : 'tags')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GlobalDeck clone() => GlobalDeck()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GlobalDeck copyWith(void Function(GlobalDeck) updates) => super.copyWith((message) => updates(message as GlobalDeck)) as GlobalDeck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GlobalDeck create() => GlobalDeck._();
  @$core.override
  GlobalDeck createEmptyInstance() => create();
  static $pb.PbList<GlobalDeck> createRepeated() => $pb.PbList<GlobalDeck>();
  @$core.pragma('dart2js:noInline')
  static GlobalDeck getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GlobalDeck>(create);
  static GlobalDeck? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get authorID => $_getIZ(3);
  @$pb.TagNumber(4)
  set authorID($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAuthorID() => $_has(3);
  @$pb.TagNumber(4)
  void clearAuthorID() => $_clearField(4);

  @$pb.TagNumber(5)
  $1.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureCreatedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Timestamp get updatedAt => $_getN(5);
  @$pb.TagNumber(6)
  set updatedAt($1.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasUpdatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdatedAt() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureUpdatedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.bool get isPublic => $_getBF(6);
  @$pb.TagNumber(7)
  set isPublic($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasIsPublic() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsPublic() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get tags => $_getList(7);

  @$pb.TagNumber(9)
  $core.int get version => $_getIZ(8);
  @$pb.TagNumber(9)
  set version($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasVersion() => $_has(8);
  @$pb.TagNumber(9)
  void clearVersion() => $_clearField(9);
}

class CreateGlobalDeckRequest extends $pb.GeneratedMessage {
  factory CreateGlobalDeckRequest({
    $core.String? title,
    $core.String? description,
    $core.bool? isPublic,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (description != null) result.description = description;
    if (isPublic != null) result.isPublic = isPublic;
    return result;
  }

  CreateGlobalDeckRequest._();

  factory CreateGlobalDeckRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CreateGlobalDeckRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateGlobalDeckRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOB(3, _omitFieldNames ? '' : 'isPublic', protoName: 'isPublic')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGlobalDeckRequest clone() => CreateGlobalDeckRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGlobalDeckRequest copyWith(void Function(CreateGlobalDeckRequest) updates) => super.copyWith((message) => updates(message as CreateGlobalDeckRequest)) as CreateGlobalDeckRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateGlobalDeckRequest create() => CreateGlobalDeckRequest._();
  @$core.override
  CreateGlobalDeckRequest createEmptyInstance() => create();
  static $pb.PbList<CreateGlobalDeckRequest> createRepeated() => $pb.PbList<CreateGlobalDeckRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateGlobalDeckRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateGlobalDeckRequest>(create);
  static CreateGlobalDeckRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isPublic => $_getBF(2);
  @$pb.TagNumber(3)
  set isPublic($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsPublic() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsPublic() => $_clearField(3);
}

class CreateGlobalDeckResponse extends $pb.GeneratedMessage {
  factory CreateGlobalDeckResponse({
    $core.int? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  CreateGlobalDeckResponse._();

  factory CreateGlobalDeckResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CreateGlobalDeckResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateGlobalDeckResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGlobalDeckResponse clone() => CreateGlobalDeckResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGlobalDeckResponse copyWith(void Function(CreateGlobalDeckResponse) updates) => super.copyWith((message) => updates(message as CreateGlobalDeckResponse)) as CreateGlobalDeckResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateGlobalDeckResponse create() => CreateGlobalDeckResponse._();
  @$core.override
  CreateGlobalDeckResponse createEmptyInstance() => create();
  static $pb.PbList<CreateGlobalDeckResponse> createRepeated() => $pb.PbList<CreateGlobalDeckResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateGlobalDeckResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateGlobalDeckResponse>(create);
  static CreateGlobalDeckResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class GetEditableDecksRequest extends $pb.GeneratedMessage {
  factory GetEditableDecksRequest() => create();

  GetEditableDecksRequest._();

  factory GetEditableDecksRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetEditableDecksRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetEditableDecksRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEditableDecksRequest clone() => GetEditableDecksRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEditableDecksRequest copyWith(void Function(GetEditableDecksRequest) updates) => super.copyWith((message) => updates(message as GetEditableDecksRequest)) as GetEditableDecksRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEditableDecksRequest create() => GetEditableDecksRequest._();
  @$core.override
  GetEditableDecksRequest createEmptyInstance() => create();
  static $pb.PbList<GetEditableDecksRequest> createRepeated() => $pb.PbList<GetEditableDecksRequest>();
  @$core.pragma('dart2js:noInline')
  static GetEditableDecksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEditableDecksRequest>(create);
  static GetEditableDecksRequest? _defaultInstance;
}

class GetEditableDecksResponse extends $pb.GeneratedMessage {
  factory GetEditableDecksResponse({
    $core.Iterable<GlobalDeck>? listOfGlobalDecks,
  }) {
    final result = create();
    if (listOfGlobalDecks != null) result.listOfGlobalDecks.addAll(listOfGlobalDecks);
    return result;
  }

  GetEditableDecksResponse._();

  factory GetEditableDecksResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetEditableDecksResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetEditableDecksResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..pc<GlobalDeck>(1, _omitFieldNames ? '' : 'listOfGlobalDecks', $pb.PbFieldType.PM, protoName: 'listOfGlobalDecks', subBuilder: GlobalDeck.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEditableDecksResponse clone() => GetEditableDecksResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEditableDecksResponse copyWith(void Function(GetEditableDecksResponse) updates) => super.copyWith((message) => updates(message as GetEditableDecksResponse)) as GetEditableDecksResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEditableDecksResponse create() => GetEditableDecksResponse._();
  @$core.override
  GetEditableDecksResponse createEmptyInstance() => create();
  static $pb.PbList<GetEditableDecksResponse> createRepeated() => $pb.PbList<GetEditableDecksResponse>();
  @$core.pragma('dart2js:noInline')
  static GetEditableDecksResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEditableDecksResponse>(create);
  static GetEditableDecksResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GlobalDeck> get listOfGlobalDecks => $_getList(0);
}

class UpdateGlobalDeckRequest extends $pb.GeneratedMessage {
  factory UpdateGlobalDeckRequest({
    GlobalDeck? globalDeck,
  }) {
    final result = create();
    if (globalDeck != null) result.globalDeck = globalDeck;
    return result;
  }

  UpdateGlobalDeckRequest._();

  factory UpdateGlobalDeckRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UpdateGlobalDeckRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateGlobalDeckRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..aOM<GlobalDeck>(1, _omitFieldNames ? '' : 'globalDeck', protoName: 'globalDeck', subBuilder: GlobalDeck.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGlobalDeckRequest clone() => UpdateGlobalDeckRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGlobalDeckRequest copyWith(void Function(UpdateGlobalDeckRequest) updates) => super.copyWith((message) => updates(message as UpdateGlobalDeckRequest)) as UpdateGlobalDeckRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGlobalDeckRequest create() => UpdateGlobalDeckRequest._();
  @$core.override
  UpdateGlobalDeckRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateGlobalDeckRequest> createRepeated() => $pb.PbList<UpdateGlobalDeckRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateGlobalDeckRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateGlobalDeckRequest>(create);
  static UpdateGlobalDeckRequest? _defaultInstance;

  @$pb.TagNumber(1)
  GlobalDeck get globalDeck => $_getN(0);
  @$pb.TagNumber(1)
  set globalDeck(GlobalDeck value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGlobalDeck() => $_has(0);
  @$pb.TagNumber(1)
  void clearGlobalDeck() => $_clearField(1);
  @$pb.TagNumber(1)
  GlobalDeck ensureGlobalDeck() => $_ensure(0);
}

class UpdateGlobalDeckResponse extends $pb.GeneratedMessage {
  factory UpdateGlobalDeckResponse({
    GlobalDeck? conflictDeck,
    $core.bool? isSuccess,
  }) {
    final result = create();
    if (conflictDeck != null) result.conflictDeck = conflictDeck;
    if (isSuccess != null) result.isSuccess = isSuccess;
    return result;
  }

  UpdateGlobalDeckResponse._();

  factory UpdateGlobalDeckResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UpdateGlobalDeckResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateGlobalDeckResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..aOM<GlobalDeck>(1, _omitFieldNames ? '' : 'conflictDeck', protoName: 'conflictDeck', subBuilder: GlobalDeck.create)
    ..aOB(2, _omitFieldNames ? '' : 'isSuccess', protoName: 'isSuccess')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGlobalDeckResponse clone() => UpdateGlobalDeckResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGlobalDeckResponse copyWith(void Function(UpdateGlobalDeckResponse) updates) => super.copyWith((message) => updates(message as UpdateGlobalDeckResponse)) as UpdateGlobalDeckResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGlobalDeckResponse create() => UpdateGlobalDeckResponse._();
  @$core.override
  UpdateGlobalDeckResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateGlobalDeckResponse> createRepeated() => $pb.PbList<UpdateGlobalDeckResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateGlobalDeckResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateGlobalDeckResponse>(create);
  static UpdateGlobalDeckResponse? _defaultInstance;

  @$pb.TagNumber(1)
  GlobalDeck get conflictDeck => $_getN(0);
  @$pb.TagNumber(1)
  set conflictDeck(GlobalDeck value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasConflictDeck() => $_has(0);
  @$pb.TagNumber(1)
  void clearConflictDeck() => $_clearField(1);
  @$pb.TagNumber(1)
  GlobalDeck ensureConflictDeck() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get isSuccess => $_getBF(1);
  @$pb.TagNumber(2)
  set isSuccess($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsSuccess() => $_clearField(2);
}

class GetGlobalDeckInfoByIDRequest extends $pb.GeneratedMessage {
  factory GetGlobalDeckInfoByIDRequest({
    $core.int? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  GetGlobalDeckInfoByIDRequest._();

  factory GetGlobalDeckInfoByIDRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetGlobalDeckInfoByIDRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGlobalDeckInfoByIDRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetGlobalDeckInfoByIDRequest clone() => GetGlobalDeckInfoByIDRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetGlobalDeckInfoByIDRequest copyWith(void Function(GetGlobalDeckInfoByIDRequest) updates) => super.copyWith((message) => updates(message as GetGlobalDeckInfoByIDRequest)) as GetGlobalDeckInfoByIDRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGlobalDeckInfoByIDRequest create() => GetGlobalDeckInfoByIDRequest._();
  @$core.override
  GetGlobalDeckInfoByIDRequest createEmptyInstance() => create();
  static $pb.PbList<GetGlobalDeckInfoByIDRequest> createRepeated() => $pb.PbList<GetGlobalDeckInfoByIDRequest>();
  @$core.pragma('dart2js:noInline')
  static GetGlobalDeckInfoByIDRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGlobalDeckInfoByIDRequest>(create);
  static GetGlobalDeckInfoByIDRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class GetGlobalDeckInfoByIDResponse extends $pb.GeneratedMessage {
  factory GetGlobalDeckInfoByIDResponse({
    GlobalDeck? globalDeck,
    $core.String? authName,
    $core.Iterable<$core.String>? editorNames,
  }) {
    final result = create();
    if (globalDeck != null) result.globalDeck = globalDeck;
    if (authName != null) result.authName = authName;
    if (editorNames != null) result.editorNames.addAll(editorNames);
    return result;
  }

  GetGlobalDeckInfoByIDResponse._();

  factory GetGlobalDeckInfoByIDResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetGlobalDeckInfoByIDResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetGlobalDeckInfoByIDResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..aOM<GlobalDeck>(1, _omitFieldNames ? '' : 'globalDeck', protoName: 'globalDeck', subBuilder: GlobalDeck.create)
    ..aOS(2, _omitFieldNames ? '' : 'authName', protoName: 'authName')
    ..pPS(3, _omitFieldNames ? '' : 'editorNames', protoName: 'editorNames')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetGlobalDeckInfoByIDResponse clone() => GetGlobalDeckInfoByIDResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetGlobalDeckInfoByIDResponse copyWith(void Function(GetGlobalDeckInfoByIDResponse) updates) => super.copyWith((message) => updates(message as GetGlobalDeckInfoByIDResponse)) as GetGlobalDeckInfoByIDResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetGlobalDeckInfoByIDResponse create() => GetGlobalDeckInfoByIDResponse._();
  @$core.override
  GetGlobalDeckInfoByIDResponse createEmptyInstance() => create();
  static $pb.PbList<GetGlobalDeckInfoByIDResponse> createRepeated() => $pb.PbList<GetGlobalDeckInfoByIDResponse>();
  @$core.pragma('dart2js:noInline')
  static GetGlobalDeckInfoByIDResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetGlobalDeckInfoByIDResponse>(create);
  static GetGlobalDeckInfoByIDResponse? _defaultInstance;

  @$pb.TagNumber(1)
  GlobalDeck get globalDeck => $_getN(0);
  @$pb.TagNumber(1)
  set globalDeck(GlobalDeck value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGlobalDeck() => $_has(0);
  @$pb.TagNumber(1)
  void clearGlobalDeck() => $_clearField(1);
  @$pb.TagNumber(1)
  GlobalDeck ensureGlobalDeck() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get authName => $_getSZ(1);
  @$pb.TagNumber(2)
  set authName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAuthName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthName() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get editorNames => $_getList(2);
}

class DeleteGlobalDeckRequest extends $pb.GeneratedMessage {
  factory DeleteGlobalDeckRequest({
    $core.int? deckID,
  }) {
    final result = create();
    if (deckID != null) result.deckID = deckID;
    return result;
  }

  DeleteGlobalDeckRequest._();

  factory DeleteGlobalDeckRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DeleteGlobalDeckRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteGlobalDeckRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'deckID', $pb.PbFieldType.O3, protoName: 'deckID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteGlobalDeckRequest clone() => DeleteGlobalDeckRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteGlobalDeckRequest copyWith(void Function(DeleteGlobalDeckRequest) updates) => super.copyWith((message) => updates(message as DeleteGlobalDeckRequest)) as DeleteGlobalDeckRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteGlobalDeckRequest create() => DeleteGlobalDeckRequest._();
  @$core.override
  DeleteGlobalDeckRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteGlobalDeckRequest> createRepeated() => $pb.PbList<DeleteGlobalDeckRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteGlobalDeckRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteGlobalDeckRequest>(create);
  static DeleteGlobalDeckRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get deckID => $_getIZ(0);
  @$pb.TagNumber(1)
  set deckID($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeckID() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeckID() => $_clearField(1);
}

class DeleteGlobalDeckResponse extends $pb.GeneratedMessage {
  factory DeleteGlobalDeckResponse({
    $core.bool? isSuccess,
  }) {
    final result = create();
    if (isSuccess != null) result.isSuccess = isSuccess;
    return result;
  }

  DeleteGlobalDeckResponse._();

  factory DeleteGlobalDeckResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DeleteGlobalDeckResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteGlobalDeckResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isSuccess', protoName: 'isSuccess')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteGlobalDeckResponse clone() => DeleteGlobalDeckResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteGlobalDeckResponse copyWith(void Function(DeleteGlobalDeckResponse) updates) => super.copyWith((message) => updates(message as DeleteGlobalDeckResponse)) as DeleteGlobalDeckResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteGlobalDeckResponse create() => DeleteGlobalDeckResponse._();
  @$core.override
  DeleteGlobalDeckResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteGlobalDeckResponse> createRepeated() => $pb.PbList<DeleteGlobalDeckResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteGlobalDeckResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteGlobalDeckResponse>(create);
  static DeleteGlobalDeckResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isSuccess => $_getBF(0);
  @$pb.TagNumber(1)
  set isSuccess($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSuccess() => $_clearField(1);
}

class SearchGlobalDecksRequest extends $pb.GeneratedMessage {
  factory SearchGlobalDecksRequest({
    $core.String? query,
    $core.int? limit,
    $core.int? offset,
  }) {
    final result = create();
    if (query != null) result.query = query;
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    return result;
  }

  SearchGlobalDecksRequest._();

  factory SearchGlobalDecksRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SearchGlobalDecksRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchGlobalDecksRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'query')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchGlobalDecksRequest clone() => SearchGlobalDecksRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchGlobalDecksRequest copyWith(void Function(SearchGlobalDecksRequest) updates) => super.copyWith((message) => updates(message as SearchGlobalDecksRequest)) as SearchGlobalDecksRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchGlobalDecksRequest create() => SearchGlobalDecksRequest._();
  @$core.override
  SearchGlobalDecksRequest createEmptyInstance() => create();
  static $pb.PbList<SearchGlobalDecksRequest> createRepeated() => $pb.PbList<SearchGlobalDecksRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchGlobalDecksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchGlobalDecksRequest>(create);
  static SearchGlobalDecksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => $_clearField(3);
}

class SearchGlobalDecksResponse extends $pb.GeneratedMessage {
  factory SearchGlobalDecksResponse({
    $core.Iterable<SearchResultDeck>? results,
    $core.bool? hasMore,
  }) {
    final result = create();
    if (results != null) result.results.addAll(results);
    if (hasMore != null) result.hasMore = hasMore;
    return result;
  }

  SearchGlobalDecksResponse._();

  factory SearchGlobalDecksResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SearchGlobalDecksResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchGlobalDecksResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..pc<SearchResultDeck>(1, _omitFieldNames ? '' : 'results', $pb.PbFieldType.PM, subBuilder: SearchResultDeck.create)
    ..aOB(2, _omitFieldNames ? '' : 'hasMore')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchGlobalDecksResponse clone() => SearchGlobalDecksResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchGlobalDecksResponse copyWith(void Function(SearchGlobalDecksResponse) updates) => super.copyWith((message) => updates(message as SearchGlobalDecksResponse)) as SearchGlobalDecksResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchGlobalDecksResponse create() => SearchGlobalDecksResponse._();
  @$core.override
  SearchGlobalDecksResponse createEmptyInstance() => create();
  static $pb.PbList<SearchGlobalDecksResponse> createRepeated() => $pb.PbList<SearchGlobalDecksResponse>();
  @$core.pragma('dart2js:noInline')
  static SearchGlobalDecksResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchGlobalDecksResponse>(create);
  static SearchGlobalDecksResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SearchResultDeck> get results => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get hasMore => $_getBF(1);
  @$pb.TagNumber(2)
  set hasMore($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasMore() => $_clearField(2);
}

class SearchResultDeck extends $pb.GeneratedMessage {
  factory SearchResultDeck({
    GlobalDeck? deck,
    $core.bool? isAlreadyAdded,
  }) {
    final result = create();
    if (deck != null) result.deck = deck;
    if (isAlreadyAdded != null) result.isAlreadyAdded = isAlreadyAdded;
    return result;
  }

  SearchResultDeck._();

  factory SearchResultDeck.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SearchResultDeck.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchResultDeck', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..aOM<GlobalDeck>(1, _omitFieldNames ? '' : 'deck', subBuilder: GlobalDeck.create)
    ..aOB(2, _omitFieldNames ? '' : 'isAlreadyAdded')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchResultDeck clone() => SearchResultDeck()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchResultDeck copyWith(void Function(SearchResultDeck) updates) => super.copyWith((message) => updates(message as SearchResultDeck)) as SearchResultDeck;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchResultDeck create() => SearchResultDeck._();
  @$core.override
  SearchResultDeck createEmptyInstance() => create();
  static $pb.PbList<SearchResultDeck> createRepeated() => $pb.PbList<SearchResultDeck>();
  @$core.pragma('dart2js:noInline')
  static SearchResultDeck getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchResultDeck>(create);
  static SearchResultDeck? _defaultInstance;

  @$pb.TagNumber(1)
  GlobalDeck get deck => $_getN(0);
  @$pb.TagNumber(1)
  set deck(GlobalDeck value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDeck() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeck() => $_clearField(1);
  @$pb.TagNumber(1)
  GlobalDeck ensureDeck() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get isAlreadyAdded => $_getBF(1);
  @$pb.TagNumber(2)
  set isAlreadyAdded($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsAlreadyAdded() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAlreadyAdded() => $_clearField(2);
}

class AddDeckToLearningDecksRequest extends $pb.GeneratedMessage {
  factory AddDeckToLearningDecksRequest({
    $core.int? deckID,
  }) {
    final result = create();
    if (deckID != null) result.deckID = deckID;
    return result;
  }

  AddDeckToLearningDecksRequest._();

  factory AddDeckToLearningDecksRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory AddDeckToLearningDecksRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddDeckToLearningDecksRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'deckID', $pb.PbFieldType.O3, protoName: 'deckID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddDeckToLearningDecksRequest clone() => AddDeckToLearningDecksRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddDeckToLearningDecksRequest copyWith(void Function(AddDeckToLearningDecksRequest) updates) => super.copyWith((message) => updates(message as AddDeckToLearningDecksRequest)) as AddDeckToLearningDecksRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddDeckToLearningDecksRequest create() => AddDeckToLearningDecksRequest._();
  @$core.override
  AddDeckToLearningDecksRequest createEmptyInstance() => create();
  static $pb.PbList<AddDeckToLearningDecksRequest> createRepeated() => $pb.PbList<AddDeckToLearningDecksRequest>();
  @$core.pragma('dart2js:noInline')
  static AddDeckToLearningDecksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddDeckToLearningDecksRequest>(create);
  static AddDeckToLearningDecksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get deckID => $_getIZ(0);
  @$pb.TagNumber(1)
  set deckID($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeckID() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeckID() => $_clearField(1);
}

class AddDeckToLearningDecksResponse extends $pb.GeneratedMessage {
  factory AddDeckToLearningDecksResponse({
    $core.bool? isSuccess,
  }) {
    final result = create();
    if (isSuccess != null) result.isSuccess = isSuccess;
    return result;
  }

  AddDeckToLearningDecksResponse._();

  factory AddDeckToLearningDecksResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory AddDeckToLearningDecksResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddDeckToLearningDecksResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isSuccess', protoName: 'isSuccess')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddDeckToLearningDecksResponse clone() => AddDeckToLearningDecksResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddDeckToLearningDecksResponse copyWith(void Function(AddDeckToLearningDecksResponse) updates) => super.copyWith((message) => updates(message as AddDeckToLearningDecksResponse)) as AddDeckToLearningDecksResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddDeckToLearningDecksResponse create() => AddDeckToLearningDecksResponse._();
  @$core.override
  AddDeckToLearningDecksResponse createEmptyInstance() => create();
  static $pb.PbList<AddDeckToLearningDecksResponse> createRepeated() => $pb.PbList<AddDeckToLearningDecksResponse>();
  @$core.pragma('dart2js:noInline')
  static AddDeckToLearningDecksResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddDeckToLearningDecksResponse>(create);
  static AddDeckToLearningDecksResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isSuccess => $_getBF(0);
  @$pb.TagNumber(1)
  set isSuccess($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSuccess() => $_clearField(1);
}

class AddEditorToGlobalDeckRequest extends $pb.GeneratedMessage {
  factory AddEditorToGlobalDeckRequest({
    $core.int? deckID,
    $core.String? userName,
  }) {
    final result = create();
    if (deckID != null) result.deckID = deckID;
    if (userName != null) result.userName = userName;
    return result;
  }

  AddEditorToGlobalDeckRequest._();

  factory AddEditorToGlobalDeckRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory AddEditorToGlobalDeckRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddEditorToGlobalDeckRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'deckID', $pb.PbFieldType.O3, protoName: 'deck_ID')
    ..aOS(2, _omitFieldNames ? '' : 'userName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddEditorToGlobalDeckRequest clone() => AddEditorToGlobalDeckRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddEditorToGlobalDeckRequest copyWith(void Function(AddEditorToGlobalDeckRequest) updates) => super.copyWith((message) => updates(message as AddEditorToGlobalDeckRequest)) as AddEditorToGlobalDeckRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEditorToGlobalDeckRequest create() => AddEditorToGlobalDeckRequest._();
  @$core.override
  AddEditorToGlobalDeckRequest createEmptyInstance() => create();
  static $pb.PbList<AddEditorToGlobalDeckRequest> createRepeated() => $pb.PbList<AddEditorToGlobalDeckRequest>();
  @$core.pragma('dart2js:noInline')
  static AddEditorToGlobalDeckRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddEditorToGlobalDeckRequest>(create);
  static AddEditorToGlobalDeckRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get deckID => $_getIZ(0);
  @$pb.TagNumber(1)
  set deckID($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeckID() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeckID() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => $_clearField(2);
}

class AddEditorToGlobalDeckResponse extends $pb.GeneratedMessage {
  factory AddEditorToGlobalDeckResponse({
    $core.bool? isSuccess,
  }) {
    final result = create();
    if (isSuccess != null) result.isSuccess = isSuccess;
    return result;
  }

  AddEditorToGlobalDeckResponse._();

  factory AddEditorToGlobalDeckResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory AddEditorToGlobalDeckResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddEditorToGlobalDeckResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isSuccess', protoName: 'isSuccess')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddEditorToGlobalDeckResponse clone() => AddEditorToGlobalDeckResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddEditorToGlobalDeckResponse copyWith(void Function(AddEditorToGlobalDeckResponse) updates) => super.copyWith((message) => updates(message as AddEditorToGlobalDeckResponse)) as AddEditorToGlobalDeckResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEditorToGlobalDeckResponse create() => AddEditorToGlobalDeckResponse._();
  @$core.override
  AddEditorToGlobalDeckResponse createEmptyInstance() => create();
  static $pb.PbList<AddEditorToGlobalDeckResponse> createRepeated() => $pb.PbList<AddEditorToGlobalDeckResponse>();
  @$core.pragma('dart2js:noInline')
  static AddEditorToGlobalDeckResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddEditorToGlobalDeckResponse>(create);
  static AddEditorToGlobalDeckResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isSuccess => $_getBF(0);
  @$pb.TagNumber(1)
  set isSuccess($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSuccess() => $_clearField(1);
}

class DemoteEditorToLearnerRequest extends $pb.GeneratedMessage {
  factory DemoteEditorToLearnerRequest({
    $core.int? deckID,
    $core.String? userName,
  }) {
    final result = create();
    if (deckID != null) result.deckID = deckID;
    if (userName != null) result.userName = userName;
    return result;
  }

  DemoteEditorToLearnerRequest._();

  factory DemoteEditorToLearnerRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DemoteEditorToLearnerRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DemoteEditorToLearnerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'deckID', $pb.PbFieldType.O3, protoName: 'deck_ID')
    ..aOS(2, _omitFieldNames ? '' : 'userName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DemoteEditorToLearnerRequest clone() => DemoteEditorToLearnerRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DemoteEditorToLearnerRequest copyWith(void Function(DemoteEditorToLearnerRequest) updates) => super.copyWith((message) => updates(message as DemoteEditorToLearnerRequest)) as DemoteEditorToLearnerRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DemoteEditorToLearnerRequest create() => DemoteEditorToLearnerRequest._();
  @$core.override
  DemoteEditorToLearnerRequest createEmptyInstance() => create();
  static $pb.PbList<DemoteEditorToLearnerRequest> createRepeated() => $pb.PbList<DemoteEditorToLearnerRequest>();
  @$core.pragma('dart2js:noInline')
  static DemoteEditorToLearnerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DemoteEditorToLearnerRequest>(create);
  static DemoteEditorToLearnerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get deckID => $_getIZ(0);
  @$pb.TagNumber(1)
  set deckID($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeckID() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeckID() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => $_clearField(2);
}

class DemoteEditorToLearnerResponse extends $pb.GeneratedMessage {
  factory DemoteEditorToLearnerResponse({
    $core.bool? isSuccess,
  }) {
    final result = create();
    if (isSuccess != null) result.isSuccess = isSuccess;
    return result;
  }

  DemoteEditorToLearnerResponse._();

  factory DemoteEditorToLearnerResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DemoteEditorToLearnerResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DemoteEditorToLearnerResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'global_deck'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isSuccess', protoName: 'isSuccess')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DemoteEditorToLearnerResponse clone() => DemoteEditorToLearnerResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DemoteEditorToLearnerResponse copyWith(void Function(DemoteEditorToLearnerResponse) updates) => super.copyWith((message) => updates(message as DemoteEditorToLearnerResponse)) as DemoteEditorToLearnerResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DemoteEditorToLearnerResponse create() => DemoteEditorToLearnerResponse._();
  @$core.override
  DemoteEditorToLearnerResponse createEmptyInstance() => create();
  static $pb.PbList<DemoteEditorToLearnerResponse> createRepeated() => $pb.PbList<DemoteEditorToLearnerResponse>();
  @$core.pragma('dart2js:noInline')
  static DemoteEditorToLearnerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DemoteEditorToLearnerResponse>(create);
  static DemoteEditorToLearnerResponse? _defaultInstance;

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
