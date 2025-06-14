part of 'add_edit_address_bloc.dart';

abstract class AddEditAddressEvent extends Equatable {
  const AddEditAddressEvent();

  @override
  List<Object> get props => [];
}

class GetUserAddress extends AddEditAddressEvent {
  const GetUserAddress({required this.address});
  final UserAddress? address;
}

class GetDivision extends AddEditAddressEvent {}

class GetDistrict extends AddEditAddressEvent {}

class DivisionSelected extends AddEditAddressEvent {
  const DivisionSelected({required this.id, this.districtId});
  final int id;
  final int? districtId;
}

class DistrictSelected extends AddEditAddressEvent {
  const DistrictSelected({required this.id});
  final int id;
}

class FirstNameChanged extends AddEditAddressEvent {
  const FirstNameChanged({required this.firstName});
  final String firstName;
}

class LastNameChanged extends AddEditAddressEvent {
  const LastNameChanged({required this.lastName});
  final String lastName;
}

class PhoneChanged extends AddEditAddressEvent {
  const PhoneChanged({required this.phone});
  final String phone;
}

class EmailChanged extends AddEditAddressEvent {
  const EmailChanged({required this.email});
  final String email;
}

class AddressChanged extends AddEditAddressEvent {
  const AddressChanged({required this.address});
  final String address;
}

class Update extends AddEditAddressEvent {
  const Update(
      {required this.addressTitleFocusNode,
      required this.nameFocusNode,
      required this.phoneFocusNode,
      required this.addressFocusNode});
  final FocusNode addressTitleFocusNode;
  final FocusNode nameFocusNode;
  final FocusNode phoneFocusNode;
  final FocusNode addressFocusNode;
}

class Added extends AddEditAddressEvent{}
