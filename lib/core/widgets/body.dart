import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body(
      {super.key,
      required this.child,
      this.isFullScreen = false,
      this.horizontalPadding = 0,
      this.appBar,
      this.bottomNav});

  final Widget child;
  final bool isFullScreen;
  final double horizontalPadding;
  final Widget? appBar;
  final Widget? bottomNav;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        margin: !isFullScreen
            ? EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              )
            : EdgeInsets.zero,
        child: Column(
          children: [
            Expanded(child: child),
          ],
        ),
      ),
      bottomNavigationBar: bottomNav,
    );
  }
}
