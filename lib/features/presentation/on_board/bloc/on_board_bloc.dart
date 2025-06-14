import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/features/domain/usecases/local_data.dart';

part 'on_board_event.dart';
part 'on_board_state.dart';

class OnBoardBloc extends Bloc<OnBoardEvent, OnBoardState> {
  OnBoardBloc(this._iFlutterNavigator) : super(OnBoardInitial()) {
    on<GoToHomeScreen>(_goToHomeScreen);
    on<FadeSplash>(_fadeSplash);
    on<ScreenChanged>(_screenChanged);

    add(GoToHomeScreen());
  }

  final IFlutterNavigator _iFlutterNavigator;

  FutureOr<void> _goToHomeScreen(
      GoToHomeScreen event, Emitter<OnBoardState> emit) {
    Timer(const Duration(seconds: 2), () {
      add(FadeSplash());
    });
  }

  FutureOr<void> _fadeSplash(FadeSplash event, Emitter<OnBoardState> emit) {
    emit(state.copyWith(isSplash: false));
  }

  Future<FutureOr<void>> _screenChanged(
      ScreenChanged event, Emitter<OnBoardState> emit) async {
    if (event.index == 4) {
      if (await LocalData.isVerifiedUser(_iFlutterNavigator, callback: () {})) {
        emit(state.copyWith(currentScreen: event.index));
      }
    } else {
      emit(state.copyWith(currentScreen: event.index));
    }
  }

}
