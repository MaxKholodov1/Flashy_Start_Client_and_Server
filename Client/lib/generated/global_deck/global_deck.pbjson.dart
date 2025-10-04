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

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use globalDeckDescriptor instead')
const GlobalDeck$json = {
  '1': 'GlobalDeck',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    {'1': 'authorID', '3': 4, '4': 1, '5': 5, '10': 'authorID'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'isPublic', '3': 7, '4': 1, '5': 8, '10': 'isPublic'},
    {'1': 'tags', '3': 8, '4': 3, '5': 9, '10': 'tags'},
    {'1': 'version', '3': 9, '4': 1, '5': 5, '10': 'version'},
  ],
  '8': [
    {'1': '_description'},
  ],
};

/// Descriptor for `GlobalDeck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List globalDeckDescriptor = $convert.base64Decode(
    'CgpHbG9iYWxEZWNrEg4KAmlkGAEgASgFUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSJQoLZG'
    'VzY3JpcHRpb24YAyABKAlIAFILZGVzY3JpcHRpb26IAQESGgoIYXV0aG9ySUQYBCABKAVSCGF1'
    'dGhvcklEEjkKCmNyZWF0ZWRfYXQYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg'
    'ljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3Rh'
    'bXBSCXVwZGF0ZWRBdBIaCghpc1B1YmxpYxgHIAEoCFIIaXNQdWJsaWMSEgoEdGFncxgIIAMoCV'
    'IEdGFncxIYCgd2ZXJzaW9uGAkgASgFUgd2ZXJzaW9uQg4KDF9kZXNjcmlwdGlvbg==');

@$core.Deprecated('Use createGlobalDeckRequestDescriptor instead')
const CreateGlobalDeckRequest$json = {
  '1': 'CreateGlobalDeckRequest',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'isPublic', '3': 3, '4': 1, '5': 8, '10': 'isPublic'},
  ],
};

/// Descriptor for `CreateGlobalDeckRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGlobalDeckRequestDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVHbG9iYWxEZWNrUmVxdWVzdBIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSIAoLZGVzY3'
    'JpcHRpb24YAiABKAlSC2Rlc2NyaXB0aW9uEhoKCGlzUHVibGljGAMgASgIUghpc1B1YmxpYw==');

@$core.Deprecated('Use createGlobalDeckResponseDescriptor instead')
const CreateGlobalDeckResponse$json = {
  '1': 'CreateGlobalDeckResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `CreateGlobalDeckResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGlobalDeckResponseDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVHbG9iYWxEZWNrUmVzcG9uc2USDgoCaWQYASABKAVSAmlk');

@$core.Deprecated('Use getEditableDecksRequestDescriptor instead')
const GetEditableDecksRequest$json = {
  '1': 'GetEditableDecksRequest',
};

/// Descriptor for `GetEditableDecksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEditableDecksRequestDescriptor = $convert.base64Decode(
    'ChdHZXRFZGl0YWJsZURlY2tzUmVxdWVzdA==');

@$core.Deprecated('Use getEditableDecksResponseDescriptor instead')
const GetEditableDecksResponse$json = {
  '1': 'GetEditableDecksResponse',
  '2': [
    {'1': 'listOfGlobalDecks', '3': 1, '4': 3, '5': 11, '6': '.global_deck.GlobalDeck', '10': 'listOfGlobalDecks'},
  ],
};

/// Descriptor for `GetEditableDecksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEditableDecksResponseDescriptor = $convert.base64Decode(
    'ChhHZXRFZGl0YWJsZURlY2tzUmVzcG9uc2USRQoRbGlzdE9mR2xvYmFsRGVja3MYASADKAsyFy'
    '5nbG9iYWxfZGVjay5HbG9iYWxEZWNrUhFsaXN0T2ZHbG9iYWxEZWNrcw==');

@$core.Deprecated('Use updateGlobalDeckRequestDescriptor instead')
const UpdateGlobalDeckRequest$json = {
  '1': 'UpdateGlobalDeckRequest',
  '2': [
    {'1': 'globalDeck', '3': 1, '4': 1, '5': 11, '6': '.global_deck.GlobalDeck', '10': 'globalDeck'},
  ],
};

/// Descriptor for `UpdateGlobalDeckRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGlobalDeckRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVHbG9iYWxEZWNrUmVxdWVzdBI3CgpnbG9iYWxEZWNrGAEgASgLMhcuZ2xvYmFsX2'
    'RlY2suR2xvYmFsRGVja1IKZ2xvYmFsRGVjaw==');

@$core.Deprecated('Use updateGlobalDeckResponseDescriptor instead')
const UpdateGlobalDeckResponse$json = {
  '1': 'UpdateGlobalDeckResponse',
  '2': [
    {'1': 'conflictDeck', '3': 1, '4': 1, '5': 11, '6': '.global_deck.GlobalDeck', '10': 'conflictDeck'},
    {'1': 'isSuccess', '3': 2, '4': 1, '5': 8, '10': 'isSuccess'},
  ],
};

