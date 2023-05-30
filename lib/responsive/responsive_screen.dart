import 'package:flutter/material.dart';
import 'package:hostelites/utils/dimensions.dart';

class MyResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const MyResponsiveLayout(
      {Key? key,
      required this.webScreenLayout,
      required this.mobileScreenLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          //web screen
          return webScreenLayout;
        }
        //mobile screen
        return mobileScreenLayout;
      },
    );
  }
}
