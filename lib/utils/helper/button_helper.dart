import 'package:flutter/material.dart';

class ButtonHelper {
  static MaterialButton buildMaterial(
    BuildContext context, {
    @required String? title,
    @required VoidCallback? onPressed,
    EdgeInsetsGeometry padding = const EdgeInsets.only(
      left: 18,
      right: 18,
      top: 14,
      bottom: 16,
    ),
  }) {
    return MaterialButton(
      onPressed: onPressed,
      shape: StadiumBorder(),
      padding: padding,
      child: Text(
        title??"",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      color: Colors.blue,
    );
  }
}
