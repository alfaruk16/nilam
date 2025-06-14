import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/orders/bloc/order_bloc.dart';
import 'package:nilam/features/presentation/orders/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  static Route<dynamic> route() =>
      MaterialPageRoute<dynamic>(builder: (_) => const OrderScreen());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OrderBloc(getIt<ApiRepo>(),
            getIt<IFlutterNavigator>(), getIt<LocalStorageRepo>()),
        child: const OrderView());
  }
}

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final bloc = context.read<OrderBloc>();

    return BlocBuilder<OrderBloc, OrderState>(
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
                      text: "My Orders",
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
                    if (state.orderResponse.data != null)
                      ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: state.orderResponse.data!.length,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return OrderItemView(
                              orderItem: state.orderResponse.data![index],
                              details: (id) {
                                bloc.add(GoToDetails(id: id));
                              },
                              cancel: (id) {
                                bloc.add(CancelOrder(id: id, context: context));
                              },
                            );
                          })
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
