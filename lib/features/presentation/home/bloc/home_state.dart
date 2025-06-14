part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState(
      {this.siteSetting = const SiteSettingResponse(),
      this.itemGroupList = const [],
      this.allBlockList = const [],
      this.blockDetailsList = const [],
      this.cartResponse = const CartResponse()});

  final SiteSettingResponse siteSetting;
  final List<ItemGroupResponse> itemGroupList;
  final List<BlockResponse> allBlockList;
  final List<BlockItem> blockDetailsList;
  final CartResponse cartResponse;

  HomeState copyWith(
      {bool? isSplash,
      SiteSettingResponse? siteSetting,
      List<ItemGroupResponse>? itemGroupList,
      List<BlockResponse>? allBlockList,
      List<BlockItem>? blockDetailsList,
      CartResponse? cartResponse}) {
    return HomeState(
        siteSetting: siteSetting ?? this.siteSetting,
        itemGroupList: itemGroupList ?? this.itemGroupList,
        allBlockList: allBlockList ?? this.allBlockList,
        blockDetailsList: blockDetailsList ?? this.blockDetailsList,
        cartResponse: cartResponse ?? this.cartResponse);
  }

  @override
  List<Object> get props => [
        siteSetting,
        itemGroupList,
        allBlockList,
        blockDetailsList,
        cartResponse
      ];
}

class HomeInitial extends HomeState {}

class BlockItem {
  const BlockItem({required this.block, required this.blockDetails});
  final BlockResponse block;
  final dynamic blockDetails;
}
