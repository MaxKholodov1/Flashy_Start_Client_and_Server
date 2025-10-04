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

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userDeckProgressDescriptor instead')
const UserDeckProgress$json = {
  '1': 'UserDeckProgress',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'deck_id', '3': 2, '4': 1, '5': 5, '10': 'deckId'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'last_reviewed_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'lastReviewedAt', '17': true},
    {'1': 'score', '3': 6, '4': 1, '5': 5, '10': 'score'},
  ],
  '8': [
    {'1': '_last_reviewed_at'},
  ],
};

/// Descriptor for `UserDeckProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDeckProgressDescriptor = $convert.base64Decode(
    'ChBVc2VyRGVja1Byb2dyZXNzEhcKB3VzZXJfaWQYASABKAVSBnVzZXJJZBIXCgdkZWNrX2lkGA'
    'IgASgFUgZkZWNrSWQSFAoFdGl0bGUYAyABKAlSBXRpdGxlEiAKC2Rlc2NyaXB0aW9uGAQgASgJ'
    'UgtkZXNjcmlwdGlvbhJJChBsYXN0X3Jldmlld2VkX2F0GAUgASgLMhouZ29vZ2xlLnByb3RvYn'
    'VmLlRpbWVzdGFtcEgAUg5sYXN0UmV2aWV3ZWRBdIgBARIUCgVzY29yZRgGIAEoBVIFc2NvcmVC'
    'EwoRX2xhc3RfcmV2aWV3ZWRfYXQ=');

@$core.Deprecated('Use getUserLearningProgressDecksRequestDescriptor instead')
const GetUserLearningProgressDecksRequest$json = {
  '1': 'GetUserLearningProgressDecksRequest',
};

/// Descriptor for `GetUserLearningProgressDecksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserLearningProgressDecksRequestDescriptor = $convert.base64Decode(
    'CiNHZXRVc2VyTGVhcm5pbmdQcm9ncmVzc0RlY2tzUmVxdWVzdA==');

@$core.Deprecated('Use getUserLearningProgressDecksResponseDescriptor instead')
const GetUserLearningProgressDecksResponse$json = {
  '1': 'GetUserLearningProgressDecksResponse',
  '2': [
    {'1': 'user_deck_progress_list', '3': 1, '4': 3, '5': 11, '6': '.user_deck_progress.UserDeckProgress', '10': 'userDeckProgressList'},
  ],
};

/// Descriptor for `GetUserLearningProgressDecksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserLearningProgressDecksResponseDescriptor = $convert.base64Decode(
    'CiRHZXRVc2VyTGVhcm5pbmdQcm9ncmVzc0RlY2tzUmVzcG9uc2USWwoXdXNlcl9kZWNrX3Byb2'
    'dyZXNzX2xpc3QYASADKAsyJC51c2VyX2RlY2tfcHJvZ3Jlc3MuVXNlckRlY2tQcm9ncmVzc1IU'
    'dXNlckRlY2tQcm9ncmVzc0xpc3Q=');

@$core.Deprecated('Use userProgressDecksDescriptor instead')
const UserProgressDecks$json = {
  '1': 'UserProgressDecks',
  '2': [
    {'1': 'user_progress_decks', '3': 1, '4': 3, '5': 11, '6': '.user_deck_progress.UserDeckProgress', '10': 'userProgressDecks'},
  ],
};

/// Descriptor for `UserProgressDecks`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userProgressDecksDescriptor = $convert.base64Decode(
    'ChFVc2VyUHJvZ3Jlc3NEZWNrcxJUChN1c2VyX3Byb2dyZXNzX2RlY2tzGAEgAygLMiQudXNlcl'
    '9kZWNrX3Byb2dyZXNzLlVzZXJEZWNrUHJvZ3Jlc3NSEXVzZXJQcm9ncmVzc0RlY2tz');

@$core.Deprecated('Use deleteDeckFromLearningDecksRequestDescriptor instead')
const DeleteDeckFromLearningDecksRequest$json = {
  '1': 'DeleteDeckFromLearningDecksRequest',
  '2': [
    {'1': 'deck_id', '3': 1, '4': 1, '5': 5, '10': 'deckId'},
  ],
};

/// Descriptor for `DeleteDeckFromLearningDecksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDeckFromLearningDecksRequestDescriptor = $convert.base64Decode(
    'CiJEZWxldGVEZWNrRnJvbUxlYXJuaW5nRGVja3NSZXF1ZXN0EhcKB2RlY2tfaWQYASABKAVSBm'
    'RlY2tJZA==');

@$core.Deprecated('Use deleteDeckFromLearningDecksResponseDescriptor instead')
const DeleteDeckFromLearningDecksResponse$json = {
  '1': 'DeleteDeckFromLearningDecksResponse',
  '2': [
    {'1': 'isSuccess', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
  ],
};

/// Descriptor for `DeleteDeckFromLearningDecksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDeckFromLearningDecksResponseDescriptor = $convert.base64Decode(
    'CiNEZWxldGVEZWNrRnJvbUxlYXJuaW5nRGVja3NSZXNwb25zZRIcCglpc1N1Y2Nlc3MYASABKA'
    'hSCWlzU3VjY2Vzcw==');

