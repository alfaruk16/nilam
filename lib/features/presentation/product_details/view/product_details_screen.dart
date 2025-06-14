
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/button.dart';
import 'package:nilam/core/widgets/check_box.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/entities/product_details_response.dart';
import 'package:nilam/features/domain/entities/product_response.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/home/widgets/cart.dart';
import 'package:nilam/features/presentation/home/widgets/products.dart';
import 'package:nilam/features/presentation/product_details/bloc/product_details_bloc.dart';
import 'package:nilam/features/presentation/product_details/widgets/auction.dart';
import 'package:nilam/features/presentation/product_details/widgets/images.dart';
import 'package:nilam/features/presentation/product_details/widgets/price.dart';
import 'package:nilam/features/presentation/product_details/widgets/quantity_buttons.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  static Route<dynamic> route({required Product product}) =>
      MaterialPageRoute<dynamic>(
        builder: (_) => ProductDetailsScreen(product: product),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductDetailsBloc(getIt<ApiRepo>(),
            getIt<IFlutterNavigator>(), getIt<LocalStorageRepo>())
          ..add(GetProduct(product: product)),
        child: ProductsDetailsView());
  }
}

class ProductsDetailsView extends StatelessWidget {
  ProductsDetailsView({super.key});

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = context.read<ProductDetailsBloc>();

    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        return Body(
          child: Column(
            children: [
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: TextB(
                      text: state.product.itemName ?? '',
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
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
              state.productDetails.id != null
                  ? Expanded(
                      child: ListView(
                      padding: EdgeInsets.zero,
                      controller: _controller,
                      children: [
                        if (state.productDetails.documents != null)
                          SliderDetailsB(
                              slideItems: state.productDetails.documents!),
                        if (state.productDetails.cartQuantity! > 0)
                          Container(
                            padding: const EdgeInsets.only(right: 15),
                            alignment: Alignment.centerRight,
                            child: const TextB(
                              text: "Already added to cart",
                              fontColor: Colors.green,
                            ),
                          ),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Price(productDetails: state.productDetails),
                                  const Spacer(),
                                  QuantityButtons(
                                    productDetails: state.productDetails,
                                    increase: () {
                                      bloc.add(IncreaseItem());
                                    },
                                    decrease: () {
                                      bloc.add(DecreaseItem());
                                    },
                                    quantity: state.quantity,
                                  )
                                ],
                              ),
                              TextB(text: state.productDetails.categoryName!),
                              TextB(
                                  text:
                                      "Condition: ${state.productDetails.condition!}"),
                              TextB(
                                  text:
                                      "Stock Type: ${state.productDetails.stockType!}"),
                              TextB(
                                  text:
                                      "Availability: ${state.productDetails.stockQuantity!} ${state.productDetails.measurementName}"),
                              const SizedBox(height: 10),
                              if (state.productDetails.isEmi!)
                                CheckboxB(
                                    label:
                                        "Avail For EMI (কার্ড অথবা কার্ড বিহীন সহজ কিস্তি)",
                                    press: (value) {
                                      bloc.add(IsEmi(isEmi: value));
                                    },
                                    defaultValue: state.isEmi),
                              if (state.productDetails.saleType ==
                                  SaleType.Auction.name)
                                Auction(productDetails: state.productDetails),
                              const SizedBox(height: 10),
                              const TextB(
                                  text: "Seller information",
                                  fontSize: 16,
                                  fontColor: Colors.black),
                              GestureDetector(
                                onTap: () {},
                                child: TextB(
                                    text:
                                        state.productDetails.companyName ?? "",
                                    fontColor: buttonColor,
                                    fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              TextB(
                                  text:
                                      "${state.productDetails.noOfReview} reviews"),
                              const SizedBox(height: 10),
                              const TextB(
                                text: "Product Summery",
                                fontSize: 18,
                                fontColor: Colors.black,
                              ),
                              TextB(text: state.productDetails.summary ?? ''),
                              if (state.productDetails.description != null)
                                Html(data: state.productDetails.description),
                            ],
                          ),
                        ),
                        if (state.relatedProduct.isNotEmpty)
                          ProductsB(
                            products: state.relatedProduct,
                            goToDetails: (product) {
                              bloc.add(GetProduct(product: product));
                              _controller.animateTo(0,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn);
                            },
                            addToFavorite: () {},
                          )
                      ],
                    ))
                  : Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator())),
              if (state.productDetails.id != null)
                Row(
                  children: [
                    ButtonB(
                        text: "Buy Now",
                        press: () {
                          bloc.add(BuyNow());
                        },
                        width: size.width /
                            getSize(state.productDetails, state.isEmi),
                        bgColor: nDark),
                    if (state.productDetails.saleType == SaleType.Bargain.name)
                      ButtonB(
                          text: "Bargain",
                          press: () {
                            bloc.add(GoToBargain());
                          },
                          width: size.width /
                              getSize(state.productDetails, state.isEmi),
                          bgColor: Colors.cyan),
                    if (state.productDetails.saleType ==
                            SaleType.Auction.name &&
                        state.productDetails.auctionStatus == "Bidding")
                      ButtonB(
                          text: "Bid",
                          press: () {
                            bloc.add(GoToBid());
                          },
                          width: size.width /
                              getSize(state.productDetails, state.isEmi),
                          bgColor: Colors.teal),
                    if ((state.productDetails.hasAddToCart ?? false) &&
                        !state.isEmi)
                      ButtonB(
                          text: "Add To Cart",
                          loading: state.addLoading,
                          press: () {
                            bloc.add(AddToCart(product: state.productDetails));
                          },
                          width: size.width /
                              getSize(state.productDetails, state.isEmi)),
                  ],
                )
            ],
          ),
        );
      },
    );
  }

  num getSize(ProductDetails productDetails, bool isEmi) {
    if (productDetails.saleType == SaleType.Bargain.name && !isEmi) {
      return 3;
    } else if ((productDetails.saleType == SaleType.Auction.name &&
            productDetails.auctionStatus != "Bidding") ||
        isEmi) {
      return 1;
    }
    return 2;
  }
}
