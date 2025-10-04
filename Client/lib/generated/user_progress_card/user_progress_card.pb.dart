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

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $1;
import 'user_progress_card.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'user_progress_card.pbenum.dart';

class UserProgressCard extends $pb.GeneratedMessage {
  factory UserProgressCard({
    $core.int? userId,
    $core.int? cardId,
    $core.String? question,
    $core.String? answer,
    $1.Timestamp? nextReviewDate,
    $1.Timestamp? lastReviewedAt,
    ShortTermMemory? shortTermMemory,
    $core.int? longTermMemory,
    $core.int? repetitionCount,
    $core.int? deckId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (cardId != null) result.cardId = cardId;
    if (question != null) result.question = question;
    if (answer != null) result.answer = answer;
    if (nextReviewDate != null) result.nextReviewDate = nextReviewDate;
    if (lastReviewedAt != null) result.lastReviewedAt = lastReviewedAt;
    if (shortTermMemory != null) result.shortTermMemory = shortTermMemory;
    if (longTermMemory != null) result.longTermMemory = longTermMemory;
    if (repetitionCount != null) result.repetitionCount = repetitionCount;
    if (deckId != null) result.deckId = deckId;
    return result;
  }

  UserProgressCard._();

  factory UserProgressCard.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory UserProgressCard.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserProgressCard', package: const $pb.PackageName(_omitMessageNames ? '' : 'user_progress_card'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'userId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'cardId', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'question')
    ..aOS(4, _omitFieldNames ? '' : 'answer')
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'nextReviewDate', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'lastReviewedAt', subBuilder: $1.Timestamp.create)
    ..e<ShortTermMemory>(7, _omitFieldNames ? '' : 'shortTermMemory', $pb.PbFieldType.OE, defaultOrMaker: ShortTermMemory.STM_UNKNOWN, valueOf: ShortTermMemory.valueOf, enumValues: ShortTermMemory.values)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'longTermMemory', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'repetitionCount', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'deckId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserProgressCard clone() => UserProgressCard()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserProgressCard copyWith(void Function(UserProgressCard) updates) => super.copyWith((message) => updates(message as UserProgressCard)) as UserProgressCard;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserProgressCard create() => UserProgressCard._();
  @$core.override
  UserProgressCard createEmptyInstance() => create();
  static $pb.PbList<UserProgressCard> createRepeated() => $pb.PbList<UserProgressCard>();
  @$core.pragma('dart2js:noInline')
  static UserProgressCard getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserProgressCard>(create);
  static UserProgressCard? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userId => $_getIZ(0);
  @$pb.TagNumber(1)
  set userId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get cardId => $_getIZ(1);
  @$pb.TagNumber(2)
  set cardId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCardId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCardId() => $_clearField(2);

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
  $1.Timestamp get nextReviewDate => $_getN(4);
  @$pb.TagNumber(5)
  set nextReviewDate($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasNextReviewDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearNextReviewDate() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureNextReviewDate() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Timestamp get lastReviewedAt => $_getN(5);
  @$pb.TagNumber(6)
  set lastReviewedAt($1.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasLastReviewedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastReviewedAt() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureLastReviewedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  ShortTermMemory get shortTermMemory => $_getN(6);
  @$pb.TagNumber(7)
  set shortTermMemory(ShortTermMemory value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasShortTermMemory() => $_has(6);
  @$pb.TagNumber(7)
  void clearShortTermMemory() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get longTermMemory => $_getIZ(7);
  @$pb.TagNumber(8)
  set longTermMemory($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLongTermMemory() => $_has(7);
  @$pb.TagNumber(8)
  void clearLongTermMemory() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get repetitionCount => $_getIZ(8);
  @$pb.TagNumber(9)
  set repetitionCount($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasRepetitionCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearRepetitionCount() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get deckId => $_getIZ(9);
  @$pb.TagNumber(10)
  set deckId($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasDeckId() => $_has(9);
  @$pb.TagNumber(10)
  void clearDeckId() => $_clearField(10);
}

class GetProgressCardsByDeckIDRequest extends $pb.GeneratedMessage {
  factory GetProgressCardsByDeckIDRequest({
    $core.int? deckID,
  }) {
    final result = create();
    if (deckID != null) result.deckID = deckID;
    return result;
  }

  GetProgressCardsByDeckIDRequest._();

  factory GetProgressCardsByDeckIDRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetProgressCardsByDeckIDRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetProgressCardsByDeckIDRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user_progress_card'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'deckID', $pb.PbFieldType.O3, protoName: 'deckID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProgressCardsByDeckIDRequest clone() => GetProgressCardsByDeckIDRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProgressCardsByDeckIDRequest copyWith(void Function(GetProgressCardsByDeckIDRequest) updates) => super.copyWith((message) => updates(message as GetProgressCardsByDeckIDRequest)) as GetProgressCardsByDeckIDRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProgressCardsByDeckIDRequest create() => GetProgressCardsByDeckIDRequest._();
  @$core.override
  GetProgressCardsByDeckIDRequest createEmptyInstance() => create();
  static $pb.PbList<GetProgressCardsByDeckIDRequest> createRepeated() => $pb.PbList<GetProgressCardsByDeckIDRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProgressCardsByDeckIDRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProgressCardsByDeckIDRequest>(create);
  static GetProgressCardsByDeckIDRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get deckID => $_getIZ(0);
  @$pb.TagNumber(1)
  set deckID($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeckID() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeckID() => $_clearField(1);
}

class GetProgressCardsByDeckIDResponse extends $pb.GeneratedMessage {
  factory GetProgressCardsByDeckIDResponse({
    $core.Iterable<UserProgressCard>? progressCards,
  }) {
    final result = create();
    if (progressCards != null) result.progressCards.addAll(progressCards);
    return result;
  }

  GetProgressCardsByDeckIDResponse._();

  factory GetProgressCardsByDeckIDResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetProgressCardsByDeckIDResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetProgressCardsByDeckIDResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user_progress_card'), createEmptyInstance: create)
    ..pc<UserProgressCard>(1, _omitFieldNames ? '' : 'progressCards', $pb.PbFieldType.PM, subBuilder: UserProgressCard.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProgressCardsByDeckIDResponse clone() => GetProgressCardsByDeckIDResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProgressCardsByDeckIDResponse copyWith(void Function(GetProgressCardsByDeckIDResponse) updates) => super.copyWith((message) => updates(message as GetProgressCardsByDeckIDResponse)) as GetProgressCardsByDeckIDResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProgressCardsByDeckIDResponse create() => GetProgressCardsByDeckIDResponse._();
  @$core.override
  GetProgressCardsByDeckIDResponse createEmptyInstance() => create();
  static $pb.PbList<GetProgressCardsByDeckIDResponse> createRepeated() => $pb.PbList<GetProgressCardsByDeckIDResponse>();
  @$core.pragma('dart2js:noInline')
  static GetProgressCardsByDeckIDResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProgressCardsByDeckIDResponse>(create);
  static GetProgressCardsByDeckIDResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserProgressCard> get progressCards => $_getList(0);
}

class CardReviewRequest extends $pb.GeneratedMessage {
  factory CardReviewRequest({
    $core.Iterable<UserProgressCard>? cards,
    RecallQuality? quality,
  }) {
    final result = create();
    if (cards != null) result.cards.addAll(cards);
    if (quality != null) result.quality = quality;
    return result;
  }

  CardReviewRequest._();

  factory CardReviewRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CardReviewRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CardReviewRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user_progress_card'), createEmptyInstance: create)
    ..pc<UserProgressCard>(1, _omitFieldNames ? '' : 'cards', $pb.PbFieldType.PM, subBuilder: UserProgressCard.create)
    ..e<RecallQuality>(2, _omitFieldNames ? '' : 'quality', $pb.PbFieldType.OE, defaultOrMaker: RecallQuality.BAD, valueOf: RecallQuality.valueOf, enumValues: RecallQuality.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CardReviewRequest clone() => CardReviewRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CardReviewRequest copyWith(void Function(CardReviewRequest) updates) => super.copyWith((message) => updates(message as CardReviewRequest)) as CardReviewRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CardReviewRequest create() => CardReviewRequest._();
  @$core.override
  CardReviewRequest createEmptyInstance() => create();
  static $pb.PbList<CardReviewRequest> createRepeated() => $pb.PbList<CardReviewRequest>();
  @$core.pragma('dart2js:noInline')
  static CardReviewRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CardReviewRequest>(create);
  static CardReviewRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserProgressCard> get cards => $_getList(0);

  @$pb.TagNumber(2)
  RecallQuality get quality => $_getN(1);
  @$pb.TagNumber(2)
  set quality(RecallQuality value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasQuality() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuality() => $_clearField(2);
}

class CardReviewResponse extends $pb.GeneratedMessage {
  factory CardReviewResponse({
    $core.Iterable<UserProgressCard>? cards,
  }) {
    final result = create();
    if (cards != null) result.cards.addAll(cards);
    return result;
  }

  CardReviewResponse._();

  factory CardReviewResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CardReviewResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CardReviewResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user_progress_card'), createEmptyInstance: create)
    ..pc<UserProgressCard>(1, _omitFieldNames ? '' : 'cards', $pb.PbFieldType.PM, subBuilder: UserProgressCard.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CardReviewResponse clone() => CardReviewResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CardReviewResponse copyWith(void Function(CardReviewResponse) updates) => super.copyWith((message) => updates(message as CardReviewResponse)) as CardReviewResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CardReviewResponse create() => CardReviewResponse._();
  @$core.override
  CardReviewResponse createEmptyInstance() => create();
  static $pb.PbList<CardReviewResponse> createRepeated() => $pb.PbList<CardReviewResponse>();
  @$core.pragma('dart2js:noInline')
  static CardReviewResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CardReviewResponse>(create);
  static CardReviewResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserProgressCard> get cards => $_getList(0);
}

class ProgressCards extends $pb.GeneratedMessage {
  factory ProgressCards({
    $core.Iterable<UserProgressCard>? cards,
  }) {
    final result = create();
    if (cards != null) result.cards.addAll(cards);
    return result;
  }

  ProgressCards._();

  factory ProgressCards.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ProgressCards.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProgressCards', package: const $pb.PackageName(_omitMessageNames ? '' : 'user_progress_card'), createEmptyInstance: create)
    ..pc<UserProgressCard>(1, _omitFieldNames ? '' : 'cards', $pb.PbFieldType.PM, subBuilder: UserProgressCard.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProgressCards clone() => ProgressCards()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProgressCards copyWith(void Function(ProgressCards) updates) => super.copyWith((message) => updates(message as ProgressCards)) as ProgressCards;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProgressCards create() => ProgressCards._();
  @$core.override
  ProgressCards createEmptyInstance() => create();
  static $pb.PbList<ProgressCards> createRepeated() => $pb.PbList<ProgressCards>();
  @$core.pragma('dart2js:noInline')
  static ProgressCards getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProgressCards>(create);
  static ProgressCards? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<UserProgressCard> get cards => $_getList(0);
}

class GetCardsForTodayReviewRequest extends $pb.GeneratedMessage {
  factory GetCardsForTodayReviewRequest({
    $core.int? deckId,
  }) {
    final result = create();
    if (deckId != null) result.deckId = deckId;
    return result;
  }

  GetCardsForTodayReviewRequest._();

  factory GetCardsForTodayReviewRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory GetCardsForTodayReviewRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCardsForTodayReviewRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user_progress_card'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'deckId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCardsForTodayReviewRequest clone() => GetCardsForTodayReviewRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCardsForTodayReviewRequest copyWith(void Function(GetCardsForTodayReviewRequest) updates) => super.copyWith((message) => updates(message as GetCardsForTodayReviewRequest)) as GetCardsForTodayReviewRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCardsForTodayReviewRequest create() => GetCardsForTodayReviewRequest._();
  @$core.override
  GetCardsForTodayReviewRequest createEmptyInstance() => create();
  static $pb.PbList<GetCardsForTodayReviewRequest> createRepeated() => $pb.PbList<GetCardsForTodayReviewRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCardsForTodayReviewRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCardsForTodayReviewRequest>(create);
  static GetCardsForTodayReviewRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get deckId => $_getIZ(0);
  @$pb.TagNumber(1)
  set deckId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeckId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeckId() => $_clearField(1);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
