import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> successMsg([String msg = "Success"]) async {
  try{
    await Fluttertoast.cancel();
  }catch(e){ }
  await Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.greenAccent[700]!.withOpacity(0.8),
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
  );
}

Future<void> infoMsg([String msg = "Info"]) async {
  try{
    await Fluttertoast.cancel();
  }catch(e){ }
  await Fluttertoast.showToast(
    msg: msg,
    textColor: Colors.white,
    backgroundColor: Colors.blue.withOpacity(0.8),
    toastLength: Toast.LENGTH_LONG,
  );
}

Future<void> failedMsg([String msg = "Failed"]) async {
  try{
    await Fluttertoast.cancel();
  }catch(e){ }
  await Fluttertoast.showToast(
    msg: msg,
    textColor: Colors.white,
    backgroundColor: Colors.red.withOpacity(0.8),
    toastLength: Toast.LENGTH_LONG,
  );
}

void failedSnackBar(
  BuildContext context, {
  String msg = "Failed",
  Duration duration = const Duration(milliseconds: 5000),
}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  final snackBar = SnackBar(
    content: Text(msg),
//    action: SnackBarAction(
//      label: 'Undo',
//      onPressed: () {
//        // Some code to undo the change.
//      },
//    ),
    backgroundColor: Colors.redAccent,
    duration: duration,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void successSnackBar(
  BuildContext context, {
  String msg = "Success",
  String label = "Open",
  VoidCallback? onActionPressed,
  Duration duration = const Duration(milliseconds: 5000),
}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  final snackBar = SnackBar(
    content: Text(msg),
    action: onActionPressed != null
        ? SnackBarAction(
            label: label,
            onPressed: onActionPressed,
            textColor: Colors.yellow,
          )
        : null,
    backgroundColor: Colors.green,
    duration: duration,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
