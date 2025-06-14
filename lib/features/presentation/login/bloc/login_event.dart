part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  const EmailChanged({required this.email});
  final String email;
}

class PasswordChanged extends LoginEvent {
  const PasswordChanged({required this.password});
  final String password;
}

class SignIn extends LoginEvent {
  const SignIn({required this.emailFocusNode, required this.passwordFocusNode});
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
}

class GoToSignUp extends LoginEvent {}
