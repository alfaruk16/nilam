import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/all_blocks_response.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/categories/bloc/categories_bloc.dart';
import 'package:nilam/features/presentation/home/widgets/cart.dart';
import 'package:nilam/features/presentation/home/widgets/categories.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static Route<dynamic> route() => MaterialPageRoute<dynamic>(
        builder: (_) => const CategoriesScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoriesBloc(
            getIt<IFlutterNavigator>(), getIt<LocalStorageRepo>()),
        child: CategoriesView());
  }
}

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key});
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final bloc = context.read<CategoriesBloc>();

    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        return Body(
          horizontalPadding: 0,
          isFullScreen: Navigator.canPop(context) ? false : true,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    if (Navigator.canPop(context))
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios)),
                    const SizedBox(width: 5),
                    const Expanded(
                        child: TextB(
                      text: "Categories",
                      fontSize: 18,
                      fontColor: Colors.black,
                    )),
                    CartB(
                        cartResponse: state.cartResponse,
                        goToCart: () {
                          bloc.add(GoToCart());
                        }),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
              !state.loading
                  ? Expanded(
                      child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        CategoryB(
                            block: const BlockResponse(),
                            categories: state.categories,
                            grid: 3,
                            goToSearch: (link) {
                              bloc.add(GoToSearch(link: link));
                            })
                      ],
                    ))
                  : Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator()))
            ],
          ),
        );
      },
    );
  }
}
