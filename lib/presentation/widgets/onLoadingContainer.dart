// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class OnLoadingContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget child;
  const OnLoadingContainer({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.only(left: 6),
      width: width,
      height: height,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
      child: child,
    );
  }
}
