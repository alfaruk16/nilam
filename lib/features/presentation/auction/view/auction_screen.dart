import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/button.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/core/widgets/text_field.dart';
import 'package:nilam/features/domain/entities/bid_info_response.dart';
import 'package:nilam/features/domain/entities/product_details_response.dart';
import 'package:nilam/features/domain/entities/profile.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/presentation/auction/bloc/auction_bloc.dart';
import 'package:nilam/features/presentation/auction/widgets/auction_info.dart';

class AuctionScreen extends StatelessWidget {
  const AuctionScreen({super.key, required this.product, required this.isEmi});

  final ProductDetails product;
  final bool isEmi;

  static Route<dynamic> route(
          {required ProductDetails product, required bool isEmi}) =>
      MaterialPageRoute<dynamic>(
        builder: (_) => AuctionScreen(product: product, isEmi: isEmi),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            AuctionBloc(getIt<ApiRepo>(), getIt<IFlutterNavigator>())
              ..add(GetProduct(product: product, isEmi: isEmi)),
        child: AuctionView());
  }
}

class AuctionView extends StatelessWidget {
  AuctionView({super.key});

  final ScrollController _controller = ScrollController();
  final bidFocusNode = FocusNode();
  final bidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = context.read<AuctionBloc>();

    return BlocBuilder<AuctionBloc, AuctionState>(
      builder: (context, state) {
        return Body(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
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
                    Expanded(
                        child: TextB(
                      text: state.productDetails.itemName ?? '',
                      fontColor: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
              AuctionInfo(
                productDetails: state.productDetails,
                buyNow: () {
                  bloc.add(BuyNow(
                      amount: state.productDetails.salesPrice!.toDouble()));
                },
                autoBid: () {
                  bloc.add(ShowAutoBid(context: context));
                },
              ),
              const Divider(height: 1),
              state.productDetails.id != null
                  ? Expanded(
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          child: state.bidResponse.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.bidResponse.length,
                                  controller: _controller,
                                  padding: EdgeInsets.zero,
                                  physics: const ClampingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return userMessage(state.bidResponse[index],
                                        state.profile, index);
                                  })
                              : const SizedBox()))
                  : Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator())),
              if (state.productDetails.id != null)
                Row(
                  children: [
                    Expanded(
                        child: TextFieldB(
                            textInputType: TextInputType.number,
                            hintText: "Bid Amount",
                            focusNode: bidFocusNode,
                            controller: bidController,
                            onTouch: () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 400));
                              bloc.add(ScrollToTop(controller: _controller));
                            },
                            onChanged: (text) {
                              bloc.add(BidChanged(text: text));
                            })),
                    ButtonB(
                        width: size.width / 4,
                        text: "Bid",
                        press: () {
                          bloc.add(ApplyBid(
                              bidController: bidController,
                              controller: _controller));
                        })
                  ],
                )
            ],
          ),
        );
      },
    );
  }
}

Widget userMessage(BidInfoResponse bid, Profile profile, int font) {
  final isOwn = profile.displayId == bid.userName;
  final addFont = font < 10 ? (10 - font).toDouble() : 0.toDouble();
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.person,
              color: Colors.blue,
              size: 36,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextB(
                  text: isOwn
                      ? "${profile.firstName!} ${profile.lastName!}"
                      : bid.userName!,
                  fontColor: isOwn ? buttonColor : Colors.black,
                  alignMent: TextAlign.end,
                ),
                TextB(
                  text: bid.createdAtFormated!,
                  fontSize: 12,
                  fontColor: Colors.black.withOpacity(.5),
                )
              ],
            ),
            const Spacer(),
            TextB(
              text: "৳${bid.bidAmount}",
              fontWeight: FontWeight.bold,
              fontColor: Colors.black,
              fontSize: 14 + addFont,
            )
          ],
        )
      ],
    ),
  );
}
