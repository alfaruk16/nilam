import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/features/data/data_sources/local_keys.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/domain/entities/nilam_response.dart';
import 'package:nilam/features/domain/entities/user_address.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/add_edit_address/view/add_edit_address_screen.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc(this._apiRepo, this._iFlutterNavigator, this._localStorageRepo)
      : super(const AddressState()) {
    on<GetAddress>(_getAddress);
    on<GetCurrentAddress>(_getCurrentAddress);
    on<GoToAddEditAddress>(_goToAddEditAddress);
    on<MarkAsDefault>(_markAsDefault);

    add(GetCurrentAddress());
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;
  final LocalStorageRepo _localStorageRepo;

  Future<FutureOr<void>> _getAddress(
      GetAddress event, Emitter<AddressState> emit) async {
    final addressList = await _localStorageRepo
        .readModelForList<List<UserAddress>, UserAddress>(key: addressListDB);
    if (addressList != null) {
      emit(state.copyWith(addressList: addressList));
    }
  }

  FutureOr<void> _goToAddEditAddress(
      GoToAddEditAddress event, Emitter<AddressState> emit) {
    _iFlutterNavigator
        .push(AddEditAddressScreen.route(address: event.userAddress))
        .then((value) => add(GetCurrentAddress()));
  }

  Future<FutureOr<void>> _getCurrentAddress(
      GetCurrentAddress event, Emitter<AddressState> emit) async {
    final addressList =
        await _apiRepo.postForList<List<UserAddress>, UserAddress>(
            endpoint: getShippingAddress);

    if (addressList != null) {
      emit(state.copyWith(addressList: addressList));
      _localStorageRepo.writeModel(key: addressListDB, value: addressList);
    }
  }

  Future<FutureOr<void>> _markAsDefault(
      MarkAsDefault event, Emitter<AddressState> emit) async {
    if (!state.loading) {
      emit(state.copyWith(loading: true));
      final mark = await _apiRepo.post<NilamResponse>(
          endpoint: markAsDefaultAddress(event.id));
      emit(state.copyWith(loading: false));

      if (mark != null) {
        add(GetCurrentAddress());
      }
    }
  }
}
