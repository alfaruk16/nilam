import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/features/data/data_sources/local_keys.dart';
import 'package:nilam/features/data/data_sources/remote_constants.dart';
import 'package:nilam/features/data/model/order_model.dart';
import 'package:nilam/features/domain/entities/my_bargains_response.dart';
import 'package:nilam/features/domain/entities/product_response.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/product_details/view/product_details_screen.dart';

part 'my_bargains_event.dart';
part 'my_bargains_state.dart';

class MyBargainsBloc extends Bloc<MyBargainsEvent, MyBargainsState> {
  MyBargainsBloc(this._apiRepo, this._iFlutterNavigator, this._localStorageRepo)
      : super(const MyBargainsState()) {
    on<GetBargains>(_getBargains);
    on<CheckLocal>(_checkLocal);
    on<GoToBargain>(_goToDetails);

    add(CheckLocal());
    add(GetBargains());
  }

  final ApiRepo _apiRepo;
  final IFlutterNavigator _iFlutterNavigator;
  final LocalStorageRepo _localStorageRepo;

  Future<FutureOr<void>> _getBargains(
      GetBargains event, Emitter<MyBargainsState> emit) async {
    final bargains = await _apiRepo.post<MyBargainResponse>(
        endpoint: getMyBargainItem, body: OrderModel());
    if (bargains != null) {
      emit(state.copyWith(bargainResponse: bargains));
      _localStorageRepo.writeModel(key: bargainsDB, value: bargains);
    }
  }

  Future<FutureOr<void>> _checkLocal(
      CheckLocal event, Emitter<MyBargainsState> emit) async {
    final orders =
        await _localStorageRepo.readModel<MyBargainResponse>(key: bargainsDB);

    if (orders != null) {
      emit(state.copyWith(bargainResponse: orders));
    }
  }

  FutureOr<void> _goToDetails(
      GoToBargain event, Emitter<MyBargainsState> emit) {
    _iFlutterNavigator
        .push(ProductDetailsScreen.route(
            product: Product(
                id: event.bargainItem.itemId,
                itemName: event.bargainItem.itemName, slug: event.bargainItem.slug)))
        .then((value) => add(GetBargains()));
  }
}
