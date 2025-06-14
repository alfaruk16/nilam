part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object> get props => [];
}

class GetProfile extends OtpEvent {
  const GetProfile({required this.requestOtp});
  final bool requestOtp;
}

class RequestOTP extends OtpEvent {}

class OtpChanged extends OtpEvent {
  const OtpChanged({required this.email});
  final String email;
}

class SubmitOtp extends OtpEvent {
  const SubmitOtp({required this.otpFocusNode});
  final FocusNode otpFocusNode;
}
