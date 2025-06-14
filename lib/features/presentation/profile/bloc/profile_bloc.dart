import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/snackbar/show_snackbar.dart';
import 'package:nilam/features/data/data_sources/local_keys.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/data/model/otp_model.dart';
import 'package:nilam/features/domain/entities/otp_response.dart';
import 'package:nilam/features/domain/entities/profile.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/add_edit_address/view/add_edit_address_screen.dart';
import 'package:nilam/features/presentation/addresses/view/address_screen.dart';
import 'package:nilam/features/presentation/edit_profile/view/edit_profile_screen.dart';
import 'package:nilam/features/presentation/my_bargains/view/my_bargains_screen.dart';
import 'package:nilam/features/presentation/on_board/view/on_board_screen.dart';
import 'package:nilam/features/presentation/orders/view/order_screen.dart';
import 'package:nilam/features/presentation/profile/widgets/update_email.dart';
import 'package:nilam/features/presentation/profile/widgets/update_phone.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._apiRepo, this._iFlutterNavigator, this._localStorageRepo)
      : super(const ProfileState()) {
    on<GetProfile>(_getProfile);
    on<EditProfile>(_editProfile);
    on<AddAddress>(_addAddress);
    on<EditAddress>(_editAddress);
    on<UpdatePhone>(_updatePhone);
    on<UpdateEmail>(_updateEmail);
    on<SendOtp>(_sendOtp);
    on<SubmitOtp>(_submitOtp);
    on<GetCurrentProfile>(_getCurrentProfile);
    on<GoToMyOrder>(_goToMyOrder);
    on<GoToMyAddress>(_goToAddress);
    on<GoToMyBargain>(_goToMyBargain);
    on<LogOut>(_logOut);

    add(GetProfile());
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;
  final LocalStorageRepo _localStorageRepo;

  Future<FutureOr<void>> _getProfile(
      GetProfile event, Emitter<ProfileState> emit) async {
    final profile = await _localStorageRepo.readModel<Profile>(key: profileDB);
    if (profile != null) {
      emit(state.copyWith(profile: profile));
    }
  }

  FutureOr<void> _editProfile(EditProfile event, Emitter<ProfileState> emit) {
    _iFlutterNavigator
        .push(EditProfileScreen.route(profile: state.profile))
        .then((value) => add(GetCurrentProfile()));
  }

  FutureOr<void> _addAddress(AddAddress event, Emitter<ProfileState> emit) {
    _iFlutterNavigator.push(AddEditAddressScreen.route());
  }

  FutureOr<void> _editAddress(EditAddress event, Emitter<ProfileState> emit) {
    final address = state.profile.address;
    _iFlutterNavigator.push(AddEditAddressScreen.route(address: address!));
  }

  FutureOr<void> _updatePhone(UpdatePhone event, Emitter<ProfileState> emit) {
    showUpdatePhone(event.context, sendOtp: (String user) {
      add(SendOtp(phone: user));
    }, submit: (String otp, String user) {
      add(SubmitOtp(otp: otp, phone: user));
    },
        mobile: state.profile.mobile ?? "",
        otpLoading: state.otpLoading,
        submitLoading: state.submitOtpLoading);
  }

  FutureOr<void> _updateEmail(UpdateEmail event, Emitter<ProfileState> emit) {
    showUpdateEmail(event.context, sendOtp: (String user) {
      add(SendOtp(phone: user));
    }, submit: (String otp, String user) {
      add(SubmitOtp(otp: otp, phone: user));
    },
        otpLoading: state.otpLoading,
        submitLoading: state.submitOtpLoading,
        email: state.profile.email ?? "");
  }

  Future<FutureOr<void>> _sendOtp(
      SendOtp event, Emitter<ProfileState> emit) async {
    if (!state.otpLoading) {
      emit(state.copyWith(otpLoading: true));
      final otp = await _apiRepo.post<OtpResponse>(
          endpoint: sendOtpForChange, body: OtpModel(username: event.phone));
      if (otp == null) {
        if (_iFlutterNavigator.canPop()) {
          _iFlutterNavigator.pop();
        }
      } else {
        ShowSnackBar(
            message: otp.responseMessage!, navigator: _iFlutterNavigator);
      }
      emit(state.copyWith(otpLoading: false));
    }
  }

  Future<FutureOr<void>> _submitOtp(
      SubmitOtp event, Emitter<ProfileState> emit) async {
    if (!state.submitOtpLoading) {
      emit(state.copyWith(submitOtpLoading: true));
      final otp = await _apiRepo.post<OtpResponse>(
          endpoint: validateOtp,
          body: ValidateOtpModel(username: event.otp, otp: event.otp));
      if (otp != null) {
        if (_iFlutterNavigator.canPop()) {
          _iFlutterNavigator.pop();
        }
        ShowSnackBar(
            message: otp.responseMessage!, navigator: _iFlutterNavigator);
        add(GetCurrentProfile());
      }
      emit(state.copyWith(submitOtpLoading: false));
    }
  }

  Future<FutureOr<void>> _getCurrentProfile(
      GetCurrentProfile event, Emitter<ProfileState> emit) async {
    final profile = await _apiRepo.post<Profile>(endpoint: getUserProfile);
    if (profile != null) {
      _localStorageRepo.writeModel(key: profileDB, value: profile);
      add(GetProfile());
    }
  }

  FutureOr<void> _goToMyOrder(GoToMyOrder event, Emitter<ProfileState> emit) {
    _iFlutterNavigator.push(OrderScreen.route());
  }

  FutureOr<void> _goToAddress(GoToMyAddress event, Emitter<ProfileState> emit) {
    _iFlutterNavigator.push(AddressScreen.route());
  }

  FutureOr<void> _logOut(LogOut event, Emitter<ProfileState> emit) {
    _localStorageRepo.removeAll();
    _iFlutterNavigator.pushReplacement(OnBoardScreen.route());
  }

  FutureOr<void> _goToMyBargain(
      GoToMyBargain event, Emitter<ProfileState> emit) {
    _iFlutterNavigator.push(MyBargainsScreen.route());
  }
}
