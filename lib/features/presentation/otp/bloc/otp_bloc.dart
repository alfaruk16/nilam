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
import 'package:nilam/features/data/model/otp_model.dart';
import 'package:nilam/features/domain/entities/otp_response.dart';
import 'package:nilam/features/domain/entities/profile.dart';
import 'package:nilam/features/domain/entities/token_response.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc(this._apiRepo, this._iFlutterNavigator, this._localStorageRepo)
      : super(const OtpState()) {
    on<GetProfile>(_getProfile);
    on<RequestOTP>(_requestOTP);
    on<OtpChanged>(_otpChanged);
    on<SubmitOtp>(_submitOtp);
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;
  final LocalStorageRepo _localStorageRepo;

  Future<FutureOr<void>> _getProfile(
      GetProfile event, Emitter<OtpState> emit) async {
    final profile = await _localStorageRepo.readModel<Profile>(key: profileDB);
    if (profile != null) {
      emit(state.copyWith(profile: profile));
      if (event.requestOtp) {
        add(RequestOTP());
      }
    }
  }

  Future<FutureOr<void>> _requestOTP(
      RequestOTP event, Emitter<OtpState> emit) async {
    final otp = await _apiRepo.post<OtpResponse>(
        endpoint: sendOtp, body: OtpModel(username: state.profile.userName!));
    if (otp != null) {
      ShowSnackBar(
          message: otp.responseMessage!, navigator: _iFlutterNavigator);
    }
  }

  FutureOr<void> _otpChanged(OtpChanged event, Emitter<OtpState> emit) {
    emit(state.copyWith(password: event.email));
  }

  Future<FutureOr<void>> _submitOtp(
      SubmitOtp event, Emitter<OtpState> emit) async {
    if (Validator.isValidated(items: [
      FormItem(text: state.password, focusNode: event.otpFocusNode),
    ], navigator: _iFlutterNavigator)) {
      if (!state.loading) {
        emit(state.copyWith(loading: true));

        final client = await _apiRepo.postUrlEncode<TokenResponse>(
            endpoint: getToken,
            body:
                "username=${state.profile.mobile}&password=${state.password}&use_otp=${true}&grant_type=$clientCredentials&client_id=$masterClient&client_secret=$clientSecret&offset=${DateTime.now().timeZoneOffset.inMinutes}");
        if (client != null) {
          await Future.delayed(const Duration(milliseconds: 500));
          final profile =
              await _apiRepo.post<Profile>(endpoint: getUserProfile);
          if (profile != null) {
            _localStorageRepo.writeModel(key: profileDB, value: profile);
          }
          ShowSnackBar(
              message: client.responseMessage!, navigator: _iFlutterNavigator);
          await _localStorageRepo.write(
              key: tokenDB, value: client.accessToken!);
          await _localStorageRepo.writeModel(key: clientDB, value: client);
          _iFlutterNavigator.pop();
        }

        emit(state.copyWith(loading: false));
      }
    } else {
      emit(state.copyWith(forms: Forms.invalid));
    }
  }
}
