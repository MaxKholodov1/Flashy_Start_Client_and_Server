
abstract class Failure {}

class NetworkFailure extends Failure {}

class UsernameValidationFailure extends Failure {
  final String message;
  UsernameValidationFailure(this.message);
}
class InvalidCardArgument extends Failure{
  final String message;
  InvalidCardArgument(this.message);
}
class EmailValidationFailure extends Failure {
  final String message;
  EmailValidationFailure(this.message);
}
class PasswordValidationFailure extends Failure {
  final String message;
  PasswordValidationFailure(this.message);
}
class UserNotFoundFailure extends Failure {
  final String message;
  UserNotFoundFailure(this.message);
}
class GlobalCardNotFoundFailure extends Failure{
  final String message;
  GlobalCardNotFoundFailure(this.message);
}
class IncorrectPasswordFailure extends Failure{
  final String message;
  IncorrectPasswordFailure(this.message);
}
class CreateUserInvalidArgumentFailure extends Failure{
  final String message;
  CreateUserInvalidArgumentFailure(this.message);
}
class UserAlreadyExistsFailure extends Failure{
  final String message;
  UserAlreadyExistsFailure(this.message);
}
class AuthFailure extends Failure{
  String message;
  AuthFailure( this.message);
}
class CreateDeckInvalidTitleFailure extends Failure{
  String message;
  CreateDeckInvalidTitleFailure(this.message);
}
class DeckPermissionDenied extends Failure{
  String message;
  DeckPermissionDenied (this.message);
}
class SuchPermissionAlreadyExistsFailure extends Failure{
  String message;
  SuchPermissionAlreadyExistsFailure (this.message);
}
class AuthorCantDeleteProgressDeckFailure extends Failure{
  String message;
  AuthorCantDeleteProgressDeckFailure(this.message);
}
class EmailVerificationFailure extends Failure{
  final int? userID;
  EmailVerificationFailure(this.userID);
}
class EmailVerificationInvalidCode extends Failure{}
class UnknownFailure extends Failure {}
