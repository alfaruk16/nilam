part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

class FirstNameChanged extends EditProfileEvent {
  const FirstNameChanged({required this.firstName});
  final String firstName;
}

class LastNameChanged extends EditProfileEvent {
  const LastNameChanged({required this.lastName});
  final String lastName;
}

class PhoneChanged extends EditProfileEvent {
  const PhoneChanged({required this.phone});
  final String phone;
}

class EmailChanged extends EditProfileEvent {
  const EmailChanged({required this.email});
  final String email;
}

class CompanyNameChanged extends EditProfileEvent {
  const CompanyNameChanged({required this.password});
  final String password;
}

class SummeryChanged extends EditProfileEvent {
  const SummeryChanged({required this.password});
  final String password;
}

class Update extends EditProfileEvent {
  const Update(
      {required this.firstNameFocusNode,
      required this.lastNameFocusNode,
      required this.phoneFocusNode,
      required this.companyNameFocusNode,
      required this.summeryFocusNode});
  final FocusNode firstNameFocusNode;
  final FocusNode lastNameFocusNode;
  final FocusNode phoneFocusNode;
  final FocusNode companyNameFocusNode;
  final FocusNode summeryFocusNode;
}

class GetProfile extends EditProfileEvent {
  const GetProfile({required this.profile});
  final Profile profile;
}

class SelectDate extends EditProfileEvent {
  const SelectDate({required this.date, required this.controller});
  final String date;
  final TextEditingController controller;
}

class GenderSelected extends EditProfileEvent {
  const GenderSelected({required this.gender});
  final int gender;
}

class PickImage extends EditProfileEvent {}

class PickDocuments extends EditProfileEvent {}

class CancelAnImage extends EditProfileEvent {
  const CancelAnImage({required this.index});
  final int index;
}

class Added extends EditProfileEvent{}
