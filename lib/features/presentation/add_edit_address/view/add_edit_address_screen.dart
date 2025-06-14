import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/button.dart';
import 'package:nilam/core/widgets/dropdown_search.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/core/widgets/text_field.dart';
import 'package:nilam/features/domain/entities/user_address.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/presentation/add_edit_address/bloc/add_edit_address_bloc.dart';

class AddEditAddressScreen extends StatelessWidget {
  const AddEditAddressScreen({super.key, this.address});

  final UserAddress? address;

  static Route<dynamic> route({UserAddress? address}) =>
      MaterialPageRoute<dynamic>(
        builder: (_) => AddEditAddressScreen(address: address),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddEditAddressBloc(getIt<ApiRepo>(),
            getIt<IFlutterNavigator>())
          ..add(GetUserAddress(address: address)),
        child: AddEditAddressView());
  }
}

class AddEditAddressView extends StatelessWidget {
  AddEditAddressView({super.key});

  final addressTitleController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final addressTitleFocusNode = FocusNode();
  final nameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final addressFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AddEditAddressBloc>();

    return BlocBuilder<AddEditAddressBloc, AddEditAddressState>(
      builder: (context, state) {
        if (state.userAddress.id != null && !state.added) {
          addressTitleController.text = state.userAddress.title ?? '';
          nameController.text = state.userAddress.name ?? '';
          phoneController.text = state.userAddress.mobile ?? '';
          emailController.text = state.userAddress.email ?? '';
          addressController.text = state.userAddress.address1 ?? '';
          bloc.add(Added());
        }

        return Body(
          horizontalPadding: 0,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                    const Expanded(
                        child: TextB(
                            text: "Address",
                            fontSize: 20,
                            fontColor: Colors.black)),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(height: 10),
                    TextFieldB(
                      focusNode: addressTitleFocusNode,
                      labelText: "Address Title",
                      controller: addressTitleController,
                      onChanged: (text) {
                        bloc.add(FirstNameChanged(firstName: text));
                      },
                      errorText: state.forms == Forms.invalid &&
                              state.addressTitle.isEmpty
                          ? "Enter Address Title"
                          : "",
                    ),
                    const SizedBox(height: 10),
                    TextFieldB(
                      focusNode: nameFocusNode,
                      controller: nameController,
                      labelText: "Name",
                      onChanged: (text) {
                        bloc.add(LastNameChanged(lastName: text));
                      },
                      errorText:
                          state.forms == Forms.invalid && state.name.isEmpty
                              ? "Enter Name"
                              : "",
                    ),
                    const SizedBox(height: 10),
                    TextFieldB(
                      focusNode: phoneFocusNode,
                      labelText: "Phone",
                      controller: phoneController,
                      textInputType: TextInputType.number,
                      onChanged: (text) {
                        bloc.add(PhoneChanged(phone: text));
                      },
                      errorText:
                          state.forms == Forms.invalid && state.phone.isEmpty
                              ? "Enter Phone Number"
                              : "",
                    ),
                    const SizedBox(height: 10),
                    TextFieldB(
                        focusNode: emailFocusNode,
                        controller: emailController,
                        labelText: "Email (optional)",
                        onChanged: (text) {
                          bloc.add(EmailChanged(email: text));
                        }),
                    const SizedBox(height: 10),
                    DropdownSearchB(
                      items: state.divisionList,
                      dropDownValue: state.division,
                      selected: (int id) {
                        bloc.add(DivisionSelected(id: id));
                      },
                      hint: "Select Division",
                      errorText:
                          state.forms == Forms.invalid && state.division == -1
                              ? "Select Division"
                              : "",
                    ),
                    const SizedBox(height: 10),
                    DropdownSearchB(
                      items: state.districtList,
                      dropDownValue: state.district,
                      selected: (int id) {
                        bloc.add(DistrictSelected(id: id));
                      },
                      hint: "Select District",
                      errorText:
                          state.forms == Forms.invalid && state.district == -1
                              ? "Select District"
                              : "",
                    ),
                    const SizedBox(height: 10),
                    TextFieldB(
                      focusNode: addressFocusNode,
                      labelText: "Address",
                      controller: addressController,
                      onChanged: (text) {
                        bloc.add(AddressChanged(address: text));
                      },
                      errorText:
                          state.forms == Forms.invalid && state.address.isEmpty
                              ? "Enter Address"
                              : "",
                    ),
                    const SizedBox(height: 20),
                    ButtonB(
                      text: state.userAddress.id != null ? "Update" : "Add",
                      loading: state.loading,
                      press: () {
                        bloc.add(Update(
                          addressTitleFocusNode: addressTitleFocusNode,
                          nameFocusNode: nameFocusNode,
                          phoneFocusNode: phoneFocusNode,
                          addressFocusNode: addressFocusNode,
                        ));
                      },
                    ),
                    const SizedBox(height: 10),
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
