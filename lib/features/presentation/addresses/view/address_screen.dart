import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/button.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/addresses/bloc/address_bloc.dart';
import 'package:nilam/features/presentation/addresses/widgets/address_item.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  static Route<dynamic> route() => MaterialPageRoute<dynamic>(
        builder: (_) => const AddressScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddressBloc(getIt<ApiRepo>(),
            getIt<IFlutterNavigator>(), getIt<LocalStorageRepo>())
          ..add(GetAddress()),
        child: const AddressView());
  }
}

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final bloc = context.read<AddressBloc>();

    return BlocBuilder<AddressBloc, AddressState>(
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
                      text: "Addresses",
                      fontSize: 18,
                      fontColor: Colors.black,
                    ),
                    const Spacer(),
                    ButtonB(
                        width: 60,
                        height: 30,
                        text: "Add",
                        press: () {
                          bloc.add(const GoToAddEditAddress());
                        }),
                    const SizedBox(width: 15)
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                  child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(20),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.addressList.length,
                        padding: EdgeInsets.zero,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return AddressItemView(
                              userAddress: state.addressList[index],
                              edit: (user) {
                                bloc.add(GoToAddEditAddress(userAddress: user));
                              }, markAsDefault: (id){
                                bloc.add(MarkAsDefault(id: id));
                          },);
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
