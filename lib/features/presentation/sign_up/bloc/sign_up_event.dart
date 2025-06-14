part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class FirstNameChanged extends SignUpEvent {
  const FirstNameChanged({required this.firstName});
  final String firstName;
}

class LastNameChanged extends SignUpEvent {
  const LastNameChanged({required this.lastName});
  final String lastName;
}

class PhoneChanged extends SignUpEvent {
  const PhoneChanged({required this.phone});
  final String phone;
}

class EmailChanged extends SignUpEvent {
  const EmailChanged({required this.email});
  final String email;
}

class PasswordChanged extends SignUpEvent {
  const PasswordChanged({required this.password});
  final String password;
}

class ConfirmPasswordChanged extends SignUpEvent {
  const ConfirmPasswordChanged({required this.password});
  final String password;
}

class SignUp extends SignUpEvent {
  const SignUp(
      {required this.firstNameFocusNode,
      required this.lastNameFocusNode,
      required this.phoneFocusNode,
      required this.passwordFocusNode,
      required this.confirmPasswordFocusNode});
  final FocusNode firstNameFocusNode;
  final FocusNode lastNameFocusNode;
  final FocusNode phoneFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode confirmPasswordFocusNode;
}

class RequestOTP extends SignUpEvent {}
