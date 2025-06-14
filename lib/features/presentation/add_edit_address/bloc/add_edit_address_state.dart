part of 'add_edit_address_bloc.dart';

class AddEditAddressState extends Equatable {
  const AddEditAddressState(
      {this.loading = false,
      this.id = -1,
      this.addressTitle = "",
      this.name = "",
      this.email = "",
      this.phone = "",
      this.division = -1,
      this.district = -1,
      this.address = "",
      this.forms = Forms.initial,
      this.divisionList = const [],
      this.districtList = const [],
      this.userAddress = const UserAddress(),
      this.added = false});

  final bool loading;
  final int id;
  final String addressTitle;
  final String name;
  final String phone;
  final String email;
  final int division;
  final int district;
  final String address;
  final Forms forms;
  final List<DropdownItem> divisionList;
  final List<DropdownItem> districtList;
  final UserAddress userAddress;
  final bool added;

  AddEditAddressState copyWith(
      {bool? loading,
      int? id,
      String? addressTitle,
      String? name,
      String? phone,
      String? email,
      int? division,
      int? district,
      String? address,
      Forms? forms,
      List<DropdownItem>? divisionList,
      List<DropdownItem>? districtList,
      UserAddress? userAddress,
      bool? added}) {
    return AddEditAddressState(
        loading: loading ?? this.loading,
        id: id ?? this.id,
        addressTitle: addressTitle ?? this.addressTitle,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        division: division ?? this.division,
        district: district ?? this.district,
        address: address ?? this.address,
        forms: forms ?? this.forms,
        divisionList: divisionList ?? this.divisionList,
        districtList: districtList ?? this.districtList,
        userAddress: userAddress ?? this.userAddress,
        added: added ?? this.added);
  }

  @override
  List<Object> get props => [
        loading,
        id,
        addressTitle,
        name,
        phone,
        email,
        division,
        district,
        address,
        forms,
        divisionList,
        districtList,
        userAddress,
        added
      ];
}

class OnBoardInitial extends AddEditAddressState {}
