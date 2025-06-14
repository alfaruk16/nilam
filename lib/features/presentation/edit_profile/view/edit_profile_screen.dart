import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/utils/enums.dart';
import 'package:nilam/core/widgets/big_camera.dart';
import 'package:nilam/core/widgets/body.dart';
import 'package:nilam/core/widgets/button.dart';
import 'package:nilam/core/widgets/date_picker.dart';
import 'package:nilam/core/widgets/dropdown_field.dart';
import 'package:nilam/core/widgets/dropdown_search.dart';
import 'package:nilam/core/widgets/grid_view_file_image.dart';
import 'package:nilam/core/widgets/image_file.dart';
import 'package:nilam/core/widgets/network_image.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/core/widgets/text_field.dart';
import 'package:nilam/features/domain/entities/profile.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/presentation/edit_profile/bloc/edit_profile_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.profile});

  final Profile profile;

  static Route<dynamic> route({required Profile profile}) =>
      MaterialPageRoute<dynamic>(
        builder: (_) => EditProfileScreen(profile: profile),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => EditProfileBloc(
            getIt<ApiRepo>(), getIt<IFlutterNavigator>(), getIt<ImagePicker>())
          ..add(GetProfile(profile: profile)),
        child: EditProfileView());
  }
}

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final companyNameController = TextEditingController();
  final summeryController = TextEditingController();
  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final companyNameFocusNode = FocusNode();
  final summeryFocusNode = FocusNode();

  final dateController = TextEditingController();
  final dateFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = context.read<EditProfileBloc>();

    return BlocBuilder<EditProfileBloc, EditProfileState>(
      builder: (context, state) {
        if (state.profile.id != null && !state.added) {
          firstNameController.text = state.profile.firstName ?? "";
          lastNameController.text = state.profile.lastName ?? "";
          dateController.text = state.profile.dob != null
              ? DateFormat("yyyy-MM-dd")
                  .format(DateTime.parse(state.profile.dob!))
              : "";
          if (state.profile.company != null) {
            companyNameController.text =
                state.profile.company!.companyName ?? "";
            summeryController.text =
                state.profile.company!.companySummary ?? "";
            phoneController.text = state.profile.company!.contactNo ?? "";
            emailController.text = state.profile.company!.email ?? "";
          }
          bloc.add(Added());
        }

        return Body(
          horizontalPadding: 0,
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    const SizedBox(width: 5),
                    const TextB(
                      text: "Update Profile",
                      fontSize: 18,
                      fontColor: Colors.black,
                    )
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
                    SizedBox(
                        height: 150,
                        width: 150,
                        child: GestureDetector(
                          onTap: () {
                            bloc.add(PickImage());
                          },
                          child: state.images.isNotEmpty
                              ? ImageFileView(image: state.images[0].file.path)
                              : NetworkImageB(
                                  imageUrl:
                                      state.profile.profileImageUrl ?? ""),
                        )),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width / 2 - 30,
                          child: TextFieldB(
                            focusNode: firstNameFocusNode,
                            controller: firstNameController,
                            labelText: "First Name",
                            onChanged: (text) {
                              bloc.add(FirstNameChanged(firstName: text));
                            },
                            errorText: state.forms == Forms.invalid &&
                                    state.firstName.isEmpty
                                ? "Enter First Name"
                                : "",
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: size.width / 2 - 30,
                          child: TextFieldB(
                            focusNode: lastNameFocusNode,
                            controller: lastNameController,
                            labelText: "Last Name",
                            onChanged: (text) {
                              bloc.add(LastNameChanged(lastName: text));
                            },
                            errorText: state.forms == Forms.invalid &&
                                    state.lastName.isEmpty
                                ? "Enter Last Name"
                                : "",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFieldB(
                      controller: dateController,
                      onTouch: () {
                        datePicker(
                          context,
                          minDate: DateTime.now(),
                          date: (date) {
                            bloc.add(SelectDate(
                                date: date.toString(),
                                controller: dateController));
                          },
                        );
                      },
                      isReadOnly: true,
                      suffixIcon: const Icon(
                        Icons.date_range,
                        size: 30,
                        color: Colors.grey,
                      ),
                      fieldTitle: "Date of Birth",
                      hintText: 'yyyy-MM-dd',
                      focusNode: dateFocusNode,
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 10),
                    DropdownFieldB(
                        items: const [
                          DropdownItem(name: "Male", value: 1),
                          DropdownItem(name: "Female", value: 2),
                          DropdownItem(name: "Other", value: 3)
                        ],
                        hint: "Select Gender",
                        dropDownValue: state.gender == "Other"
                            ? 3
                            : state.gender == "Female"
                                ? 2
                                : 1,
                        selected: (value) {
                          bloc.add(GenderSelected(gender: value));
                        }),
                    const SizedBox(height: 20),
                    const TextB(
                      text: "Company Information",
                      fontColor: Colors.black,
                      fontSize: 18,
                    ),
                    const SizedBox(height: 10),
                    TextFieldB(
                      focusNode: companyNameFocusNode,
                      controller: companyNameController,
                      labelText: "Company Name",
                      onChanged: (text) {
                        bloc.add(CompanyNameChanged(password: text));
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFieldB(
                      focusNode: summeryFocusNode,
                      controller: summeryController,
                      labelText: "Company Address",
                      onChanged: (text) {
                        bloc.add(SummeryChanged(password: text));
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFieldB(
                      focusNode: phoneFocusNode,
                      controller: phoneController,
                      labelText: "Phone",
                      textInputType: TextInputType.number,
                      onChanged: (text) {
                        bloc.add(PhoneChanged(phone: text));
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFieldB(
                        focusNode: emailFocusNode,
                        controller: emailController,
                        labelText: "Email",
                        onChanged: (text) {
                          bloc.add(EmailChanged(email: text));
                        }),
                    const SizedBox(height: 20),
                    BigCamera(
                      tittle: "Documents",
                      press: () {
                        bloc.add(PickDocuments());
                      },
                    ),
                    GridViewFileImageB(
                      crossAxisCount: 3,
                      images: state.documents,
                      cancel: (index) {
                        bloc.add(CancelAnImage(index: index));
                      },
                    ),
                    const SizedBox(height: 20),
                    ButtonB(
                      text: "Update",
                      loading: state.loading,
                      press: () {
                        bloc.add(Update(
                            firstNameFocusNode: firstNameFocusNode,
                            lastNameFocusNode: lastNameFocusNode,
                            phoneFocusNode: phoneFocusNode,
                            companyNameFocusNode: companyNameFocusNode,
                            summeryFocusNode: summeryFocusNode));
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
