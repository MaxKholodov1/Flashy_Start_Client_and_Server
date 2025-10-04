//
//  Generated code. Do not modify.
//  source: validation_service.proto
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

@$core.Deprecated('Use checkUserNameAvailabilityRequestDescriptor instead')
const CheckUserNameAvailabilityRequest$json = {
  '1': 'CheckUserNameAvailabilityRequest',
  '2': [
    {'1': 'userName', '3': 1, '4': 1, '5': 9, '10': 'userName'},
  ],
};

/// Descriptor for `CheckUserNameAvailabilityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkUserNameAvailabilityRequestDescriptor = $convert.base64Decode(
    'CiBDaGVja1VzZXJOYW1lQXZhaWxhYmlsaXR5UmVxdWVzdBIaCgh1c2VyTmFtZRgBIAEoCVIIdX'
    'Nlck5hbWU=');

@$core.Deprecated('Use checkUserNameAvailabilityResponseDescriptor instead')
const CheckUserNameAvailabilityResponse$json = {
  '1': 'CheckUserNameAvailabilityResponse',
  '2': [
    {'1': 'is_available', '3': 1, '4': 1, '5': 8, '10': 'isAvailable'},
  ],
};

/// Descriptor for `CheckUserNameAvailabilityResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkUserNameAvailabilityResponseDescriptor = $convert.base64Decode(
    'CiFDaGVja1VzZXJOYW1lQXZhaWxhYmlsaXR5UmVzcG9uc2USIQoMaXNfYXZhaWxhYmxlGAEgAS'
    'gIUgtpc0F2YWlsYWJsZQ==');

@$core.Deprecated('Use checkUserEmailAvailabilityRequestDescriptor instead')
const CheckUserEmailAvailabilityRequest$json = {
  '1': 'CheckUserEmailAvailabilityRequest',
  '2': [
    {'1': 'userEmail', '3': 1, '4': 1, '5': 9, '10': 'userEmail'},
  ],
};

/// Descriptor for `CheckUserEmailAvailabilityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkUserEmailAvailabilityRequestDescriptor = $convert.base64Decode(
    'CiFDaGVja1VzZXJFbWFpbEF2YWlsYWJpbGl0eVJlcXVlc3QSHAoJdXNlckVtYWlsGAEgASgJUg'
    'l1c2VyRW1haWw=');

@$core.Deprecated('Use checkUserEmailAvailabilityResponseDescriptor instead')
const CheckUserEmailAvailabilityResponse$json = {
  '1': 'CheckUserEmailAvailabilityResponse',
  '2': [
    {'1': 'is_available', '3': 1, '4': 1, '5': 8, '10': 'isAvailable'},
  ],
};

/// Descriptor for `CheckUserEmailAvailabilityResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkUserEmailAvailabilityResponseDescriptor = $convert.base64Decode(
    'CiJDaGVja1VzZXJFbWFpbEF2YWlsYWJpbGl0eVJlc3BvbnNlEiEKDGlzX2F2YWlsYWJsZRgBIA'
    'EoCFILaXNBdmFpbGFibGU=');

@$core.Deprecated('Use checkUserPasswordAvailabilityRequestDescriptor instead')
const CheckUserPasswordAvailabilityRequest$json = {
  '1': 'CheckUserPasswordAvailabilityRequest',
  '2': [
    {'1': 'password', '3': 1, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `CheckUserPasswordAvailabilityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkUserPasswordAvailabilityRequestDescriptor = $convert.base64Decode(
    'CiRDaGVja1VzZXJQYXNzd29yZEF2YWlsYWJpbGl0eVJlcXVlc3QSGgoIcGFzc3dvcmQYASABKA'
    'lSCHBhc3N3b3Jk');

@$core.Deprecated('Use checkUserPasswordAvailabilityResponseDescriptor instead')
const CheckUserPasswordAvailabilityResponse$json = {
  '1': 'CheckUserPasswordAvailabilityResponse',
  '2': [
    {'1': 'is_valid', '3': 1, '4': 1, '5': 8, '10': 'isValid'},
  ],
};

/// Descriptor for `CheckUserPasswordAvailabilityResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkUserPasswordAvailabilityResponseDescriptor = $convert.base64Decode(
    'CiVDaGVja1VzZXJQYXNzd29yZEF2YWlsYWJpbGl0eVJlc3BvbnNlEhkKCGlzX3ZhbGlkGAEgAS'
    'gIUgdpc1ZhbGlk');

