import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/my_bargains/bloc/my_bargains_bloc.dart';
import 'package:nilam/features/presentation/my_bargains/widgets/bargain_item_view.dart';

class MyBargainsScreen extends StatelessWidget {
  const MyBargainsScreen({super.key});

  static Route<dynamic> route() =>
      MaterialPageRoute<dynamic>(builder: (_) => const MyBargainsScreen());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MyBargainsBloc(getIt<ApiRepo>(),
            getIt<IFlutterNavigator>(), getIt<LocalStorageRepo>()),
        child: const MyBargainsView());
  }
}

class MyBargainsView extends StatelessWidget {
  const MyBargainsView({super.key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final bloc = context.read<MyBargainsBloc>();

    return BlocBuilder<MyBargainsBloc, MyBargainsState>(
      builder: (context, state) {
        return Body(
          horizontalPadding: 0,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 60,
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(width: 10),
                    const TextB(
                      text: "My Bargains",
                      fontSize: 18,
                      fontColor: Colors.black,
                    ),
                    const Spacer(),
                    const SizedBox(width: 15)
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                  child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(height: 20),
                    state.bargainResponse.data != null
                        ? ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: state.bargainResponse.data!.length,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return BargainItemView(
                                bargainItem: state.bargainResponse.data![index],
                                goToBargain: (item) {
                                  bloc.add(GoToBargain(bargainItem: item));
                                },
                              );
                            })
                        : state.loading
                            ? Container(
                      alignment: Alignment.center,
                        child: const CircularProgressIndicator())
                            : const SizedBox()
                  ],
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}
