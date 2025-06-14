import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/bottom_nav_bar.dart';
import 'package:nilam/features/presentation/categories/view/categories_screen.dart';
import 'package:nilam/features/presentation/home/view/home.dart';
import 'package:nilam/features/presentation/on_board/bloc/on_board_bloc.dart';
import 'package:nilam/features/presentation/products/view/products_screen.dart';
import 'package:nilam/features/presentation/profile/view/profile_screen.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});
  static Route<dynamic> route() => MaterialPageRoute<dynamic>(
        builder: (_) => const OnBoardScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OnBoardBloc(getIt<IFlutterNavigator>()),
        child: OnBoardView());
  }
}

class OnBoardView extends StatelessWidget {
  OnBoardView({super.key});

  final screen = [
    const HomeScreen(),
    const CategoriesScreen(),
    const Text("Post add"),
    const ProductsScreen(
      link:
          'product/search?SortBy=PriorityDesc&Page=1&Length=32&SaleType=Auction',
    ),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final bloc = context.read<OnBoardBloc>();
    return BlocBuilder<OnBoardBloc, OnBoardState>(
      builder: (context, state) {
        return Body(
          bottomNav: BottomNavBar(
            getScreenIndex: (int screenIndex) {
              bloc.add(
                ScreenChanged(index: screenIndex, context: context),
              );
            },
          ),
          child: screen[state.currentScreen],
        );
      },
    );
  }
}
