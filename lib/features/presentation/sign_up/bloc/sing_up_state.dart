part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState(
      {this.loading = false,
      this.firstName = "",
      this.lastName = "",
      this.email = "",
      this.phone = "",
      this.password = "",
      this.confirmPassword = "",
      this.forms = Forms.initial});

  final bool loading;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;
  final Forms forms;

  SignUpState copyWith(
      {bool? loading,
      String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? password,
      String? confirmPassword,
      Forms? forms}) {
    return SignUpState(
        loading: loading ?? this.loading,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        forms: forms ?? this.forms);
  }

  @override
  List<Object> get props => [
        loading,
        firstName,
        lastName,
        phone,
        email,
        password,
        confirmPassword,
        forms
      ];
}

class OnBoardInitial extends SignUpState {}
