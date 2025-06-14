import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/form_validator/validator.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/data/data_sources/local_keys.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/domain/entities/profile.dart';
import 'package:nilam/features/domain/entities/token_response.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/otp/view/otp_screen.dart';
import 'package:nilam/features/presentation/sign_up/view/sign_up_screen.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._apiRepo, this._iFlutterNavigator, this._localStorageRepo)
      : super(const LoginState()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<SignIn>(_signIn);
    on<GoToSignUp>(_goToSignUp);
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;
  final LocalStorageRepo _localStorageRepo;

  FutureOr<void> _emailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _passwordChanged(
      PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<FutureOr<void>> _signIn(SignIn event, Emitter<LoginState> emit) async {
    if (Validator.isValidated(items: [
      FormItem(text: state.email, focusNode: event.emailFocusNode),
      FormItem(text: state.password, focusNode: event.passwordFocusNode)
    ], navigator: _iFlutterNavigator)) {
      if (!state.loading) {
        emit(state.copyWith(loading: true));
        final client = await _apiRepo.postUrlEncode<TokenResponse>(
            endpoint: getToken,
            body:
                "username=${state.email}&password=${state.password}&grant_type=$clientCredentials&client_id=$masterClient&client_secret=$clientSecret&offset=${DateTime.now().timeZoneOffset.inMinutes}");
        if (client != null) {
          await _localStorageRepo.write(
              key: tokenDB, value: client.accessToken!);
          await _localStorageRepo.writeModel(key: clientDB, value: client);
          await Future.delayed(const Duration(milliseconds: 500));
          final profile =
              await _apiRepo.post<Profile>(endpoint: getUserProfile);
          if (profile != null) {
            _localStorageRepo.writeModel(key: profileDB, value: profile);
            if (profile.mobileVerifiedAt != null) {
              _iFlutterNavigator.pop();
            } else {
              _iFlutterNavigator
                  .pushReplacement(OtpScreen.route(requestOtp: true));
            }
          }
        }

        emit(state.copyWith(loading: false));
      }
    } else {
      emit(state.copyWith(forms: Forms.invalid));
    }
  }

  FutureOr<void> _goToSignUp(GoToSignUp event, Emitter<LoginState> emit) {
    _iFlutterNavigator.push(SignUpScreen.route());
  }
}
