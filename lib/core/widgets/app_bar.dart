import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/text_field.dart';

class AppBarB extends StatelessWidget {
  final bool loading;
  final bool isReadOnly;
  AppBarB({this.loading = false, this.isReadOnly = true, super.key});

  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: size.width - 80,
              child: TextFieldB(
                focusNode: searchFocusNode,
                onChanged: () {},
                hintText: "Search",
                prefixIcon: Icons.search_rounded,
                isReadOnly: true,
              )),

        ],
      ),
    );
  }
}
