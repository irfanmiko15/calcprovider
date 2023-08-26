import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/l10n.dart';
import '../helper/dialog_helper.dart';
import '../ui_data.dart';

class AppLauncher {
  static SnackBar _snackBar(what, appLocale) => SnackBar(
        content: Text(appLocale.what_not_available_in_your_phone(what)),
      );

//   static void openFile(
//     BuildContext buildContext, {
//     String url,
//     bool useConfirmation = true,
//   }) async {
//     assert(() {
//       print("openFile: " + url);
//       return true;
//     }());
//     if (useConfirmation) {
//       var appLocale = S.of(buildContext);
//       var confirmAction = await DialogHelper.confirm(
//         context: buildContext,
//         title: appLocale.open_what(appLocale.file),
//       );
//       if (confirmAction == ConfirmAction.CANCEL) return;
//     }
// //    url = "file://"+url;
//
// //    if (await canLaunch(url)) {
// //      await launch(url);
// //    } else {
// //      Scaffold.of(buildContext)
// //          .showSnackBar(_snackBar(appLocale.file, appLocale));
// //    }
//
//     OpenFile.open(url);
//   }

  static void openWhatsApp(BuildContext buildContext, String phone,
      {String message = ""}) async {
    var appLocale = S.of(buildContext);
    var confirmAction = await DialogHelper.confirm(
      context: buildContext,
      title: appLocale.open_what(appLocale.whatsapp),
    );
    if (confirmAction == ConfirmAction.CANCEL) return;

    var url = "whatsapp://send?phone=$phone&text=$message";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(buildContext)
          .showSnackBar(_snackBar(appLocale.whatsapp, appLocale));
    }
  }

  static void openCall(
    BuildContext buildContext,
    String tel,
  {String? title,}
  ) async {
    var appLocale = S.of(buildContext);
    var confirmAction = await DialogHelper.confirm(
      context: buildContext,
      title: title ?? "Call $tel (${Configs.companyName})",
    );
    if (confirmAction == ConfirmAction.CANCEL) return;

    String url = "tel:$tel";
    // if (await canLaunch(url)) {
      await launch(url);
    // } else {
    //   Scaffold.of(buildContext)
    //       .showSnackBar(_snackBar("Phone Call", appLocale));
    // }
  }

  static void openEmail(BuildContext buildContext) async {
    var appLocale = S.of(buildContext);
    var confirmAction = await DialogHelper.confirm(
      context: buildContext,
      title: appLocale.open_what(appLocale.email.toLowerCase()),
    );
    if (confirmAction == ConfirmAction.CANCEL) return;

    var url =
        "mailto:${Configs.emailAddress}?subject=${appLocale.email_subject}&body=${appLocale.email_body}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(buildContext)
          .showSnackBar(_snackBar(appLocale.email, appLocale));
    }
  }

  static openMap(
      {required double latitude, required double longitude}) async {
    var googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