/// Descriptor for `UpdateGlobalDeckResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGlobalDeckResponseDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVHbG9iYWxEZWNrUmVzcG9uc2USOwoMY29uZmxpY3REZWNrGAEgASgLMhcuZ2xvYm'
    'FsX2RlY2suR2xvYmFsRGVja1IMY29uZmxpY3REZWNrEhwKCWlzU3VjY2VzcxgCIAEoCFIJaXNT'
    'dWNjZXNz');

@$core.Deprecated('Use getGlobalDeckInfoByIDRequestDescriptor instead')
const GetGlobalDeckInfoByIDRequest$json = {
  '1': 'GetGlobalDeckInfoByIDRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `GetGlobalDeckInfoByIDRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGlobalDeckInfoByIDRequestDescriptor = $convert.base64Decode(
    'ChxHZXRHbG9iYWxEZWNrSW5mb0J5SURSZXF1ZXN0Eg4KAmlkGAEgASgFUgJpZA==');

@$core.Deprecated('Use getGlobalDeckInfoByIDResponseDescriptor instead')
const GetGlobalDeckInfoByIDResponse$json = {
  '1': 'GetGlobalDeckInfoByIDResponse',
  '2': [
    {'1': 'globalDeck', '3': 1, '4': 1, '5': 11, '6': '.global_deck.GlobalDeck', '10': 'globalDeck'},
    {'1': 'authName', '3': 2, '4': 1, '5': 9, '10': 'authName'},
    {'1': 'editorNames', '3': 3, '4': 3, '5': 9, '10': 'editorNames'},
  ],
};

/// Descriptor for `GetGlobalDeckInfoByIDResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getGlobalDeckInfoByIDResponseDescriptor = $convert.base64Decode(
    'Ch1HZXRHbG9iYWxEZWNrSW5mb0J5SURSZXNwb25zZRI3CgpnbG9iYWxEZWNrGAEgASgLMhcuZ2'
    'xvYmFsX2RlY2suR2xvYmFsRGVja1IKZ2xvYmFsRGVjaxIaCghhdXRoTmFtZRgCIAEoCVIIYXV0'
    'aE5hbWUSIAoLZWRpdG9yTmFtZXMYAyADKAlSC2VkaXRvck5hbWVz');

@$core.Deprecated('Use deleteGlobalDeckRequestDescriptor instead')
const DeleteGlobalDeckRequest$json = {
  '1': 'DeleteGlobalDeckRequest',
  '2': [
    {'1': 'deckID', '3': 1, '4': 1, '5': 5, '10': 'deckID'},
  ],
};

/// Descriptor for `DeleteGlobalDeckRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteGlobalDeckRequestDescriptor = $convert.base64Decode(
    'ChdEZWxldGVHbG9iYWxEZWNrUmVxdWVzdBIWCgZkZWNrSUQYASABKAVSBmRlY2tJRA==');

@$core.Deprecated('Use deleteGlobalDeckResponseDescriptor instead')
const DeleteGlobalDeckResponse$json = {
  '1': 'DeleteGlobalDeckResponse',
  '2': [
    {'1': 'isSuccess', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
  ],
};

/// Descriptor for `DeleteGlobalDeckResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteGlobalDeckResponseDescriptor = $convert.base64Decode(
    'ChhEZWxldGVHbG9iYWxEZWNrUmVzcG9uc2USHAoJaXNTdWNjZXNzGAEgASgIUglpc1N1Y2Nlc3'
    'M=');

