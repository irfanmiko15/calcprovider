import 'dart:async';

import 'package:async/async.dart';
import '../ui_data.dart';
import 'package:flutter/material.dart';

enum ConfirmAction { CANCEL, ACCEPT }
enum LoadingStatus { CANCELLED, COMPLETED }

class DialogHelper {
  static Future<T?> defaultLoading<T>({
   required BuildContext context,
   required Future<T> future,
    String message = 'Loading...',
    VoidCallback? onCancel,
    bool barrierDismissible = true,
    bool cancelable = false,
    WillPopCallback? onWillPop,
  }) async {
    return loading(
      context: context,
      future: future,
      onCancel: onCancel!,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: <Widget>[
              const CircularProgressIndicator(
                strokeWidth: 2.5,
              ),
              SizedBox(
                width: 24,
              ),
              Text(
                message,
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
      cancelable: cancelable,
      onWillPop: onWillPop!,
    );
  }

  static Future<T?> defaultLoadingTask<T>({
    required BuildContext context,
    required Future<T> Function() task,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
    bool cancelable = false,
    WillPopCallback? onWillPop,
  }) async {
    return loadingTask(
      context: context,
      task: task,
      onCancel: onCancel!,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: <Widget>[
              const CircularProgressIndicator(
                strokeWidth: 2.5,
              ),
              SizedBox(
                width: 24,
              ),
              Text(
                'Loading...',
                style: TextStyle(fontSize: 17),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
      cancelable: cancelable,
      onWillPop: onWillPop!,
    );
  }

  static Future<T?> loading<T>({
    required BuildContext context,
    required Future<T?> future,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
    bool cancelable = false,
    Widget child = const Center(
        child: CircularProgressIndicator(
      strokeWidth: 2.5,
    )),
    WillPopCallback? onWillPop,
  }) async {
    var isClosed = false;
    close() {
      if (!isClosed) {
        isClosed = true;
        Navigator.of(context, rootNavigator: true).pop();
      }
    }

    var cancelableTask = CancelableOperation<T?>.fromFuture(
      future,
      onCancel: () {
        close();
        if (onCancel != null) onCancel();
        return Future<T?>.value(null);
      },
    );

    showDialog(
        context: context,
        barrierDismissible: barrierDismissible && cancelable,
        builder: (context) {
          return WillPopScope(
            child: child,
            onWillPop: () async {
              return cancelable &&
                  (onWillPop != null ? await onWillPop() : true);
            },
          );
        }).then((_) {
      isClosed = true;

      if (!cancelableTask.isCanceled) {
        cancelableTask.cancel();
      }
    });
    T? result;
    try {
      result = await cancelableTask.valueOrCancellation();
    } finally {
      close();
    }
    return result;
  }

  static Future<T?> loadingTask<T>({
    required BuildContext context,
    required Future<T> Function() task,
    bool barrierDismissible = true,
    bool cancelable = false,
    VoidCallback? onCancel,
    WillPopCallback? onWillPop,
    Widget child = const Center(
        child: CircularProgressIndicator(
      strokeWidth: 2.5,
    )),
  }) async {
    var isClosed = false;
    close() {
      if (!isClosed) {
        isClosed = true;
        Navigator.of(context, rootNavigator: true).pop();
      }
    }

    var cancelableTask = CancelableOperation<T?>.fromFuture(
      task(),
      onCancel: () {
        close();
        if (onCancel != null) onCancel();
        return Future<T?>.value(null);
      },
    );

    showDialog(
        context: context,
        barrierDismissible: barrierDismissible && cancelable,
        builder: (context) {
          return WillPopScope(
            child: child,
            onWillPop: () async {
              return cancelable &&
                  (onWillPop != null ? await onWillPop() : true);
            },
          );
        }).then((_) {
      isClosed = true;

      if (!cancelableTask.isCanceled) {
        cancelableTask.cancel();
      }
    });
    T? result;
    try {
      result = await cancelableTask.valueOrCancellation();
    } finally {
      close();
    }
    return result;
  }

  static Future<ConfirmAction> confirm({
    required BuildContext context,
    @required String? title,
    String? message,
    String yes = "YA",
    String no = "TIDAK",
    bool barrierDismissible = true,
    bool cancelable = false,
  }) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: barrierDismissible && cancelable,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return cancelable;
          },
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text(
              title??"",
              style: const TextStyle(
                letterSpacing: 0.2,
//                fontSize: 21,
//                fontWeight: FontWeight.w400,
              ),
            ),
            contentPadding: EdgeInsets.only(
              left: 24,
              bottom: 16,
              right: 24,
            ),
            content: message == null
                ? null
                : Text(
                    message,
                    style: const TextStyle(
                      fontFamily: Fonts.gilroy,
                    ),
                  ),
            titlePadding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 24,
            ),
            actions: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.close),
                label: Text(
                  no,
                  style: const TextStyle(
                    fontFamily: Fonts.gilroy,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(ConfirmAction.CANCEL);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent[400],
                  foregroundColor: Colors.white,
                ),
                
              ),
              SizedBox(),
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.greenAccent[700],
                  
                ),
                
                icon: Icon(Icons.check),
                label: Text(
                  yes,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: Fonts.gilroy,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop(ConfirmAction.ACCEPT);
                },
                
                // splashColor: Colors.white.withOpacity(0.2),
              ),
              SizedBox(
                width: 2,
              ),
            ],
          ),
        );
      },
    ).then((confirmAction) {
      if (confirmAction == null) {
        return ConfirmAction.CANCEL;
      } else {
        return confirmAction;
      }
    });
  }

  static Future<ConfirmAction> info({
    required BuildContext context,
    @required String? title,
    String? message,
    String ok = "OK",
    bool dismissible = true,
  }) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(title??""),
          content: message == null
              ? null
              : Text(
                  message,
                  style: TextStyle(
                    fontFamily: Fonts.gilroy,
                    color: Colors.black
                  ),
                ),
          actions: <Widget>[
            TextButton(
              child: Text(ok, style: const TextStyle(fontSize: 16,color: Colors.black)),
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pop(ConfirmAction.ACCEPT);
              },
            )
          ],
        );
      },
    ).then((confirmAction) {
      if (confirmAction == null) {
        return ConfirmAction.ACCEPT;
      } else {
        return confirmAction;
      }
    });
  }

  static Future<ConfirmAction> infoCustom({
    required BuildContext context,
    @required Widget? title,
    Widget? content,
    String ok = "OK",
    bool dismissible = true,
  }) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: title,
          content: content,
          actions: <Widget>[
            TextButton(
              child: Text(ok, style: const TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pop(ConfirmAction.ACCEPT);
              },
            )
          ],
        );
      },
    ).then((confirmAction) {
      if (confirmAction == null) {
        return ConfirmAction.ACCEPT;
      } else {
        return confirmAction;
      }
    });
  }

  static Future<T?> customAction<T>({
    required BuildContext context,
    @required String? title,
    required List<Widget> Function(BuildContext context) actionBuilder,
    String? message,
    bool dismissible = true,
  }) async {
    return showDialog<T>(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(title??""),
          content: message == null
              ? null
              : Text(
                  message,
                  style: TextStyle(
                    fontFamily: Fonts.gilroy,
                  ),
                ),
          actions: actionBuilder(context),
        );
      },
    );
  }
}
