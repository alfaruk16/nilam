import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/core/utils/utilities.dart';
import 'package:nilam/core/widgets/text_field.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/home/bloc/home_bloc.dart';
import 'package:nilam/features/presentation/home/widgets/banner.dart';
import 'package:nilam/features/presentation/home/widgets/brands.dart';
import 'package:nilam/features/presentation/home/widgets/cart.dart';
import 'package:nilam/features/presentation/home/widgets/categories.dart';
import 'package:nilam/features/presentation/home/widgets/high_lights.dart';
import 'package:nilam/features/presentation/home/widgets/hot_buttons.dart';
import 'package:nilam/features/presentation/home/widgets/products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() => MaterialPageRoute<dynamic>(
        builder: (_) => const HomeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(getIt<ApiRepo>(), getIt<LocalStorageRepo>(),
          getIt<IFlutterNavigator>()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final bloc = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                      child: TextFieldB(
                    focusNode: FocusNode(),
                    onChanged: () {},
                    onTouch: () {
                      bloc.add(const GoToSearch(link: ""));
                    },
                    prefixIcon: Icons.search_rounded,
                    hintText: "search",
                    isReadOnly: true,
                  )),
                  CartB(
                      cartResponse: state.cartResponse,
                      goToCart: () {
                        bloc.add(GotoCart());
                      })
                ],
              ),
            ),
            Expanded(
                child: state.blockDetailsList.isNotEmpty &&
                        state.blockDetailsList[0].blockDetails != null
                    ? ListView.builder(
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: state.blockDetailsList.length,
                        itemBuilder: (context, index) {
                          if (state.blockDetailsList[index].blockDetails !=
                              null) {
                            final type =
                                state.blockDetailsList[index].block.sectionType;
                            final block = state.blockDetailsList[index].block;
                            final details =
                                state.blockDetailsList[index].blockDetails;
                            if (type == SectionType.Banners.name) {
                              return BannerB(
                                block: block,
                                banners: isEndsWithNumeric(block.apiLink!)
                                    ? [details]
                                    : details,
                                goToSearch: (String link) {
                                  bloc.add(GoToSearch(link: link));
                                },
                              );
                            } else if (type == SectionType.HotButtons.name) {
                              return HotButtonsB(
                                  block: block,
                                  hotButtons: details,
                                  goToSearch: (String link) {
                                    bloc.add(GoToSearch(link: link));
                                  });
                            } else if (type == SectionType.Highlights.name) {
                              return HighlightsB(
                                  block: block,
                                  highlights: details,
                                  goToSearch: (String link) {
                                    bloc.add(GoToSearch(link: link));
                                  });
                            } else if (type == SectionType.Brands.name) {
                              return BrandB(
                                  block: block,
                                  brands: details,
                                  goToSearch: (String link) {
                                    bloc.add(GoToSearch(link: link));
                                  });
                            } else if (type == SectionType.Categories.name) {
                              return CategoryB(
                                  block: block,
                                  categories: details,
                                  goToSearch: (String link) {
                                    bloc.add(GoToSearch(link: link));
                                  });
                            } else if (type == SectionType.Products.name) {
                              return ProductsB(
                                block: block,
                                products: details,
                                goToDetails: (product) {
                                  bloc.add(GoToDetails(product: product));
                                },
                                goToSearch: (String link) {
                                  bloc.add(GoToSearch(link: link));
                                },
                                addToFavorite: () {},
                              );
                            }
                          }
                          return const SizedBox();
                        })
                    : Container(
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator()))
          ],
        );
      },
    );
  }
}
