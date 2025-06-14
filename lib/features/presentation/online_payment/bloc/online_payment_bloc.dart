import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/features/domain/entities/profile.dart';

part 'online_payment_event.dart';
part 'online_payment_state.dart';

class OnlinePaymentBloc extends Bloc<OnlinePaymentEvent, OnlinePaymentState> {
  OnlinePaymentBloc(
      this._iFlutterNavigator)
      : super(const OnlinePaymentState()) {
    on<PopToCart>(_popToCart);
  }

  final IFlutterNavigator _iFlutterNavigator;

  FutureOr<void> _popToCart(PopToCart event, Emitter<OnlinePaymentState> emit) {
    _iFlutterNavigator.pop(event.id);
  }
}
