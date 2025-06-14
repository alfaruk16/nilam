part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState(
      {this.loading = false,
      this.otpLoading = false,
      this.submitOtpLoading = false,
      this.profile = const Profile()});

  final bool loading, otpLoading, submitOtpLoading;
  final Profile profile;

  ProfileState copyWith(
      {bool? loading,
      Profile? profile,
      bool? otpLoading,
      bool? submitOtpLoading}) {
    return ProfileState(
        loading: loading ?? this.loading,
        profile: profile ?? this.profile,
        otpLoading: otpLoading ?? this.otpLoading,
        submitOtpLoading: submitOtpLoading ?? this.submitOtpLoading);
  }

  @override
  List<Object> get props => [loading, profile, otpLoading, submitOtpLoading];
}

class OnBoardInitial extends ProfileState {}