@$core.Deprecated('Use searchGlobalDecksRequestDescriptor instead')
const SearchGlobalDecksRequest$json = {
  '1': 'SearchGlobalDecksRequest',
  '2': [
    {'1': 'query', '3': 1, '4': 1, '5': 9, '10': 'query'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `SearchGlobalDecksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchGlobalDecksRequestDescriptor = $convert.base64Decode(
    'ChhTZWFyY2hHbG9iYWxEZWNrc1JlcXVlc3QSFAoFcXVlcnkYASABKAlSBXF1ZXJ5EhQKBWxpbW'
    'l0GAIgASgFUgVsaW1pdBIWCgZvZmZzZXQYAyABKAVSBm9mZnNldA==');

@$core.Deprecated('Use searchGlobalDecksResponseDescriptor instead')
const SearchGlobalDecksResponse$json = {
  '1': 'SearchGlobalDecksResponse',
  '2': [
    {'1': 'results', '3': 1, '4': 3, '5': 11, '6': '.global_deck.SearchResultDeck', '10': 'results'},
    {'1': 'has_more', '3': 2, '4': 1, '5': 8, '10': 'hasMore'},
  ],
};

/// Descriptor for `SearchGlobalDecksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchGlobalDecksResponseDescriptor = $convert.base64Decode(
    'ChlTZWFyY2hHbG9iYWxEZWNrc1Jlc3BvbnNlEjcKB3Jlc3VsdHMYASADKAsyHS5nbG9iYWxfZG'
    'Vjay5TZWFyY2hSZXN1bHREZWNrUgdyZXN1bHRzEhkKCGhhc19tb3JlGAIgASgIUgdoYXNNb3Jl');

@$core.Deprecated('Use searchResultDeckDescriptor instead')
const SearchResultDeck$json = {
  '1': 'SearchResultDeck',
  '2': [
    {'1': 'deck', '3': 1, '4': 1, '5': 11, '6': '.global_deck.GlobalDeck', '10': 'deck'},
    {'1': 'is_already_added', '3': 2, '4': 1, '5': 8, '10': 'isAlreadyAdded'},
  ],
};

/// Descriptor for `SearchResultDeck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchResultDeckDescriptor = $convert.base64Decode(
    'ChBTZWFyY2hSZXN1bHREZWNrEisKBGRlY2sYASABKAsyFy5nbG9iYWxfZGVjay5HbG9iYWxEZW'
    'NrUgRkZWNrEigKEGlzX2FscmVhZHlfYWRkZWQYAiABKAhSDmlzQWxyZWFkeUFkZGVk');

@$core.Deprecated('Use addDeckToLearningDecksRequestDescriptor instead')
const AddDeckToLearningDecksRequest$json = {
  '1': 'AddDeckToLearningDecksRequest',
  '2': [
    {'1': 'deckID', '3': 1, '4': 1, '5': 5, '10': 'deckID'},
  ],
};

/// Descriptor for `AddDeckToLearningDecksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addDeckToLearningDecksRequestDescriptor = $convert.base64Decode(
    'Ch1BZGREZWNrVG9MZWFybmluZ0RlY2tzUmVxdWVzdBIWCgZkZWNrSUQYASABKAVSBmRlY2tJRA'
    '==');

@$core.Deprecated('Use addDeckToLearningDecksResponseDescriptor instead')
const AddDeckToLearningDecksResponse$json = {
  '1': 'AddDeckToLearningDecksResponse',
  '2': [
    {'1': 'isSuccess', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
  ],
};

/// Descriptor for `AddDeckToLearningDecksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addDeckToLearningDecksResponseDescriptor = $convert.base64Decode(
    'Ch5BZGREZWNrVG9MZWFybmluZ0RlY2tzUmVzcG9uc2USHAoJaXNTdWNjZXNzGAEgASgIUglpc1'
    'N1Y2Nlc3M=');

@$core.Deprecated('Use addEditorToGlobalDeckRequestDescriptor instead')
const AddEditorToGlobalDeckRequest$json = {
  '1': 'AddEditorToGlobalDeckRequest',
  '2': [
    {'1': 'deck_ID', '3': 1, '4': 1, '5': 5, '10': 'deckID'},
    {'1': 'user_name', '3': 2, '4': 1, '5': 9, '10': 'userName'},
  ],
};

/// Descriptor for `AddEditorToGlobalDeckRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEditorToGlobalDeckRequestDescriptor = $convert.base64Decode(
    'ChxBZGRFZGl0b3JUb0dsb2JhbERlY2tSZXF1ZXN0EhcKB2RlY2tfSUQYASABKAVSBmRlY2tJRB'
    'IbCgl1c2VyX25hbWUYAiABKAlSCHVzZXJOYW1l');

@$core.Deprecated('Use addEditorToGlobalDeckResponseDescriptor instead')
const AddEditorToGlobalDeckResponse$json = {
  '1': 'AddEditorToGlobalDeckResponse',
  '2': [
    {'1': 'isSuccess', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
  ],
};

/// Descriptor for `AddEditorToGlobalDeckResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEditorToGlobalDeckResponseDescriptor = $convert.base64Decode(
    'Ch1BZGRFZGl0b3JUb0dsb2JhbERlY2tSZXNwb25zZRIcCglpc1N1Y2Nlc3MYASABKAhSCWlzU3'
    'VjY2Vzcw==');

@$core.Deprecated('Use demoteEditorToLearnerRequestDescriptor instead')
const DemoteEditorToLearnerRequest$json = {
  '1': 'DemoteEditorToLearnerRequest',
  '2': [
    {'1': 'deck_ID', '3': 1, '4': 1, '5': 5, '10': 'deckID'},
    {'1': 'user_name', '3': 2, '4': 1, '5': 9, '10': 'userName'},
  ],
};

/// Descriptor for `DemoteEditorToLearnerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List demoteEditorToLearnerRequestDescriptor = $convert.base64Decode(
    'ChxEZW1vdGVFZGl0b3JUb0xlYXJuZXJSZXF1ZXN0EhcKB2RlY2tfSUQYASABKAVSBmRlY2tJRB'
    'IbCgl1c2VyX25hbWUYAiABKAlSCHVzZXJOYW1l');

@$core.Deprecated('Use demoteEditorToLearnerResponseDescriptor instead')
const DemoteEditorToLearnerResponse$json = {
  '1': 'DemoteEditorToLearnerResponse',
  '2': [
    {'1': 'isSuccess', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
  ],
};

/// Descriptor for `DemoteEditorToLearnerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List demoteEditorToLearnerResponseDescriptor = $convert.base64Decode(
    'Ch1EZW1vdGVFZGl0b3JUb0xlYXJuZXJSZXNwb25zZRIcCglpc1N1Y2Nlc3MYASABKAhSCWlzU3'
    'VjY2Vzcw==');

