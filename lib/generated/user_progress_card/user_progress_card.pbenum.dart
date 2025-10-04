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

class ShortTermMemory extends $pb.ProtobufEnum {
  static const ShortTermMemory STM_UNKNOWN = ShortTermMemory._(0, _omitEnumNames ? '' : 'STM_UNKNOWN');
  static const ShortTermMemory STM_BAD = ShortTermMemory._(1, _omitEnumNames ? '' : 'STM_BAD');
  static const ShortTermMemory STM_NORMAL = ShortTermMemory._(2, _omitEnumNames ? '' : 'STM_NORMAL');
  static const ShortTermMemory STM_GOOD = ShortTermMemory._(3, _omitEnumNames ? '' : 'STM_GOOD');
  static const ShortTermMemory STM_PERFECT = ShortTermMemory._(4, _omitEnumNames ? '' : 'STM_PERFECT');

  static const $core.List<ShortTermMemory> values = <ShortTermMemory> [
    STM_UNKNOWN,
    STM_BAD,
    STM_NORMAL,
    STM_GOOD,
    STM_PERFECT,
  ];

  static final $core.List<ShortTermMemory?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ShortTermMemory? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ShortTermMemory._(super.value, super.name);
}

class RecallQuality extends $pb.ProtobufEnum {
  static const RecallQuality BAD = RecallQuality._(0, _omitEnumNames ? '' : 'BAD');
  static const RecallQuality NORMAL = RecallQuality._(1, _omitEnumNames ? '' : 'NORMAL');
  static const RecallQuality GOOD = RecallQuality._(2, _omitEnumNames ? '' : 'GOOD');
  static const RecallQuality PERFECT = RecallQuality._(3, _omitEnumNames ? '' : 'PERFECT');

  static const $core.List<RecallQuality> values = <RecallQuality> [
    BAD,
    NORMAL,
    GOOD,
    PERFECT,
  ];

  static final $core.List<RecallQuality?> _byValue = $pb.ProtobufEnum.$_initByValueList(values, 3);
  static RecallQuality? valueOf($core.int value) =>  value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RecallQuality._(super.value, super.name);
}


const $core.bool _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
