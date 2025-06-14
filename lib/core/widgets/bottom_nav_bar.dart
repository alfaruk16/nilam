import 'package:flutter/material.dart';
import 'package:nilam/core/utils/colors.dart';
import 'package:nilam/core/widgets/text.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.getScreenIndex});

  final Function getScreenIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        padding: const EdgeInsets.only(bottom: 7),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: nWhite,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 15,
              spreadRadius: 0,
              color: const Color(0XFF3C7ACF).withOpacity(0.25),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                  widget.getScreenIndex(selectedIndex);
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    selectedIndex == 0
                        ? Icons.home_rounded
                        : Icons.home_outlined,
                    color: selectedIndex == 0 ? nDark : nLightGray,
                    size: 30,
                  ),
                  TextB(
                    text: "Home",
                    fontSize: 13,
                    fontColor: selectedIndex == 0 ? nDark : nLightGray,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                  widget.getScreenIndex(selectedIndex);
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    selectedIndex == 1
                        ? Icons.grid_view_sharp
                        : Icons.grid_view,
                    size: 26,
                    color: selectedIndex == 1 ? nDark : nLightGray,
                  ),
                  TextB(
                    text: "Categories",
                    fontColor: selectedIndex == 1 ? nDark : nLightGray,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                  widget.getScreenIndex(selectedIndex);
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 33,
                    height: 33,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0XFFFAB977), Color(0XFFF98309)]),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 28,
                      color: nWhite,
                    ),
                  ),
                  TextB(
                    text: "Post Your Ad",
                    fontColor: selectedIndex == 2 ? nDark : nLightGray,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                  widget.getScreenIndex(selectedIndex);
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    selectedIndex == 3
                        ? Icons.gavel_sharp
                        : Icons.gavel_outlined,
                    size: 27,
                    color: selectedIndex == 3 ? nDark : nLightGray,
                  ),
                  TextB(
                    text: "Auction",
                    fontColor: selectedIndex == 3 ? nDark : nLightGray,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 4;
                  widget.getScreenIndex(selectedIndex);
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    selectedIndex == 4 ? Icons.person : Icons.person_outline,
                    size: 30,
                    color: selectedIndex == 4 ? nDark : nLightGray,
                  ),
                  TextB(
                    text: "Account",
                    fontColor: selectedIndex == 4 ? nDark : nLightGray,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

//hellohh
