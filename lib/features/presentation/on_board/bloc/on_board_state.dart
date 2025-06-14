part of 'on_board_bloc.dart';

class OnBoardState extends Equatable {
  const OnBoardState({this.isSplash = false, this.currentScreen = 0});

  final int currentScreen;
  final bool isSplash;
  OnBoardState copyWith({bool? isSplash, int? currentScreen}) {
    return OnBoardState(
        isSplash: isSplash ?? this.isSplash,
        currentScreen: currentScreen ?? this.currentScreen);
  }

  @override
  List<Object> get props => [currentScreen, isSplash];
}

class OnBoardInitial extends OnBoardState {}
