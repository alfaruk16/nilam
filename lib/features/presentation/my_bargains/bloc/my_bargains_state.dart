part of 'my_bargains_bloc.dart';

class MyBargainsState extends Equatable {
  const MyBargainsState(
      {this.loading = false, this.bargainResponse = const MyBargainResponse()});

  final bool loading;
  final MyBargainResponse bargainResponse;

  MyBargainsState copyWith(
      {bool? loading, MyBargainResponse? bargainResponse}) {
    return MyBargainsState(
        loading: loading ?? this.loading,
        bargainResponse: bargainResponse ?? this.bargainResponse);
  }

  @override
  List<Object> get props => [loading, bargainResponse];
}

class OnBoardInitial extends MyBargainsState {}
