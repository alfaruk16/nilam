import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';

import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/button.dart';
import 'package:nilam/core/widgets/network_image.dart';

import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/core/widgets/text_field.dart';
import 'package:nilam/features/data/data_sources/config.dart';
import 'package:nilam/features/domain/entities/bargain_info.dart';
import 'package:nilam/features/domain/entities/product_details_response.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/presentation/bargain/bloc/bargain_bloc.dart';
import 'package:nilam/features/presentation/product_details/widgets/price.dart';
import 'package:nilam/features/presentation/product_details/widgets/quantity_buttons.dart';

class BargainScreen extends StatelessWidget {
  const BargainScreen({super.key, required this.product, required this.isEmi});

  final ProductDetails product;
  final bool isEmi;

  static Route<dynamic> route(
          {required ProductDetails product, required bool isEmi}) =>
      MaterialPageRoute<dynamic>(
        builder: (_) => BargainScreen(product: product, isEmi: isEmi),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BargainBloc(getIt<ApiRepo>(),
            getIt<IFlutterNavigator>())
          ..add(GetProduct(product: product, isEmi: isEmi)),
        child: BargainView());
  }
}

class BargainView extends StatelessWidget {
  BargainView({super.key});

  final ScrollController _controller = ScrollController();
  final bargainFocusNode = FocusNode();
  final bargainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = context.read<BargainBloc>();

    return BlocBuilder<BargainBloc, BargainState>(
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
                    const SizedBox(width: 15),
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
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (state.productDetails.id != null)
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: NetworkImageB(
                            imageUrl:
                                "$baseUrl${state.productDetails.documents![0].localPath!}/${state.productDetails.documents![0].uuid!}"),
                      ),
                    const SizedBox(width: 10),
                    if (state.productDetails.id != null)
                      Column(
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
                          ),
                        ],
                      ),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          bloc.add(CancelBargain());
                        },
                        child: const TextB(
                            text: "Cancel Bargain", fontColor: Colors.red))
                  ],
                ),
              ),
              if (state.bargainInfoResponse.selected != null &&
                  state.bargainInfoResponse.selected!.bargainLimitMessage !=
                      null)
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 15, bottom: 5),
                  color: Colors.white,
                  child: TextB(
                      text: state
                          .bargainInfoResponse.selected!.bargainLimitMessage!,
                      fontColor: Colors.blue),
                ),
              const Divider(
                height: 1,
              ),
              const SizedBox(height: 10),
              state.productDetails.id != null
                  ? Expanded(
                      child: Container(
                          alignment: Alignment.bottomCenter,
                          child: state.bargainInfoResponse.details != null
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      state.bargainInfoResponse.details!.length,
                                  controller: _controller,
                                  physics: const ClampingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return index % 2 == 0
                                        ? userMessage(state.bargainInfoResponse
                                            .details![index])
                                        : sellerMessage(
                                            state.bargainInfoResponse
                                                .details![index],
                                            state.loading,
                                            index ==
                                                state.bargainInfoResponse
                                                        .details!.length -
                                                    1, (amount) {
                                            bloc.add(BuyNow(amount: amount));
                                          });
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
                            hintText: "Bargain Amount",
                            focusNode: bargainFocusNode,
                            controller: bargainController,
                            onTouch: () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 400));
                              bloc.add(ScrollToBottom(controller: _controller));
                            },
                            onChanged: (text) {
                              bloc.add(BargainChanged(text: text));
                            })),
                    ButtonB(
                        width: size.width / 4,
                        text: "Bargain",
                        press: () {
                          bloc.add(ApplyBargain(
                              bargainController: bargainController,
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

Widget userMessage(Detail detail) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    margin: const EdgeInsets.only(left: 100),
    alignment: Alignment.centerRight,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextB(
              text:
                  DateFormat("dd-MMM-yyyy, hh:mm a").format(detail.bargainAt!),
              fontSize: 12,
              fontColor: Colors.black.withOpacity(.5),
            ),
            const TextB(
              text: " You",
              fontSize: 12,
            ),
          ],
        ),
        TextB(
          text: detail.message!,
          fontColor: Colors.black,
          alignMent: TextAlign.end,
        )
      ],
    ),
  );
}

Widget sellerMessage(
    Detail detail, bool loading, bool lastIndex, Function buyNow) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (loading && lastIndex)
                SpinKitThreeBounce(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.black54 : Colors.black38,
                      ),
                    );
                  },
                ),
              const TextB(
                text: "Seller ",
                fontSize: 12,
              ),
              TextB(
                text: DateFormat("dd-MMM-yyyy, hh:mm a")
                    .format(detail.bargainAt!),
                fontSize: 12,
                fontColor: Colors.black.withOpacity(.5),
              ),
            ],
          ),
          if (!loading)
            Row(
              children: [
                Expanded(
                    child: TextB(
                  text: detail.message!,
                  fontColor: Colors.black,
                )),
                if (lastIndex)
                  ButtonB(
                    width: 88,
                    height: 30,
                    text: "Accept",
                    press: () {
                      buyNow(detail.amount);
                    },
                    bgColor: Colors.black87,
                  )
              ],
            )
        ],
      ));
}
