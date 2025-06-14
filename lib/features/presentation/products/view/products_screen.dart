import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/text_field.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/home/widgets/cart.dart';
import 'package:nilam/features/presentation/home/widgets/products.dart';
import 'package:nilam/features/presentation/products/bloc/products_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.link});

  final String link;

  static Route<dynamic> route({required String link, int? parentCategoryId}) =>
      MaterialPageRoute<dynamic>(
        builder: (_) => ProductsScreen(link: link),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductsBloc(getIt<ApiRepo>(),
            getIt<IFlutterNavigator>(), getIt<LocalStorageRepo>())
          ..add(GetLink(link: link)),
        child: ProductsView(link: link));
  }
}

class ProductsView extends StatelessWidget {
  ProductsView({super.key, required this.link});
  final String link;
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final bloc = context.read<ProductsBloc>();
    if (link.isEmpty) {
      FocusScope.of(context).requestFocus(searchFocusNode);
    }

    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return Body(
          horizontalPadding: 0,
          isFullScreen: Navigator.canPop(context) ? false : true,
          child: Column(
            children: [
              const SizedBox(height: 15),
              Row(
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
                  Expanded(
                      child: TextFieldB(
                    focusNode: searchFocusNode,
                    onChanged: (text) {
                      bloc.add(SearchProduct(text: text, customSearch: true));
                    },
                    hintText: "Search",
                    prefixIcon: Icons.search_rounded,
                  )),
                  CartB(
                      cartResponse: state.cartResponse,
                      goToCart: () {
                        bloc.add(GoToCart());
                      }),
                  const SizedBox(width: 15),
                ],
              ),
              !state.loading
                  ? Expanded(
                      child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        ProductsB(
                          products: state.customSearchResponse.data ??
                              state.searchResponse.data ??
                              [],
                          goToDetails: (product) {
                            bloc.add(GoToDetails(product: product));
                          },
                          addToFavorite: () {},
                        )
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
