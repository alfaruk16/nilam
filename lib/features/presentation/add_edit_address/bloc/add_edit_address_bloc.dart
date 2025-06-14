import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/form_validator/validator.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/snackbar/show_snackbar.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/core/widgets/dropdown_search.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/data/model/address_model.dart';
import 'package:nilam/features/domain/entities/address_response.dart';
import 'package:nilam/features/domain/entities/district_response.dart';
import 'package:nilam/features/domain/entities/division_response.dart';
import 'package:nilam/features/domain/entities/user_address.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';

part 'add_edit_address_event.dart';
part 'add_edit_address_state.dart';

class AddEditAddressBloc
    extends Bloc<AddEditAddressEvent, AddEditAddressState> {
  AddEditAddressBloc(
      this._apiRepo, this._iFlutterNavigator)
      : super(const AddEditAddressState()) {
    on<FirstNameChanged>(_firstNameChanged);
    on<LastNameChanged>(_lastNameChanged);
    on<PhoneChanged>(_phoneChanged);
    on<EmailChanged>(_emailChanged);
    on<AddressChanged>(_addressChanged);
    on<GetDivision>(_getDivision);
    on<GetDistrict>(_getDistrict);
    on<Update>(_update);
    on<DivisionSelected>(_divisionSelected);
    on<DistrictSelected>(_districtSelected);
    on<GetUserAddress>(_getUserAddress);
    on<Added>(_added);

    add(GetDivision());
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;

  FutureOr<void> _firstNameChanged(
      FirstNameChanged event, Emitter<AddEditAddressState> emit) {
    emit(state.copyWith(addressTitle: event.firstName));
  }

  FutureOr<void> _lastNameChanged(
      LastNameChanged event, Emitter<AddEditAddressState> emit) {
    emit(state.copyWith(name: event.lastName));
  }

  FutureOr<void> _phoneChanged(
      PhoneChanged event, Emitter<AddEditAddressState> emit) {
    emit(state.copyWith(phone: event.phone));
  }

  FutureOr<void> _emailChanged(
      EmailChanged event, Emitter<AddEditAddressState> emit) {
    emit(state.copyWith(email: event.email));
  }

  Future<FutureOr<void>> _getDivision(
      GetDivision event, Emitter<AddEditAddressState> emit) async {
    final division =
        await _apiRepo.postForList<List<DivisionResponse>, DivisionResponse>(
            endpoint: getDivisions);
    if (division != null) {
      List<DropdownItem> list = [];
      for (int i = 0; i < division.length; i++) {
        list.add(DropdownItem(name: division[i].name!, value: division[i].id!));
      }
      emit(state.copyWith(divisionList: list));
    }
  }

  FutureOr<void> _getDistrict(
      GetDistrict event, Emitter<AddEditAddressState> emit) {}

  Future<FutureOr<void>> _divisionSelected(
      DivisionSelected event, Emitter<AddEditAddressState> emit) async {
    emit(state.copyWith(division: event.id, district: event.districtId ?? -1));
    final district =
        await _apiRepo.postForList<List<DistrictResponse>, DistrictResponse>(
            endpoint: getDistrictsByDivision(event.id.toString()));

    if (district != null) {
      List<DropdownItem> list = [];
      for (int i = 0; i < district.length; i++) {
        list.add(DropdownItem(name: district[i].name!, value: district[i].id!));
      }
      emit(state.copyWith(districtList: list));
    }
  }

  FutureOr<void> _districtSelected(
      DistrictSelected event, Emitter<AddEditAddressState> emit) {
    emit(state.copyWith(district: event.id));
  }

  FutureOr<void> _addressChanged(
      AddressChanged event, Emitter<AddEditAddressState> emit) {
    emit(state.copyWith(address: event.address));
  }

  FutureOr<void> _getUserAddress(
      GetUserAddress event, Emitter<AddEditAddressState> emit) {
    if (event.address != null) {
      final address = event.address!;
      emit(state.copyWith(
          id: address.id,
          addressTitle: address.title,
          name: address.name,
          phone: address.mobile,
          email: address.email ?? "",
          division: address.divisionId ?? -1,
          district: address.districtId ?? -1,
          address: address.address1,
          userAddress: event.address));

      add(DivisionSelected(
          id: address.divisionId ?? -1, districtId: address.districtId));
    }
  }

  Future<FutureOr<void>> _update(
      Update event, Emitter<AddEditAddressState> emit) async {
    if (!state.loading &&
        Validator.isValidated(items: [
          FormItem(
              text: state.addressTitle, focusNode: event.addressTitleFocusNode),
          FormItem(text: state.name, focusNode: event.nameFocusNode),
          FormItem(text: state.phone, focusNode: event.phoneFocusNode),
          FormItem(text: state.address, focusNode: event.addressFocusNode)
        ], navigator: _iFlutterNavigator) &&
        state.division != -1 &&
        state.district != -1) {
      emit(state.copyWith(loading: true));

      final update = await _apiRepo.post<AddressResponse>(
          endpoint: state.id != -1 ? updateAddress : addAddress,
          body: state.id != -1
              ? UpdateAddressModel(
                  id: state.id != -1 ? state.id : null,
                  address1: state.address,
                  districtId: state.district,
                  divisionId: state.division,
                  mobile: state.phone,
                  name: state.name,
                  title: state.addressTitle,
                  email: state.email)
              : AddAddressModel(
                  address1: state.address,
                  districtId: state.district,
                  divisionId: state.division,
                  mobile: state.phone,
                  name: state.name,
                  title: state.addressTitle,
                  email: state.email));

      if (update != null) {
        ShowSnackBar(
            message: update.responseMessage!, navigator: _iFlutterNavigator);
        _iFlutterNavigator.pop();
      }

      emit(state.copyWith(loading: false));
    } else {
      emit(state.copyWith(forms: Forms.invalid));
    }
  }

  FutureOr<void> _added(Added event, Emitter<AddEditAddressState> emit) {
    emit(state.copyWith(added: true));
  }
}
