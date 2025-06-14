part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  const EditProfileState(
      {this.loading = false,
      this.firstName = "",
      this.lastName = "",
      this.email = "",
      this.phone = "",
      this.companyName = "",
      this.summery = "",
      this.forms = Forms.initial,
      this.profile = const Profile(),
      this.date = "",
      this.gender = "",
      this.images = const [],
      this.documents = const [],
      this.added = false});

  final bool loading;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String companyName;
  final String summery;
  final Forms forms;
  final Profile profile;
  final String date;
  final String gender;
  final List<ImageFile> images;
  final List<ImageFile> documents;
  final bool added;

  EditProfileState copyWith(
      {bool? loading,
      String? firstName,
      String? lastName,
      String? phone,
      String? email,
      String? companyName,
      String? summery,
      Forms? forms,
      Profile? profile,
      String? date,
      String? gender,
      List<ImageFile>? images,
      List<ImageFile>? documents,
      bool? added}) {
    return EditProfileState(
        loading: loading ?? this.loading,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        companyName: companyName ?? this.companyName,
        summery: summery ?? this.summery,
        forms: forms ?? this.forms,
        profile: profile ?? this.profile,
        date: date ?? this.date,
        gender: gender ?? this.gender,
        images: images ?? this.images,
        documents: documents ?? this.documents,
        added: added ?? this.added);
  }

  @override
  List<Object> get props => [
        loading,
        firstName,
        lastName,
        phone,
        email,
        companyName,
        summery,
        forms,
        profile,
        date,
        gender,
        images,
        documents,
        added
      ];
}

class OnBoardInitial extends EditProfileState {}
