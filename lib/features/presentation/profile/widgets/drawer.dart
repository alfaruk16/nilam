import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nilam/core/widgets/text.dart';
import 'package:nilam/features/presentation/profile/bloc/profile_bloc.dart';

class DrawerB extends StatelessWidget {
  const DrawerB({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  drawerItem(
                      name: "Address",
                      icon: Icons.location_on_outlined,
                      callback: () {
                        bloc.add(GoToMyAddress());
                      }),
                  drawerItem(
                      name: "My Order",
                      icon: Icons.list_alt,
                      callback: () {
                        bloc.add(GoToMyOrder());
                      }),
                  drawerItem(
                      name: "My Bargain",
                      icon: Icons.ac_unit_sharp,
                      callback: () {
                        bloc.add(GoToMyBargain());
                      }),
                ],
              ),
            ),
            drawerItem(
                name: "Log Out",
                icon: Icons.logout_outlined,
                callback: () {
                  bloc.add(LogOut());
                }),
            const SizedBox(height: 5)
          ],
        ),
      );
    });
  }

  Widget drawerItem(
      {required String name,
      required IconData icon,
      required VoidCallback callback}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          callback();
        },
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            TextB(text: name, fontColor: Colors.black, fontSize: 16)
          ],
        ),
      ),
    );
  }
}
