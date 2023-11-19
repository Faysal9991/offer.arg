import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInkWell extends StatelessWidget {
  CustomInkWell({this.onTap, this.child,this.borderRadius,this.height,this.width=double.infinity, Key? key}) : super(key: key);
  VoidCallback? onTap;
  Widget? child;
  double? borderRadius;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xff009FB6),
            Color(0xff66DDEF), //add more colors
          ]),
        borderRadius: BorderRadius.circular(borderRadius!),),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!)),
        ),
          onPressed: onTap, child: child),
    );
  }
}
