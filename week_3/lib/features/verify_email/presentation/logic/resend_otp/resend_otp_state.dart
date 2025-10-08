import 'package:freezed_annotation/freezed_annotation.dart';

part 'resend_otp_state.freezed.dart';

@freezed
class ResendOtpState<T> with _$ResendOtpState<T> {
  const factory ResendOtpState.idle() = Idle<T>;

  const factory ResendOtpState.loading() = Loading;
  const factory ResendOtpState.success(T data) = Success<T>;
  const factory ResendOtpState.error({required String error}) = Error;
}
