import '../../../domain/failures/failures.dart';

class CheckSessionOnStartResult {
  final bool isActive;
  final Failure? failure;
  final int? userID;

  const CheckSessionOnStartResult._({
    required this.isActive,
    this.userID,
    this.failure,
  });
  factory CheckSessionOnStartResult.isActive(bool isActive, int? userID) {
    return  CheckSessionOnStartResult._(isActive: isActive, userID: userID);
  }
  factory CheckSessionOnStartResult.failure(Failure failure) {
    return CheckSessionOnStartResult._(isActive: false, failure: failure);
  }
}
