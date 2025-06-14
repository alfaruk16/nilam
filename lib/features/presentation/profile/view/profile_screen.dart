import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/ioc/global.dart';
import 'package:nilam/core/navigator/iflutter_navigator.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/widgets/network_image.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/domain/repositories/api_repo.dart';
import 'package:nilam/features/domain/repositories/local_storage_repo.dart';
import 'package:nilam/features/presentation/profile/bloc/profile_bloc.dart';
import 'package:nilam/features/presentation/profile/widgets/drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static Route<dynamic> route() => MaterialPageRoute<dynamic>(
        builder: (_) => const ProfileScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileBloc(getIt<ApiRepo>(),
            getIt<IFlutterNavigator>(), getIt<LocalStorageRepo>()),
        child: ProfileView());
  }
}

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final bloc = context.read<ProfileBloc>();

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
            drawer: Drawer(child: DrawerB(context: context)),
            body: Builder(builder: (context) {
              return Column(
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
                            Scaffold.of(context).openDrawer();
                          },
                          child: const Icon(Icons.menu),
                        ),
                        const SizedBox(width: 15),
                        const Expanded(
                            child: TextB(
                                text: "Profile",
                                fontSize: 20,
                                fontColor: Colors.black)),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                  if (state.profile.id != null)
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          SizedBox(
                              height: 150,
                              child: NetworkImageB(
                                  imageUrl:
                                      state.profile.profileImageUrl ?? "")),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              const TextB(
                                  text: "Personal Information",
                                  fontColor: Colors.black,
                                  fontSize: 20),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  bloc.add(EditProfile());
                                },
                                child: const TextB(
                                    text: "Edit",
                                    fontColor: buttonColor,
                                    fontSize: 16, fontWeight: FontWeight.w500,),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          infoItem(
                              "First Name ", state.profile.firstName ?? ""),
                          infoItem("Last Name ", state.profile.lastName ?? ""),
                          SizedBox(
                              height: 24,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 120,
                                    child: TextB(
                                      text: "Phone",
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                    children: [
                                      TextB(
                                          text:
                                              ": ${state.profile.mobile ?? ""}"),
                                      const SizedBox(width: 10),
                                      GestureDetector(
                                          onTap: () {
                                            bloc.add(
                                                UpdatePhone(context: context));
                                          },
                                          child: const TextB(
                                              text: "Update",
                                              fontColor: buttonColor)),
                                    ],
                                  ))
                                ],
                              )),
                          SizedBox(
                              height: 24,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 120,
                                    child: TextB(
                                      text: "Email",
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                    children: [
                                      TextB(
                                          text:
                                              ": ${state.profile.email ?? ""}"),
                                      const SizedBox(width: 10),
                                      GestureDetector(
                                          onTap: () {
                                            bloc.add(
                                                UpdateEmail(context: context));
                                          },
                                          child: const TextB(
                                              text: "Update",
                                              fontColor: buttonColor)),
                                    ],
                                  ))
                                ],
                              )),
                          infoItem("Date Of Birth ", ""),
                          infoItem("Gender ", state.profile.gender ?? ""),
                          const SizedBox(height: 30),
                        ],
                      ),
                    )
                ],
              );
            }));
      },
    );
  }

  Widget infoItem(String title, String text) {
    return SizedBox(
      height: 24,
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: TextB(
              text: title,
            ),
          ),
          Expanded(child: TextB(text: ": $text"))
        ],
      ),
    );
  }
}
