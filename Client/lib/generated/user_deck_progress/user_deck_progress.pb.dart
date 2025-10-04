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

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class UserDeckProgress extends $pb.GeneratedMessage {
  factory UserDeckProgress({
    $core.int? userId,
    $core.int? deckId,
    $core.String? title,
    $core.String? description,
    $1.Timestamp? lastReviewedAt,
    $core.int? score,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (deckId != null) result.deckId = deckId;
    if (title != null) result.title = title;
    if (description != null) result.description = description;
    if (lastReviewedAt != null) result.lastReviewedAt = lastReviewedAt;
    if (score != null) result.score = score;
    return result;
  }

  UserDeckProgress._();

  factory UserDeckProgress.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UserDeckProgress.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserDeckProgress', package: const $pb.PackageName(_omitMessageNames ? '' : 'user_deck_progress'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'deckId', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'lastReviewedAt', subBuilder: $1.Timestamp.create)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'score', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserDeckProgress clone() => UserDeckProgress()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserDeckProgress copyWith(void Function(UserDeckProgress) updates) => super.copyWith((message) => updates(message as UserDeckProgress)) as UserDeckProgress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserDeckProgress create() => UserDeckProgress._();
  @$core.override
  UserDeckProgress createEmptyInstance() => create();
  static $pb.PbList<UserDeckProgress> createRepeated() => $pb.PbList<UserDeckProgress>();
  @$core.pragma('dart2js:noInline')
  static UserDeckProgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserDeckProgress>(create);
  static UserDeckProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get deckId => $_getIZ(1);
  @$pb.TagNumber(2)
  set deckId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeckId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeckId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);

  @$pb.TagNumber(5)
  $1.Timestamp get lastReviewedAt => $_getN(4);
  @$pb.TagNumber(5)
  set lastReviewedAt($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasLastReviewedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastReviewedAt() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureLastReviewedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get score => $_getIZ(5);
  @$pb.TagNumber(6)
  set score($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasScore() => $_has(5);
  @$pb.TagNumber(6)
  void clearScore() => $_clearField(6);
}

class GetUserLearningProgressDecksRequest extends $pb.GeneratedMessage {
  factory GetUserLearningProgressDecksRequest() => create();

  GetUserLearningProgressDecksRequest._();

  factory GetUserLearningProgressDecksRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetUserLearningProgressDecksRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserLearningProgressDecksRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user_deck_progress'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserLearningProgressDecksRequest clone() => GetUserLearningProgressDecksRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserLearningProgressDecksRequest copyWith(void Function(GetUserLearningProgressDecksRequest) updates) => super.copyWith((message) => updates(message as GetUserLearningProgressDecksRequest)) as GetUserLearningProgressDecksRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserLearningProgressDecksRequest create() => GetUserLearningProgressDecksRequest._();
  @$core.override
  GetUserLearningProgressDecksRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserLearningProgressDecksRequest> createRepeated() => $pb.PbList<GetUserLearningProgressDecksRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserLearningProgressDecksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserLearningProgressDecksRequest>(create);
  static GetUserLearningProgressDecksRequest? _defaultInstance;
}

class GetUserLearningProgressDecksResponse extends $pb.GeneratedMessage {
  factory GetUserLearningProgressDecksResponse({
    $core.Iterable<UserDeckProgress>? userDeckProgressList,
  }) {
    final result = create();
    if (userDeckProgressList != null) result.userDeckProgressList.addAll(userDeckProgressList);
    return result;
  }

  GetUserLearningProgressDecksResponse._();

  factory GetUserLearningProgressDecksResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetUserLearningProgressDecksResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserLearningProgressDecksResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user_deck_progress'), createEmptyInstance: create)
    ..pc<UserDeckProgress>(1, _omitFieldNames ? '' : 'userDeckProgressList', $pb.PbFieldType.PM, subBuilder: UserDeckProgress.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserLearningProgressDecksResponse clone() => GetUserLearningProgressDecksResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserLearningProgressDecksResponse copyWith(void Function(GetUserLearningProgressDecksResponse) updates) => super.copyWith((message) => updates(message as GetUserLearningProgressDecksResponse)) as GetUserLearningProgressDecksResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserLearningProgressDecksResponse create() => GetUserLearningProgressDecksResponse._();
  @$core.override
  GetUserLearningProgressDecksResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserLearningProgressDecksResponse> createRepeated() => $pb.PbList<GetUserLearningProgressDecksResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserLearningProgressDecksResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserLearningProgressDecksResponse>(create);
  static GetUserLearningProgressDecksResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserDeckProgress> get userDeckProgressList => $_getList(0);
}

class UserProgressDecks extends $pb.GeneratedMessage {
  factory UserProgressDecks({
    $core.Iterable<UserDeckProgress>? userProgressDecks,
  }) {
    final result = create();
    if (userProgressDecks != null) result.userProgressDecks.addAll(userProgressDecks);
    return result;
  }

  UserProgressDecks._();

  factory UserProgressDecks.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UserProgressDecks.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserProgressDecks', package: const $pb.PackageName(_omitMessageNames ? '' : 'user_deck_progress'), createEmptyInstance: create)
    ..pc<UserDeckProgress>(1, _omitFieldNames ? '' : 'userProgressDecks', $pb.PbFieldType.PM, subBuilder: UserDeckProgress.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserProgressDecks clone() => UserProgressDecks()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserProgressDecks copyWith(void Function(UserProgressDecks) updates) => super.copyWith((message) => updates(message as UserProgressDecks)) as UserProgressDecks;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserProgressDecks create() => UserProgressDecks._();
  @$core.override
  UserProgressDecks createEmptyInstance() => create();
  static $pb.PbList<UserProgressDecks> createRepeated() => $pb.PbList<UserProgressDecks>();
  @$core.pragma('dart2js:noInline')
  static UserProgressDecks getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserProgressDecks>(create);
  static UserProgressDecks? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserDeckProgress> get userProgressDecks => $_getList(0);
}

class DeleteDeckFromLearningDecksRequest extends $pb.GeneratedMessage {
  factory DeleteDeckFromLearningDecksRequest({
    $core.int? deckId,
  }) {
    final result = create();
    if (deckId != null) result.deckId = deckId;
    return result;
  }

  DeleteDeckFromLearningDecksRequest._();

  factory DeleteDeckFromLearningDecksRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DeleteDeckFromLearningDecksRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteDeckFromLearningDecksRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user_deck_progress'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'deckId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDeckFromLearningDecksRequest clone() => DeleteDeckFromLearningDecksRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDeckFromLearningDecksRequest copyWith(void Function(DeleteDeckFromLearningDecksRequest) updates) => super.copyWith((message) => updates(message as DeleteDeckFromLearningDecksRequest)) as DeleteDeckFromLearningDecksRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteDeckFromLearningDecksRequest create() => DeleteDeckFromLearningDecksRequest._();
  @$core.override
  DeleteDeckFromLearningDecksRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteDeckFromLearningDecksRequest> createRepeated() => $pb.PbList<DeleteDeckFromLearningDecksRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteDeckFromLearningDecksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteDeckFromLearningDecksRequest>(create);
  static DeleteDeckFromLearningDecksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get deckId => $_getIZ(0);
  @$pb.TagNumber(1)
  set deckId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeckId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeckId() => $_clearField(1);
}

class DeleteDeckFromLearningDecksResponse extends $pb.GeneratedMessage {
  factory DeleteDeckFromLearningDecksResponse({
    $core.bool? isSuccess,
  }) {
    final result = create();
    if (isSuccess != null) result.isSuccess = isSuccess;
    return result;
  }

  DeleteDeckFromLearningDecksResponse._();

  factory DeleteDeckFromLearningDecksResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DeleteDeckFromLearningDecksResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteDeckFromLearningDecksResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user_deck_progress'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isSuccess', protoName: 'isSuccess')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDeckFromLearningDecksResponse clone() => DeleteDeckFromLearningDecksResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDeckFromLearningDecksResponse copyWith(void Function(DeleteDeckFromLearningDecksResponse) updates) => super.copyWith((message) => updates(message as DeleteDeckFromLearningDecksResponse)) as DeleteDeckFromLearningDecksResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteDeckFromLearningDecksResponse create() => DeleteDeckFromLearningDecksResponse._();
  @$core.override
  DeleteDeckFromLearningDecksResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteDeckFromLearningDecksResponse> createRepeated() => $pb.PbList<DeleteDeckFromLearningDecksResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteDeckFromLearningDecksResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteDeckFromLearningDecksResponse>(create);
  static DeleteDeckFromLearningDecksResponse? _defaultInstance;

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
