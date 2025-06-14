part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetToken extends HomeEvent {}

class GetUser extends HomeEvent {}

class GetData extends HomeEvent {}

class GetSiteSetting extends HomeEvent {}

class GetItemGroup extends HomeEvent {}

class GetAllBlocks extends HomeEvent {}

class GetBanner extends HomeEvent {
  const GetBanner({required this.blockResponse, required this.index});
  final BlockResponse blockResponse;
  final int index;
}

class GetSingleBanner extends HomeEvent {
  const GetSingleBanner({required this.blockResponse, required this.index});
  final BlockResponse blockResponse;
  final int index;
}

class GetHotButton extends HomeEvent {
  const GetHotButton({required this.allBlockResponse, required this.index});
  final BlockResponse allBlockResponse;
  final int index;
}

class GetHighlight extends HomeEvent {
  const GetHighlight({required this.allBlockResponse, required this.index});
  final BlockResponse allBlockResponse;
  final int index;
}

class GetBrand extends HomeEvent {
  const GetBrand({required this.allBlockResponse, required this.index});
  final BlockResponse allBlockResponse;
  final int index;
}

class GetCategory extends HomeEvent {
  const GetCategory({required this.allBlockResponse, required this.index});
  final BlockResponse allBlockResponse;
  final int index;
}

class GetProduct extends HomeEvent {
  const GetProduct({required this.allBlockResponse, required this.index});
  final BlockResponse allBlockResponse;
  final int index;
}

class CheckLocal extends HomeEvent {}

class GoToSearch extends HomeEvent {
  const GoToSearch({required this.link});
  final String link;
}

class GoToDetails extends HomeEvent {
  const GoToDetails({required this.product});
  final Product product;
}

class GetCart extends HomeEvent {}

class GotoCart extends HomeEvent {}
