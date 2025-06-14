import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/form_validator/validator.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/snackbar/show_snackbar.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/data/data_sources/local_keys.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/data/model/sign_up_model.dart';
import 'package:nilam/features/domain/entities/register_response.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/otp/view/otp_screen.dart';

part 'sign_up_event.dart';
part 'sing_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this._apiRepo, this._iFlutterNavigator, this._localStorageRepo)
      : super(const SignUpState()) {
    on<FirstNameChanged>(_firstNameChanged);
    on<LastNameChanged>(_lastNameChanged);
    on<PhoneChanged>(_phoneChanged);
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<ConfirmPasswordChanged>(_confirmPasswordChanged);
    on<SignUp>(_signUp);
    on<RequestOTP>(_requestOTP);
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;
  final LocalStorageRepo _localStorageRepo;

  FutureOr<void> _firstNameChanged(
      FirstNameChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  FutureOr<void> _lastNameChanged(
      LastNameChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  FutureOr<void> _phoneChanged(PhoneChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(phone: event.phone));
  }

  FutureOr<void> _emailChanged(EmailChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _passwordChanged(
      PasswordChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _confirmPasswordChanged(
      ConfirmPasswordChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(confirmPassword: event.password));
  }

  Future<FutureOr<void>> _signUp(
      SignUp event, Emitter<SignUpState> emit) async {
    if (Validator.isValidated(items: [
      FormItem(text: state.firstName, focusNode: event.firstNameFocusNode),
      FormItem(text: state.lastName, focusNode: event.lastNameFocusNode),
      FormItem(text: state.phone, focusNode: event.phoneFocusNode),
      FormItem(text: state.password, focusNode: event.passwordFocusNode),
      FormItem(
          text: state.confirmPassword,
          focusNode: event.confirmPasswordFocusNode),
    ], navigator: _iFlutterNavigator)) {
      if (state.password == state.confirmPassword) {
        if (!state.loading) {
          emit(state.copyWith(loading: true));
          final registerResponse = await _apiRepo.post<UserProfileResponse>(
              endpoint: register,
              body: SignUpModel(
                  firstName: state.firstName,
                  lastName: state.lastName,
                  email: state.email.isNotEmpty ? state.email : null,
                  password: state.password,
                  confirmPassword: state.confirmPassword,
                  countryCode: "880",
                  mobileNumber: state.phone,
                  clientId: masterClient,
                  clientSecret: clientSecret,
                  grantType: clientCredentials,
                  offset: DateTime.now().timeZoneOffset.inMinutes));
          emit(state.copyWith(loading: false));
          if (registerResponse != null) {
            ShowSnackBar(
                message: registerResponse.responseMessage!,
                navigator: _iFlutterNavigator);

            _localStorageRepo.writeModel(
                key: profileDB, value: registerResponse.profile);
            if (registerResponse.profile!.mobileVerifiedAt != null) {
              _iFlutterNavigator.pop();
            } else {
              _iFlutterNavigator.pushReplacement(OtpScreen.route(requestOtp: false));
            }
          }
        }
      } else {
        ShowSnackBar(
            message: "Password didn't match",
            navigator: _iFlutterNavigator,
            error: true);
        FocusScope.of(_iFlutterNavigator.context)
            .requestFocus(event.confirmPasswordFocusNode);
      }
    } else {
      emit(state.copyWith(forms: Forms.invalid));
    }
  }

  Future<FutureOr<void>> _requestOTP(
      RequestOTP event, Emitter<SignUpState> emit) async {}
}
