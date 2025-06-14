part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfile extends ProfileEvent {}

class GetCurrentProfile extends ProfileEvent {}

class EditProfile extends ProfileEvent {}

class AddAddress extends ProfileEvent {}

class EditAddress extends ProfileEvent {}

class UpdatePhone extends ProfileEvent {
  const UpdatePhone({required this.context});
  final BuildContext context;
}

class UpdateEmail extends ProfileEvent {
  const UpdateEmail({required this.context});
  final BuildContext context;
}

class SendOtp extends ProfileEvent {
  const SendOtp({required this.phone});
  final String phone;
}

class SubmitOtp extends ProfileEvent {
  const SubmitOtp({required this.otp, required this.phone});
  final String otp;
  final String phone;
}

class GoToMyAddress extends ProfileEvent {}

class GoToMyOrder extends ProfileEvent {}

class GoToMyBargain extends ProfileEvent {}

class LogOut extends ProfileEvent {}
