
import 'package:calculatorapp/datasource/prefs/config.dart';
import 'package:calculatorapp/provider/page/app_provider.dart';
import 'package:calculatorapp/provider/provider.dart';
import 'package:calculatorapp/service/navigation_service.dart';
import 'package:calculatorapp/utils/locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'UI/pages/notfound_page.dart';
import 'generated/l10n.dart';
import 'l10n/localization.dart';
import 'router/router.dart';
import 'utils/ui_data.dart';
import 'package:intl/intl.dart';
import 'utils/utils.dart';
import 'datasource/prefs/prefs.dart';

typedef PageBuilder = Widget Function(RouteSettings settings);

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isInit = true;
  Locale? _currentLocale;

  @override
  void initState() {
    super.initState();

    //APP INITIALIZATION
    () async {
      await SharedPrefs.init();
      // Untuk fitur tracking
      // await locator<LocationService>().init();
      var defaultLocale =
          await Languages.init(onLocaleChanged: onLocaleChanged);
      if (defaultLocale != null) {
        Utils.init(defaultLocale);
        _currentLocale = defaultLocale;
      }

//      Utils.addAfterBuildCallback((){
////    initFCM();
//        locator<NotificationService>().initializeFcmNotification(context);//utk dpt context wajib dimasukin di buildcallback
//      });
      setState(() {
        _isInit = false;
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    if (_isInit) {
      return Container(
        color: Colors.white,
      );
    } else {
      return Consumer<AppProvider>(
      builder: (_, provider, child) {return MaterialApp(
          localizationsDelegates: [
            S.delegate,
             GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
             GlobalCupertinoLocalizations.delegate
            
          ],
          locale: _currentLocale,
          supportedLocales: S.delegate.supportedLocales,
          navigatorKey: locator<NavigationService>().navigatorKey,
          title: Configs.appName,
          theme: provider.themeMode == ThemeMode.light? AppTheme.lightTheme
  :AppTheme.darkTheme,
          routes: <String, WidgetBuilder>{
            //Pindah ke routers
          },
          onGenerateRoute: _onGenerateRoute,
          onUnknownRoute: _onUnknownRoute,
        );
      });
    }
  }

  Widget _router(RouteSettings settings, Map<String, PageBuilder> routers) {
    var temp = routers[settings.name];
    if (temp != null) return temp(settings);
    return Container();
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) => _buildRoute(
        settings,
        Column(
          children: [
            Expanded(child: _router(settings, routers)),
            kDebugMode?
            Material(
                child: Container(
                  width: double.infinity,
                  height: 24,
                  decoration: BoxDecoration(color: Colors.red),
                  child: Center(
                    child: Text(
                      
                      'Development Mode',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ):Container(),
          ],
        ),
      );

  Route<dynamic> _onUnknownRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (context) => NotFoundPage(),
      );

  MaterialPageRoute<dynamic>? _buildRoute(
    RouteSettings settings,
    Widget? child,
  ) {
    if (child == null) return null;
    return MaterialPageRoute<dynamic>(
      settings: settings,
      builder: (context) {
        return child;
      },
    );
  }

  void onLocaleChanged(Locale newLocale) {
    Utils.init(newLocale);
    setState(() {
      _currentLocale = newLocale;
    });
  }
}