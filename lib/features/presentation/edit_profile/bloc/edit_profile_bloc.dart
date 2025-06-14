import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nilam/core/form_validator/validator.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/snackbar/show_snackbar.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/core/utils/utilities.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/domain/entities/nilam_response.dart';
import 'package:nilam/features/domain/entities/profile.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(this._apiRepo, this._iFlutterNavigator, this._imagePicker)
      : super(const EditProfileState()) {
    on<FirstNameChanged>(_firstNameChanged);
    on<LastNameChanged>(_lastNameChanged);
    on<PhoneChanged>(_phoneChanged);
    on<EmailChanged>(_emailChanged);
    on<CompanyNameChanged>(_companyNameChanged);
    on<SummeryChanged>(_summeryChanged);
    on<Update>(_update);
    on<GetProfile>(_getProfile);
    on<SelectDate>(_selectDate);
    on<GenderSelected>(_genderSelected);
    on<PickImage>(_pickImage);
    on<PickDocuments>(_pickDocuments);
    on<CancelAnImage>(_cancelAnImage);
    on<Added>(_added);
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;
  final ImagePicker _imagePicker;

  FutureOr<void> _firstNameChanged(
      FirstNameChanged event, Emitter<EditProfileState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  FutureOr<void> _lastNameChanged(
      LastNameChanged event, Emitter<EditProfileState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  FutureOr<void> _phoneChanged(
      PhoneChanged event, Emitter<EditProfileState> emit) {
    emit(state.copyWith(phone: event.phone));
  }

  FutureOr<void> _emailChanged(
      EmailChanged event, Emitter<EditProfileState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _companyNameChanged(
      CompanyNameChanged event, Emitter<EditProfileState> emit) {
    emit(state.copyWith(companyName: event.password));
  }

  FutureOr<void> _summeryChanged(
      SummeryChanged event, Emitter<EditProfileState> emit) {
    emit(state.copyWith(summery: event.password));
  }

  Future<FutureOr<void>> _update(
      Update event, Emitter<EditProfileState> emit) async {
    if (Validator.isValidated(items: [
      FormItem(text: state.firstName, focusNode: event.firstNameFocusNode),
      FormItem(text: state.lastName, focusNode: event.lastNameFocusNode),
    ], navigator: _iFlutterNavigator)) {
      if (!state.loading) {
        emit(state.copyWith(loading: true));

        final update = await _apiRepo.post<NilamResponse>(
            endpoint: updateUserProfile,
            body: state.profile.copyWith(
                firstName: state.firstName,
                lastName: state.lastName,
                dob: state.date,
                gender: state.gender,
                company: state.profile.company != null
                    ? state.profile.company!.copyWith(
                        companyName: state.companyName,
                        companySummary: state.summery,
                        contactNo: state.phone,
                        email: state.email)
                    : state.profile.company));
        emit(state.copyWith(loading: false));
        if (update != null) {
          ShowSnackBar(
              message: update.responseMessage!, navigator: _iFlutterNavigator);
          _iFlutterNavigator.pop();
        }
      }
    } else {
      emit(state.copyWith(forms: Forms.invalid));
    }
  }

  FutureOr<void> _getProfile(GetProfile event, Emitter<EditProfileState> emit) {
    emit(state.copyWith(
      profile: event.profile,
      firstName: event.profile.firstName ?? "",
      lastName: event.profile.lastName ?? "",
      date: event.profile.dob != null
          ? DateFormat("yyyy-MM-dd").format(DateTime.parse(event.profile.dob!))
          : "",
      gender: event.profile.gender ?? "",
      companyName: event.profile.company != null
          ? event.profile.company!.companyName ?? ""
          : "",
      summery: event.profile.company != null
          ? event.profile.company!.companySummary ?? ""
          : "",
      phone: event.profile.company != null
          ? event.profile.company!.contactNo ?? ""
          : "",
      email: event.profile.company != null
          ? event.profile.company!.email ?? ""
          : "",
    ));
  }

  FutureOr<void> _selectDate(SelectDate event, Emitter<EditProfileState> emit) {
    final date = DateFormat('yyyy-MM-dd').format(DateTime.parse(event.date));
    emit(state.copyWith(date: date));
    event.controller.text = date;
  }

  FutureOr<void> _genderSelected(
      GenderSelected event, Emitter<EditProfileState> emit) {
    String gender = "Male";
    if (event.gender == 2) {
      gender = "Female";
    } else if (event.gender == 3) {
      gender = "Other";
    }
    emit(state.copyWith(gender: gender));
  }

  Future<FutureOr<void>> _pickImage(
      PickImage event, Emitter<EditProfileState> emit) async {
    XFile? file = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 25);

    if (file != null) {
      emit(state.copyWith(
          images: List.from(state.images)
            ..clear()
            ..add(ImageFile(name: 'ProfileImageUrl', file: file))));
    }
  }

  Future<FutureOr<void>> _pickDocuments(
      PickDocuments event, Emitter<EditProfileState> emit) async {
    XFile? file = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 25);

    if (file != null) {
      emit(state.copyWith(
          documents: List.from(state.documents)
            ..add(ImageFile(name: 'Documents[]', file: file))));
    }
  }

  FutureOr<void> _cancelAnImage(
      CancelAnImage event, Emitter<EditProfileState> emit) {
    emit(state.copyWith(
        images: List.from(state.documents)..removeAt(event.index)));
  }

  FutureOr<void> _added(Added event, Emitter<EditProfileState> emit) {
    emit(state.copyWith(added: true));
  }
}
