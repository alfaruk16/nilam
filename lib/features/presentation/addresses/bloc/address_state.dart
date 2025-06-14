part of 'address_bloc.dart';

class AddressState extends Equatable {
  const AddressState({this.loading = false, this.addressList = const []});

  final bool loading;
  final List<UserAddress> addressList;

  AddressState copyWith({bool? loading, List<UserAddress>? addressList}) {
    return AddressState(
        loading: loading ?? this.loading,
        addressList: addressList ?? this.addressList);
  }

  @override
  List<Object> get props => [loading, addressList];
}

class OnBoardInitial extends AddressState {}
