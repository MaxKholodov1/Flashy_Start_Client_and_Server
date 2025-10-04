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

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CheckUserNameAvailabilityRequest extends $pb.GeneratedMessage {
  factory CheckUserNameAvailabilityRequest({
    $core.String? userName,
  }) {
    final result = create();
    if (userName != null) result.userName = userName;
    return result;
  }

  CheckUserNameAvailabilityRequest._();

  factory CheckUserNameAvailabilityRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CheckUserNameAvailabilityRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckUserNameAvailabilityRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user.validation'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userName', protoName: 'userName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckUserNameAvailabilityRequest clone() => CheckUserNameAvailabilityRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckUserNameAvailabilityRequest copyWith(void Function(CheckUserNameAvailabilityRequest) updates) => super.copyWith((message) => updates(message as CheckUserNameAvailabilityRequest)) as CheckUserNameAvailabilityRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckUserNameAvailabilityRequest create() => CheckUserNameAvailabilityRequest._();
  @$core.override
  CheckUserNameAvailabilityRequest createEmptyInstance() => create();
  static $pb.PbList<CheckUserNameAvailabilityRequest> createRepeated() => $pb.PbList<CheckUserNameAvailabilityRequest>();
  @$core.pragma('dart2js:noInline')
  static CheckUserNameAvailabilityRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckUserNameAvailabilityRequest>(create);
  static CheckUserNameAvailabilityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userName => $_getSZ(0);
  @$pb.TagNumber(1)
  set userName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserName() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserName() => $_clearField(1);
}

class CheckUserNameAvailabilityResponse extends $pb.GeneratedMessage {
  factory CheckUserNameAvailabilityResponse({
    $core.bool? isAvailable,
  }) {
    final result = create();
    if (isAvailable != null) result.isAvailable = isAvailable;
    return result;
  }

  CheckUserNameAvailabilityResponse._();

  factory CheckUserNameAvailabilityResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CheckUserNameAvailabilityResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckUserNameAvailabilityResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user.validation'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAvailable')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckUserNameAvailabilityResponse clone() => CheckUserNameAvailabilityResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckUserNameAvailabilityResponse copyWith(void Function(CheckUserNameAvailabilityResponse) updates) => super.copyWith((message) => updates(message as CheckUserNameAvailabilityResponse)) as CheckUserNameAvailabilityResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckUserNameAvailabilityResponse create() => CheckUserNameAvailabilityResponse._();
  @$core.override
  CheckUserNameAvailabilityResponse createEmptyInstance() => create();
  static $pb.PbList<CheckUserNameAvailabilityResponse> createRepeated() => $pb.PbList<CheckUserNameAvailabilityResponse>();
  @$core.pragma('dart2js:noInline')
  static CheckUserNameAvailabilityResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckUserNameAvailabilityResponse>(create);
  static CheckUserNameAvailabilityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAvailable => $_getBF(0);
  @$pb.TagNumber(1)
  set isAvailable($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAvailable() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAvailable() => $_clearField(1);
}

class CheckUserEmailAvailabilityRequest extends $pb.GeneratedMessage {
  factory CheckUserEmailAvailabilityRequest({
    $core.String? userEmail,
  }) {
    final result = create();
    if (userEmail != null) result.userEmail = userEmail;
    return result;
  }

  CheckUserEmailAvailabilityRequest._();

  factory CheckUserEmailAvailabilityRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CheckUserEmailAvailabilityRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckUserEmailAvailabilityRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user.validation'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userEmail', protoName: 'userEmail')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckUserEmailAvailabilityRequest clone() => CheckUserEmailAvailabilityRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckUserEmailAvailabilityRequest copyWith(void Function(CheckUserEmailAvailabilityRequest) updates) => super.copyWith((message) => updates(message as CheckUserEmailAvailabilityRequest)) as CheckUserEmailAvailabilityRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckUserEmailAvailabilityRequest create() => CheckUserEmailAvailabilityRequest._();
  @$core.override
  CheckUserEmailAvailabilityRequest createEmptyInstance() => create();
  static $pb.PbList<CheckUserEmailAvailabilityRequest> createRepeated() => $pb.PbList<CheckUserEmailAvailabilityRequest>();
  @$core.pragma('dart2js:noInline')
  static CheckUserEmailAvailabilityRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckUserEmailAvailabilityRequest>(create);
  static CheckUserEmailAvailabilityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userEmail => $_getSZ(0);
  @$pb.TagNumber(1)
  set userEmail($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserEmail() => $_clearField(1);
}

