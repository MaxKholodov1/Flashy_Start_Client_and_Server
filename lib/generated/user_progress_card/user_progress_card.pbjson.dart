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

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use shortTermMemoryDescriptor instead')
const ShortTermMemory$json = {
  '1': 'ShortTermMemory',
  '2': [
    {'1': 'STM_UNKNOWN', '2': 0},
    {'1': 'STM_BAD', '2': 1},
    {'1': 'STM_NORMAL', '2': 2},
    {'1': 'STM_GOOD', '2': 3},
    {'1': 'STM_PERFECT', '2': 4},
  ],
};

/// Descriptor for `ShortTermMemory`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List shortTermMemoryDescriptor = $convert.base64Decode(
    'Cg9TaG9ydFRlcm1NZW1vcnkSDwoLU1RNX1VOS05PV04QABILCgdTVE1fQkFEEAESDgoKU1RNX0'
    '5PUk1BTBACEgwKCFNUTV9HT09EEAMSDwoLU1RNX1BFUkZFQ1QQBA==');

@$core.Deprecated('Use recallQualityDescriptor instead')
const RecallQuality$json = {
  '1': 'RecallQuality',
  '2': [
    {'1': 'BAD', '2': 0},
    {'1': 'NORMAL', '2': 1},
    {'1': 'GOOD', '2': 2},
    {'1': 'PERFECT', '2': 3},
  ],
};

/// Descriptor for `RecallQuality`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List recallQualityDescriptor = $convert.base64Decode(
    'Cg1SZWNhbGxRdWFsaXR5EgcKA0JBRBAAEgoKBk5PUk1BTBABEggKBEdPT0QQAhILCgdQRVJGRU'
    'NUEAM=');

@$core.Deprecated('Use userProgressCardDescriptor instead')
const UserProgressCard$json = {
  '1': 'UserProgressCard',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'card_id', '3': 2, '4': 1, '5': 5, '10': 'cardId'},
    {'1': 'question', '3': 3, '4': 1, '5': 9, '10': 'question'},
    {'1': 'answer', '3': 4, '4': 1, '5': 9, '10': 'answer'},
    {'1': 'next_review_date', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'nextReviewDate', '17': true},
    {'1': 'last_reviewed_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'lastReviewedAt', '17': true},
    {'1': 'short_term_memory', '3': 7, '4': 1, '5': 14, '6': '.user_progress_card.ShortTermMemory', '10': 'shortTermMemory'},
    {'1': 'long_term_memory', '3': 8, '4': 1, '5': 5, '10': 'longTermMemory'},
    {'1': 'repetition_count', '3': 9, '4': 1, '5': 5, '10': 'repetitionCount'},
    {'1': 'deck_id', '3': 10, '4': 1, '5': 5, '10': 'deckId'},
  ],
  '8': [
    {'1': '_next_review_date'},
    {'1': '_last_reviewed_at'},
  ],
};

/// Descriptor for `UserProgressCard`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userProgressCardDescriptor = $convert.base64Decode(
    'ChBVc2VyUHJvZ3Jlc3NDYXJkEhcKB3VzZXJfaWQYASABKAVSBnVzZXJJZBIXCgdjYXJkX2lkGA'
    'IgASgFUgZjYXJkSWQSGgoIcXVlc3Rpb24YAyABKAlSCHF1ZXN0aW9uEhYKBmFuc3dlchgEIAEo'
    'CVIGYW5zd2VyEkkKEG5leHRfcmV2aWV3X2RhdGUYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVG'
    'ltZXN0YW1wSABSDm5leHRSZXZpZXdEYXRliAEBEkkKEGxhc3RfcmV2aWV3ZWRfYXQYBiABKAsy'
    'Gi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAFSDmxhc3RSZXZpZXdlZEF0iAEBEk8KEXNob3'
    'J0X3Rlcm1fbWVtb3J5GAcgASgOMiMudXNlcl9wcm9ncmVzc19jYXJkLlNob3J0VGVybU1lbW9y'
    'eVIPc2hvcnRUZXJtTWVtb3J5EigKEGxvbmdfdGVybV9tZW1vcnkYCCABKAVSDmxvbmdUZXJtTW'
    'Vtb3J5EikKEHJlcGV0aXRpb25fY291bnQYCSABKAVSD3JlcGV0aXRpb25Db3VudBIXCgdkZWNr'
    'X2lkGAogASgFUgZkZWNrSWRCEwoRX25leHRfcmV2aWV3X2RhdGVCEwoRX2xhc3RfcmV2aWV3ZW'
    'RfYXQ=');

