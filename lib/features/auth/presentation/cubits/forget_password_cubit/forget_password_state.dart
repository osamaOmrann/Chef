abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ChangeNewPasswordSuffixIcon extends ForgetPasswordState {}
class ChangeConfirmPasswordSuffixIcon extends ForgetPasswordState {}
final class SendCodeLoading extends ForgetPasswordState {}
final class SendCodeSuccess extends ForgetPasswordState {
  final String message;

  SendCodeSuccess(this.message);
}
final class SendCodeError extends ForgetPasswordState {
  final String message;

  SendCodeError(this.message);
}

final class ResetPasswordLoading extends ForgetPasswordState {}
final class ResetPasswordSuccess extends ForgetPasswordState {
  final String message;

  ResetPasswordSuccess(this.message);
}
final class ResetPasswordError extends ForgetPasswordState {
  final String message;

  ResetPasswordError(this.message);
}