class CheckUserEmailAvailabilityResponse extends $pb.GeneratedMessage {
  factory CheckUserEmailAvailabilityResponse({
    $core.bool? isAvailable,
  }) {
    final result = create();
    if (isAvailable != null) result.isAvailable = isAvailable;
    return result;
  }

  CheckUserEmailAvailabilityResponse._();

  factory CheckUserEmailAvailabilityResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CheckUserEmailAvailabilityResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckUserEmailAvailabilityResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user.validation'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAvailable')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckUserEmailAvailabilityResponse clone() => CheckUserEmailAvailabilityResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckUserEmailAvailabilityResponse copyWith(void Function(CheckUserEmailAvailabilityResponse) updates) => super.copyWith((message) => updates(message as CheckUserEmailAvailabilityResponse)) as CheckUserEmailAvailabilityResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckUserEmailAvailabilityResponse create() => CheckUserEmailAvailabilityResponse._();
  @$core.override
  CheckUserEmailAvailabilityResponse createEmptyInstance() => create();
  static $pb.PbList<CheckUserEmailAvailabilityResponse> createRepeated() => $pb.PbList<CheckUserEmailAvailabilityResponse>();
  @$core.pragma('dart2js:noInline')
  static CheckUserEmailAvailabilityResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckUserEmailAvailabilityResponse>(create);
  static CheckUserEmailAvailabilityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAvailable => $_getBF(0);
  @$pb.TagNumber(1)
  set isAvailable($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAvailable() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAvailable() => $_clearField(1);
}

class CheckUserPasswordAvailabilityRequest extends $pb.GeneratedMessage {
  factory CheckUserPasswordAvailabilityRequest({
    $core.String? password,
  }) {
    final result = create();
    if (password != null) result.password = password;
    return result;
  }

  CheckUserPasswordAvailabilityRequest._();

  factory CheckUserPasswordAvailabilityRequest.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CheckUserPasswordAvailabilityRequest.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckUserPasswordAvailabilityRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'user.validation'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckUserPasswordAvailabilityRequest clone() => CheckUserPasswordAvailabilityRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckUserPasswordAvailabilityRequest copyWith(void Function(CheckUserPasswordAvailabilityRequest) updates) => super.copyWith((message) => updates(message as CheckUserPasswordAvailabilityRequest)) as CheckUserPasswordAvailabilityRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckUserPasswordAvailabilityRequest create() => CheckUserPasswordAvailabilityRequest._();
  @$core.override
  CheckUserPasswordAvailabilityRequest createEmptyInstance() => create();
  static $pb.PbList<CheckUserPasswordAvailabilityRequest> createRepeated() => $pb.PbList<CheckUserPasswordAvailabilityRequest>();
  @$core.pragma('dart2js:noInline')
  static CheckUserPasswordAvailabilityRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckUserPasswordAvailabilityRequest>(create);
  static CheckUserPasswordAvailabilityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get password => $_getSZ(0);
  @$pb.TagNumber(1)
  set password($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassword() => $_clearField(1);
}

class CheckUserPasswordAvailabilityResponse extends $pb.GeneratedMessage {
  factory CheckUserPasswordAvailabilityResponse({
    $core.bool? isValid,
  }) {
    final result = create();
    if (isValid != null) result.isValid = isValid;
    return result;
  }

  CheckUserPasswordAvailabilityResponse._();

  factory CheckUserPasswordAvailabilityResponse.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory CheckUserPasswordAvailabilityResponse.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckUserPasswordAvailabilityResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'user.validation'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isValid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckUserPasswordAvailabilityResponse clone() => CheckUserPasswordAvailabilityResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckUserPasswordAvailabilityResponse copyWith(void Function(CheckUserPasswordAvailabilityResponse) updates) => super.copyWith((message) => updates(message as CheckUserPasswordAvailabilityResponse)) as CheckUserPasswordAvailabilityResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckUserPasswordAvailabilityResponse create() => CheckUserPasswordAvailabilityResponse._();
  @$core.override
  CheckUserPasswordAvailabilityResponse createEmptyInstance() => create();
  static $pb.PbList<CheckUserPasswordAvailabilityResponse> createRepeated() => $pb.PbList<CheckUserPasswordAvailabilityResponse>();
  @$core.pragma('dart2js:noInline')
  static CheckUserPasswordAvailabilityResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckUserPasswordAvailabilityResponse>(create);
  static CheckUserPasswordAvailabilityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isValid => $_getBF(0);
  @$pb.TagNumber(1)
  set isValid($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsValid() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsValid() => $_clearField(1);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
