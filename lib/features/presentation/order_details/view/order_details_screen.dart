import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/presentation/order_details/bloc/order_details_bloc.dart';
import 'package:nilam/features/presentation/order_details/widgets/details.dart';
import 'package:nilam/features/presentation/order_details/widgets/package_info.dart';
import 'package:nilam/features/presentation/order_details/widgets/shipping_address.dart';
import 'package:nilam/features/presentation/order_details/widgets/summery.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.id});

  final int id;

  static Route<dynamic> route({required int id}) =>
      MaterialPageRoute<dynamic>(builder: (_) => OrderDetailsScreen(id: id));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            OrderDetailsBloc(getIt<ApiRepo>(), getIt<IFlutterNavigator>())
              ..add(GetOrder(id: id)),
        child: const OrderDetailsView());
  }
}

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final bloc = context.read<OrderDetailsBloc>();

    return BlocBuilder<OrderDetailsBloc, OrderDetailsState>(
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
                      text: "Order Details",
                      fontSize: 18,
                      fontColor: Colors.black,
                    ),
                    const Spacer(),
                    const SizedBox(width: 15)
                  ],
                ),
              ),
              const Divider(height: 1),
              state.orderDetailsResponse.order != null
                  ? Expanded(
                      child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          const SizedBox(height: 20),
                          OrderView(
                            order: state.orderDetailsResponse.order!,
                            cancel: () {
                              bloc.add(
                                  CancelOrder(id: state.id, context: context));
                            },
                          ),
                          const SizedBox(height: 10),
                          ListView.builder(
                              itemCount: state
                                  .orderDetailsResponse.orderPackages!.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return PackageInfo(
                                    packageInfo: state.orderDetailsResponse
                                        .orderPackages![index]);
                              }),
                          const SizedBox(height: 20),
                          Summery(
                            order: state.orderDetailsResponse.order!,
                            payNow: () {
                              bloc.add(PayNow());
                            },
                            loading: state.loading,
                          ),
                          const SizedBox(height: 20),
                          ShippingAddress(
                              order: state.orderDetailsResponse.order!),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ))
                  : Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