@$core.Deprecated('Use getProgressCardsByDeckIDRequestDescriptor instead')
const GetProgressCardsByDeckIDRequest$json = {
  '1': 'GetProgressCardsByDeckIDRequest',
  '2': [
    {'1': 'deckID', '3': 1, '4': 1, '5': 5, '10': 'deckID'},
  ],
};

/// Descriptor for `GetProgressCardsByDeckIDRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProgressCardsByDeckIDRequestDescriptor = $convert.base64Decode(
    'Ch9HZXRQcm9ncmVzc0NhcmRzQnlEZWNrSURSZXF1ZXN0EhYKBmRlY2tJRBgBIAEoBVIGZGVja0'
    'lE');

@$core.Deprecated('Use getProgressCardsByDeckIDResponseDescriptor instead')
const GetProgressCardsByDeckIDResponse$json = {
  '1': 'GetProgressCardsByDeckIDResponse',
  '2': [
    {'1': 'progress_cards', '3': 1, '4': 3, '5': 11, '6': '.user_progress_card.UserProgressCard', '10': 'progressCards'},
  ],
};

/// Descriptor for `GetProgressCardsByDeckIDResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProgressCardsByDeckIDResponseDescriptor = $convert.base64Decode(
    'CiBHZXRQcm9ncmVzc0NhcmRzQnlEZWNrSURSZXNwb25zZRJLCg5wcm9ncmVzc19jYXJkcxgBIA'
    'MoCzIkLnVzZXJfcHJvZ3Jlc3NfY2FyZC5Vc2VyUHJvZ3Jlc3NDYXJkUg1wcm9ncmVzc0NhcmRz');

@$core.Deprecated('Use cardReviewRequestDescriptor instead')
const CardReviewRequest$json = {
  '1': 'CardReviewRequest',
  '2': [
    {'1': 'quality', '3': 2, '4': 1, '5': 14, '6': '.user_progress_card.RecallQuality', '10': 'quality'},
    {'1': 'cards', '3': 1, '4': 3, '5': 11, '6': '.user_progress_card.UserProgressCard', '10': 'cards'},
  ],
};

/// Descriptor for `CardReviewRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cardReviewRequestDescriptor = $convert.base64Decode(
    'ChFDYXJkUmV2aWV3UmVxdWVzdBI7CgdxdWFsaXR5GAIgASgOMiEudXNlcl9wcm9ncmVzc19jYX'
    'JkLlJlY2FsbFF1YWxpdHlSB3F1YWxpdHkSOgoFY2FyZHMYASADKAsyJC51c2VyX3Byb2dyZXNz'
    'X2NhcmQuVXNlclByb2dyZXNzQ2FyZFIFY2FyZHM=');

@$core.Deprecated('Use cardReviewResponseDescriptor instead')
const CardReviewResponse$json = {
  '1': 'CardReviewResponse',
  '2': [
    {'1': 'cards', '3': 1, '4': 3, '5': 11, '6': '.user_progress_card.UserProgressCard', '10': 'cards'},
  ],
};

/// Descriptor for `CardReviewResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cardReviewResponseDescriptor = $convert.base64Decode(
    'ChJDYXJkUmV2aWV3UmVzcG9uc2USOgoFY2FyZHMYASADKAsyJC51c2VyX3Byb2dyZXNzX2Nhcm'
    'QuVXNlclByb2dyZXNzQ2FyZFIFY2FyZHM=');

@$core.Deprecated('Use progressCardsDescriptor instead')
const ProgressCards$json = {
  '1': 'ProgressCards',
  '2': [
    {'1': 'cards', '3': 1, '4': 3, '5': 11, '6': '.user_progress_card.UserProgressCard', '10': 'cards'},
  ],
};

/// Descriptor for `ProgressCards`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List progressCardsDescriptor = $convert.base64Decode(
    'Cg1Qcm9ncmVzc0NhcmRzEjoKBWNhcmRzGAEgAygLMiQudXNlcl9wcm9ncmVzc19jYXJkLlVzZX'
    'JQcm9ncmVzc0NhcmRSBWNhcmRz');

@$core.Deprecated('Use getCardsForTodayReviewRequestDescriptor instead')
const GetCardsForTodayReviewRequest$json = {
  '1': 'GetCardsForTodayReviewRequest',
  '2': [
    {'1': 'deck_id', '3': 1, '4': 1, '5': 5, '10': 'deckId'},
  ],
};

/// Descriptor for `GetCardsForTodayReviewRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCardsForTodayReviewRequestDescriptor = $convert.base64Decode(
    'Ch1HZXRDYXJkc0ZvclRvZGF5UmV2aWV3UmVxdWVzdBIXCgdkZWNrX2lkGAEgASgFUgZkZWNrSW'
    'Q=');

