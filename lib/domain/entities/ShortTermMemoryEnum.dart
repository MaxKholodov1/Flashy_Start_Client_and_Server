enum ShortTermMemory {
  unknown(0),
  bad(1),
  normal(2),
  good(3),
  perfect(4);

  final int value;
  const ShortTermMemory(this.value);

  static ShortTermMemory fromInt(int val) {
    return ShortTermMemory.values.firstWhere(
          (e) => e.value == val,
      orElse: () => ShortTermMemory.unknown,
    );
  }

  @override
  String toString() {
    switch (this) {
      case ShortTermMemory.unknown:
        return 'Unknown';
      case ShortTermMemory.bad:
        return 'Bad';
      case ShortTermMemory.normal:
        return 'Normal';
      case ShortTermMemory.good:
        return 'Good';
      case ShortTermMemory.perfect:
        return 'Perfect';
    }
  }
}
