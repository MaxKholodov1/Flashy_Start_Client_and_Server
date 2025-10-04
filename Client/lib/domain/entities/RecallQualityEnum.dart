enum RecallQuality {
  bad(0),
  normal(1),
  good(2),
  perfect(3);

  final int value;
  const RecallQuality(this.value);

  static RecallQuality fromInt(int val) {
    return RecallQuality.values.firstWhere(
          (e) => e.value == val,
      orElse: () => RecallQuality.bad,
    );
  }

  @override
  String toString() {
    switch (this) {
      case RecallQuality.bad:
        return 'Bad';
      case RecallQuality.normal:
        return 'Normal';
      case RecallQuality.good:
        return 'Good';
      case RecallQuality.perfect:
        return 'Perfect';
    }
  }
}
