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

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use globalCardDescriptor instead')
const GlobalCard$json = {
  '1': 'GlobalCard',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'deckID', '3': 2, '4': 1, '5': 5, '10': 'deckID'},
    {'1': 'question', '3': 3, '4': 1, '5': 9, '10': 'question'},
    {'1': 'answer', '3': 4, '4': 1, '5': 9, '10': 'answer'},
    {'1': 'authorID', '3': 5, '4': 1, '5': 5, '10': 'authorID'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'version', '3': 8, '4': 1, '5': 5, '10': 'version'},
  ],
};

/// Descriptor for `GlobalCard`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List globalCardDescriptor = $convert.base64Decode(
    'CgpHbG9iYWxDYXJkEg4KAmlkGAEgASgFUgJpZBIWCgZkZWNrSUQYAiABKAVSBmRlY2tJRBIaCg'
    'hxdWVzdGlvbhgDIAEoCVIIcXVlc3Rpb24SFgoGYW5zd2VyGAQgASgJUgZhbnN3ZXISGgoIYXV0'
    'aG9ySUQYBSABKAVSCGF1dGhvcklEEjkKCmNyZWF0ZWRfYXQYBiABKAsyGi5nb29nbGUucHJvdG'
    '9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgHIAEoCzIaLmdvb2dsZS5w'
    'cm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBIYCgd2ZXJzaW9uGAggASgFUgd2ZXJzaW9u');

@$core.Deprecated('Use createGlobalCardRequestDescriptor instead')
const CreateGlobalCardRequest$json = {
  '1': 'CreateGlobalCardRequest',
  '2': [
    {'1': 'question', '3': 1, '4': 1, '5': 9, '10': 'question'},
    {'1': 'answer', '3': 2, '4': 1, '5': 9, '10': 'answer'},
    {'1': 'deckID', '3': 3, '4': 1, '5': 5, '10': 'deckID'},
  ],
};

/// Descriptor for `CreateGlobalCardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGlobalCardRequestDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVHbG9iYWxDYXJkUmVxdWVzdBIaCghxdWVzdGlvbhgBIAEoCVIIcXVlc3Rpb24SFg'
    'oGYW5zd2VyGAIgASgJUgZhbnN3ZXISFgoGZGVja0lEGAMgASgFUgZkZWNrSUQ=');

@$core.Deprecated('Use createGlobalCardResponseDescriptor instead')
const CreateGlobalCardResponse$json = {
  '1': 'CreateGlobalCardResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `CreateGlobalCardResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGlobalCardResponseDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVHbG9iYWxDYXJkUmVzcG9uc2USDgoCaWQYASABKAVSAmlk');

@$core.Deprecated('Use getGlobalCardsByDeckIDRequestDescriptor instead')
const GetGlobalCardsByDeckIDRequest$json = {
  '1': 'GetGlobalCardsByDeckIDRequest',
  '2': [
    {'1': 'deckID', '3': 1, '4': 1, '5': 5, '10': 'deckID'},
  ],
};

/// Descriptor for `GetGlobalCardsByDeckIDRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGlobalCardsByDeckIDRequestDescriptor = $convert.base64Decode(
    'Ch1HZXRHbG9iYWxDYXJkc0J5RGVja0lEUmVxdWVzdBIWCgZkZWNrSUQYASABKAVSBmRlY2tJRA'
    '==');

@$core.Deprecated('Use getGlobalCardsByDeckIDResponseDescriptor instead')
const GetGlobalCardsByDeckIDResponse$json = {
  '1': 'GetGlobalCardsByDeckIDResponse',
  '2': [
    {'1': 'globalCards', '3': 1, '4': 3, '5': 11, '6': '.global_card.GlobalCard', '10': 'globalCards'},
  ],
};

/// Descriptor for `GetGlobalCardsByDeckIDResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGlobalCardsByDeckIDResponseDescriptor = $convert.base64Decode(
    'Ch5HZXRHbG9iYWxDYXJkc0J5RGVja0lEUmVzcG9uc2USOQoLZ2xvYmFsQ2FyZHMYASADKAsyFy'
    '5nbG9iYWxfY2FyZC5HbG9iYWxDYXJkUgtnbG9iYWxDYXJkcw==');

@$core.Deprecated('Use updateGlobalCardRequestDescriptor instead')
const UpdateGlobalCardRequest$json = {
  '1': 'UpdateGlobalCardRequest',
  '2': [
    {'1': 'question', '3': 1, '4': 1, '5': 9, '10': 'question'},
    {'1': 'answer', '3': 2, '4': 1, '5': 9, '10': 'answer'},
    {'1': 'cardID', '3': 3, '4': 1, '5': 5, '10': 'cardID'},
    {'1': 'version', '3': 4, '4': 1, '5': 5, '10': 'version'},
  ],
};

/// Descriptor for `UpdateGlobalCardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGlobalCardRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVHbG9iYWxDYXJkUmVxdWVzdBIaCghxdWVzdGlvbhgBIAEoCVIIcXVlc3Rpb24SFg'
    'oGYW5zd2VyGAIgASgJUgZhbnN3ZXISFgoGY2FyZElEGAMgASgFUgZjYXJkSUQSGAoHdmVyc2lv'
    'bhgEIAEoBVIHdmVyc2lvbg==');

@$core.Deprecated('Use updateGlobalCardResponseDescriptor instead')
const UpdateGlobalCardResponse$json = {
  '1': 'UpdateGlobalCardResponse',
  '2': [
    {'1': 'isSuccess', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
    {'1': 'conflictCard', '3': 2, '4': 1, '5': 11, '6': '.global_card.GlobalCard', '10': 'conflictCard'},
  ],
};

/// Descriptor for `UpdateGlobalCardResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGlobalCardResponseDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVHbG9iYWxDYXJkUmVzcG9uc2USHAoJaXNTdWNjZXNzGAEgASgIUglpc1N1Y2Nlc3'
    'MSOwoMY29uZmxpY3RDYXJkGAIgASgLMhcuZ2xvYmFsX2NhcmQuR2xvYmFsQ2FyZFIMY29uZmxp'
    'Y3RDYXJk');

@$core.Deprecated('Use deleteGlobalCardRequestDescriptor instead')
const DeleteGlobalCardRequest$json = {
  '1': 'DeleteGlobalCardRequest',
  '2': [
    {'1': 'card_id', '3': 1, '4': 1, '5': 5, '10': 'cardId'},
  ],
};

/// Descriptor for `DeleteGlobalCardRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteGlobalCardRequestDescriptor = $convert.base64Decode(
    'ChdEZWxldGVHbG9iYWxDYXJkUmVxdWVzdBIXCgdjYXJkX2lkGAEgASgFUgZjYXJkSWQ=');

@$core.Deprecated('Use deleteGlobalCardResponseDescriptor instead')
const DeleteGlobalCardResponse$json = {
  '1': 'DeleteGlobalCardResponse',
  '2': [
    {'1': 'isSuccess', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
  ],
};

/// Descriptor for `DeleteGlobalCardResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteGlobalCardResponseDescriptor = $convert.base64Decode(
    'ChhEZWxldGVHbG9iYWxDYXJkUmVzcG9uc2USHAoJaXNTdWNjZXNzGAEgASgIUglpc1N1Y2Nlc3'
    'M=');

