part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState(
      {this.loading = false,
      this.email = "",
      this.password = "",
      this.forms = Forms.initial});

  final bool loading;
  final String email;
  final String password;
  final Forms forms;

  LoginState copyWith(
      {bool? loading, String? email, String? password, Forms? forms}) {
    return LoginState(
        loading: loading ?? this.loading,
        email: email ?? this.email,
        password: password ?? this.password,
        forms: forms ?? this.forms);
  }

  @override
  List<Object> get props => [loading, email, password, forms];
}

class OnBoardInitial extends LoginState {}
