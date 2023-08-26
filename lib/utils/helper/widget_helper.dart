import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../datasource/prefs/config.dart';
import '../../generated/l10n.dart';
import '../ui_data.dart';
import '../utils.dart';
import 'dialog_helper.dart';

/// Widget extension / helper
extension WidgetContext on BuildContext {
  Future<void> showDefaultModal({
    @required String? headerIcon,
    @required String? title,
    @required String? subtitle,
    @required DefaultButtonOption? firstButtonOption,
    DefaultButtonOption? secondButtonOption, //tdk wajib kalau 1 button
  }) =>
      showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: false,
        enableDrag: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        context: this,
        backgroundColor: Colors.white,
        builder: (context) => WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 8,
                ),
                SvgPicture.asset(
                  headerIcon!,
                  width: 280,
                  height: 140,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  title!,
                  style: const TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w600,
                    fontFamily: Fonts.gilroy,
                    fontStyle: FontStyle.normal,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  subtitle!,
                  style: const TextStyle(
                    color: Color(0xff525252),
                    fontWeight: FontWeight.w400,
                    fontFamily: Fonts.gilroy,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 24,
                ),
                if (firstButtonOption != null && secondButtonOption != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: buildDefaultButton(firstButtonOption),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: buildDefaultButton(secondButtonOption),
                      ),
                    ],
                  )
                else
                  SizedBox(
                    width: double.infinity,
                    child: buildDefaultButton(firstButtonOption!),
                  ),
              ],
            ),
          ),
        ),
      );

  Widget buildDefaultButton(DefaultButtonOption option) {
    final text = Text(
      option.title!,
      style: const TextStyle(
        color: Color(0xffffffff),
        fontWeight: FontWeight.w600,
        fontFamily: Fonts.gilroy,
        fontStyle: FontStyle.normal,
        fontSize: 16.0,
      ),
      textAlign: TextAlign.center,
    );
    return SizedBox(
      width: option.width,
      height: option.height,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: option.color, shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        disabledBackgroundColor:  Colors.grey[400],
        disabledForegroundColor: Colors.white,
       
        ),
        
        onPressed: option.onPressed,
        child: option.asset == null
            ? text
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SvgPicture.asset(
                    option.asset!,
                    width: 16,
                    height: 16,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  text,
                ],
              ),
      ),
    );
  }
}

class DefaultButtonOption {
  final double? width;
  final double ?height;
  final String? title;
  final VoidCallback? onPressed;
  final String? asset;
  final Color? color;

  DefaultButtonOption({
    this.width,
    this.height = 48,
    @required this.title,
    @required this.onPressed,
    this.asset,
    this.color = const Color(0xff32bfa8),
  });
}
