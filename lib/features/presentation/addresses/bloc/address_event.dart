part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class GetAddress extends AddressEvent {}

class GetCurrentAddress extends AddressEvent {}

class GoToAddEditAddress extends AddressEvent {
  const GoToAddEditAddress({this.userAddress});
  final UserAddress? userAddress;
}

class MarkAsDefault extends AddressEvent{
  const MarkAsDefault({required this.id});
  final String id;
}
