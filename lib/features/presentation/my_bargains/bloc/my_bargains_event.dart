part of 'my_bargains_bloc.dart';

abstract class MyBargainsEvent extends Equatable {
  const MyBargainsEvent();

  @override
  List<Object> get props => [];
}

class GetBargains extends MyBargainsEvent {}

class CheckLocal extends MyBargainsEvent {}

class GoToBargain extends MyBargainsEvent {
  const GoToBargain({required this.bargainItem});
  final BargainItem bargainItem;
}
