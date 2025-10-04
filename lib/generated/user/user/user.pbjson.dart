//
//  Generated code. Do not modify.
//  source: user.proto
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

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'userName', '3': 1, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'created_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEhoKCHVzZXJOYW1lGAEgASgJUgh1c2VyTmFtZRIUCgVlbWFpbBgCIAEoCVIFZW1haW'
    'wSOQoKY3JlYXRlZF9hdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0'
    'ZWRBdA==');

@$core.Deprecated('Use createUserRequestDescriptor instead')
const CreateUserRequest$json = {
  '1': 'CreateUserRequest',
  '2': [
    {'1': 'userName', '3': 1, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `CreateUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVVc2VyUmVxdWVzdBIaCgh1c2VyTmFtZRgBIAEoCVIIdXNlck5hbWUSFAoFZW1haW'
    'wYAiABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAMgASgJUghwYXNzd29yZA==');

@$core.Deprecated('Use createUserResponseDescriptor instead')
const CreateUserResponse$json = {
  '1': 'CreateUserResponse',
  '2': [
    {'1': 'is_success', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
    {'1': 'userID', '3': 2, '4': 1, '5': 5, '10': 'userID'},
  ],
};

/// Descriptor for `CreateUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVVc2VyUmVzcG9uc2USHQoKaXNfc3VjY2VzcxgBIAEoCFIJaXNTdWNjZXNzEhYKBn'
    'VzZXJJRBgCIAEoBVIGdXNlcklE');

@$core.Deprecated('Use verifyEmailRequestDescriptor instead')
const VerifyEmailRequest$json = {
  '1': 'VerifyEmailRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `VerifyEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyEmailRequestDescriptor = $convert.base64Decode(
    'ChJWZXJpZnlFbWFpbFJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoBVIGdXNlcklkEhIKBGNvZGUYAi'
    'ABKAlSBGNvZGU=');

@$core.Deprecated('Use verifyEmailResponseDescriptor instead')
const VerifyEmailResponse$json = {
  '1': 'VerifyEmailResponse',
  '2': [
    {'1': 'is_success', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
    {'1': 'access_token', '3': 2, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refresh_token', '3': 3, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `VerifyEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyEmailResponseDescriptor = $convert.base64Decode(
    'ChNWZXJpZnlFbWFpbFJlc3BvbnNlEh0KCmlzX3N1Y2Nlc3MYASABKAhSCWlzU3VjY2VzcxIhCg'
    'xhY2Nlc3NfdG9rZW4YAiABKAlSC2FjY2Vzc1Rva2VuEiMKDXJlZnJlc2hfdG9rZW4YAyABKAlS'
    'DHJlZnJlc2hUb2tlbg==');

@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = {
  '1': 'GetUserRequest',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
  ],
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VyUmVxdWVzdBIhCgxhY2Nlc3NfdG9rZW4YASABKAlSC2FjY2Vzc1Rva2Vu');

@$core.Deprecated('Use getUserResponseDescriptor instead')
const GetUserResponse$json = {
  '1': 'GetUserResponse',
  '2': [
    {'1': 'user_name', '3': 1, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'created_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `GetUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRVc2VyUmVzcG9uc2USGwoJdXNlcl9uYW1lGAEgASgJUgh1c2VyTmFtZRIUCgVlbWFpbB'
    'gCIAEoCVIFZW1haWwSOQoKY3JlYXRlZF9hdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1l'
    'c3RhbXBSCWNyZWF0ZWRBdA==');

@$core.Deprecated('Use sendVerificationCodeRequestDescriptor instead')
const SendVerificationCodeRequest$json = {
  '1': 'SendVerificationCodeRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
  ],
};

/// Descriptor for `SendVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendVerificationCodeRequestDescriptor = $convert.base64Decode(
    'ChtTZW5kVmVyaWZpY2F0aW9uQ29kZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoBVIGdXNlcklk');

@$core.Deprecated('Use sendVerificationCodeResponseDescriptor instead')
const SendVerificationCodeResponse$json = {
  '1': 'SendVerificationCodeResponse',
  '2': [
    {'1': 'is_success', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
  ],
};

/// Descriptor for `SendVerificationCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendVerificationCodeResponseDescriptor = $convert.base64Decode(
    'ChxTZW5kVmVyaWZpY2F0aW9uQ29kZVJlc3BvbnNlEh0KCmlzX3N1Y2Nlc3MYASABKAhSCWlzU3'
    'VjY2Vzcw==');

@$core.Deprecated('Use changePasswordRequestDescriptor instead')
const ChangePasswordRequest$json = {
  '1': 'ChangePasswordRequest',
  '2': [
    {'1': 'password', '3': 1, '4': 1, '5': 9, '10': 'password'},
    {'1': 'new_password', '3': 2, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

/// Descriptor for `ChangePasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordRequestDescriptor = $convert.base64Decode(
    'ChVDaGFuZ2VQYXNzd29yZFJlcXVlc3QSGgoIcGFzc3dvcmQYASABKAlSCHBhc3N3b3JkEiEKDG'
    '5ld19wYXNzd29yZBgCIAEoCVILbmV3UGFzc3dvcmQ=');

@$core.Deprecated('Use changePasswordResponseDescriptor instead')
const ChangePasswordResponse$json = {
  '1': 'ChangePasswordResponse',
  '2': [
    {'1': 'isSuccess', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
    {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    {'1': 'access_token', '3': 3, '4': 1, '5': 9, '10': 'accessToken'},
  ],
};

/// Descriptor for `ChangePasswordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changePasswordResponseDescriptor = $convert.base64Decode(
    'ChZDaGFuZ2VQYXNzd29yZFJlc3BvbnNlEhwKCWlzU3VjY2VzcxgBIAEoCFIJaXNTdWNjZXNzEi'
    'MKDXJlZnJlc2hfdG9rZW4YAiABKAlSDHJlZnJlc2hUb2tlbhIhCgxhY2Nlc3NfdG9rZW4YAyAB'
    'KAlSC2FjY2Vzc1Rva2Vu');

@$core.Deprecated('Use passwordRecoveryRequestDescriptor instead')
const PasswordRecoveryRequest$json = {
  '1': 'PasswordRecoveryRequest',
  '2': [
    {'1': 'username_or_email', '3': 1, '4': 1, '5': 9, '10': 'usernameOrEmail'},
  ],
};

/// Descriptor for `PasswordRecoveryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passwordRecoveryRequestDescriptor = $convert.base64Decode(
    'ChdQYXNzd29yZFJlY292ZXJ5UmVxdWVzdBIqChF1c2VybmFtZV9vcl9lbWFpbBgBIAEoCVIPdX'
    'Nlcm5hbWVPckVtYWls');

@$core.Deprecated('Use passwordRecoveryResponseDescriptor instead')
const PasswordRecoveryResponse$json = {
  '1': 'PasswordRecoveryResponse',
  '2': [
    {'1': 'isSuccess', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
  ],
};

/// Descriptor for `PasswordRecoveryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List passwordRecoveryResponseDescriptor = $convert.base64Decode(
    'ChhQYXNzd29yZFJlY292ZXJ5UmVzcG9uc2USHAoJaXNTdWNjZXNzGAEgASgIUglpc1N1Y2Nlc3'
    'M=');

@$core.Deprecated('Use deleteUserRequestDescriptor instead')
const DeleteUserRequest$json = {
  '1': 'DeleteUserRequest',
};

/// Descriptor for `DeleteUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVVc2VyUmVxdWVzdA==');

@$core.Deprecated('Use deleteUserResponseDescriptor instead')
const DeleteUserResponse$json = {
  '1': 'DeleteUserResponse',
  '2': [
    {'1': 'is_success', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
  ],
};

/// Descriptor for `DeleteUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserResponseDescriptor = $convert.base64Decode(
    'ChJEZWxldGVVc2VyUmVzcG9uc2USHQoKaXNfc3VjY2VzcxgBIAEoCFIJaXNTdWNjZXNz');

@$core.Deprecated('Use createDefUserRequestDescriptor instead')
const CreateDefUserRequest$json = {
  '1': 'CreateDefUserRequest',
};

/// Descriptor for `CreateDefUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDefUserRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVEZWZVc2VyUmVxdWVzdA==');

@$core.Deprecated('Use createDefUserResponseDescriptor instead')
const CreateDefUserResponse$json = {
  '1': 'CreateDefUserResponse',
  '2': [
    {'1': 'is_success', '3': 1, '4': 1, '5': 8, '10': 'isSuccess'},
    {'1': 'userID', '3': 2, '4': 1, '5': 5, '10': 'userID'},
    {'1': 'access_token', '3': 3, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'refresh_token', '3': 4, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `CreateDefUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDefUserResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVEZWZVc2VyUmVzcG9uc2USHQoKaXNfc3VjY2VzcxgBIAEoCFIJaXNTdWNjZXNzEh'
    'YKBnVzZXJJRBgCIAEoBVIGdXNlcklEEiEKDGFjY2Vzc190b2tlbhgDIAEoCVILYWNjZXNzVG9r'
    'ZW4SIwoNcmVmcmVzaF90b2tlbhgEIAEoCVIMcmVmcmVzaFRva2Vu');

