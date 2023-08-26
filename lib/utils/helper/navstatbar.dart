import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

enum IconBrightness { dark, light }

abstract class NavStatProvider {
  const NavStatProvider(this.pageNavStat);

  final NavStat pageNavStat;
}

mixin NavStatMixin<T extends StatefulWidget> on State<T>
    implements NavStatProvider {
  @override
  void initState() {
    super.initState();
    refreshNavStat();
  }

  Future<void> refreshNavStat() async {
    await NavStatHelper.instance().changeDisplay(pageNavStat);
  }
}

class NavStat {
  final IconBrightness? icon;
  final Color? background;

  NavStat({this.icon, this.background});
}

class NavStatHelper {
  static NavStatHelper? _instance;

  factory NavStatHelper.instance() => _instance ??= NavStatHelper._();

  NavStatHelper._();

  NavStat? _currentProps;

  Future<T?> wrapRoute<T>({
    Future<T>? route,
    @required IconBrightness? icon,
    Color background = Colors.transparent,
  }) async {
    final temp =
        NavStat(icon: _currentProps?.icon, background: _currentProps?.background);
    changeTo(
      icon: icon!,
      background: background,
    );
    var result = await route;
    changeTo(
      icon: temp.icon!,
      background: temp.background!,
    );
    return result;
  }

  Future<void> changeTo(
      {@required IconBrightness? icon,
      Color background = Colors.transparent}) async {
//    if(icon == IconBrightness.light){
//      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
//        statusBarIconBrightness: Brightness.light,
//        statusBarColor: background,
//      ));
//    }else {
//      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
//        statusBarIconBrightness: Brightness.dark,
//        statusBarColor: background,
//      ));
//    }
//    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(//.light.copyWith(
//      statusBarColor: Colors.black12, //or set color with: Color(0xFF0000FF)
//      statusBarBrightness: Brightness.light,
//      statusBarIconBrightness: Brightness.light,
//    ));
    await changeDisplay(NavStat(icon: icon, background: background));
  }

  Future<void> changeDisplay(NavStat navStatProps) async {
    if (navStatProps == null) return;
    FlutterStatusbarcolor.setStatusBarColor(
      navStatProps.background!,
      animate: true,
    );
    await FlutterStatusbarcolor.setStatusBarWhiteForeground(
        navStatProps.icon == IconBrightness.light);

    _currentProps = navStatProps;
  }

  Future<void> reload() async {
    if (_currentProps != null) await changeDisplay(_currentProps!);
  }
}
