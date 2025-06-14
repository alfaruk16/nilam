part of 'otp_bloc.dart';

class OtpState extends Equatable {
  const OtpState(
      {this.loading = false,
      this.password = "",
      this.forms = Forms.initial,
      this.profile = const Profile()});

  final bool loading;
  final String password;
  final Forms forms;
  final Profile profile;

  OtpState copyWith(
      {bool? loading,
      String? password,
      Forms? forms,
      Profile? profile}) {
    return OtpState(
        loading: loading ?? this.loading,
        password: password ?? this.password,
        forms: forms ?? this.forms,
        profile: profile ?? this.profile);
  }

  @override
  List<Object> get props => [loading, password, forms, profile];
}

class OnBoardInitial extends OtpState {}
