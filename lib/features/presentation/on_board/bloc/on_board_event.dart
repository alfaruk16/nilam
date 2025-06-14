part of 'on_board_bloc.dart';

abstract class OnBoardEvent extends Equatable {
  const OnBoardEvent();

  @override
  List<Object> get props => [];
}

class ScreenChanged extends OnBoardEvent {
  const ScreenChanged({required this.index, required this.context});
  final int index;
  final BuildContext context;
}

class GoToHomeScreen extends OnBoardEvent {}

class FadeSplash extends OnBoardEvent {}
