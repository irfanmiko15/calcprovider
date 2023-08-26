
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../router/router.dart';
import '../../utils/helper/navstatbar.dart';
import '../../utils/utils.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    NavStatHelper.instance().changeTo(
      icon: IconBrightness.dark,
      background: Colors.black12,
    );
     Utils.addAfterBuildCallback(() async {
      if (ModalRoute.of(context)?.isCurrent==true) {
        
        Navigator.of(context).pushReplacementNamed(Routes.calculator);
      }
  
  });
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.asset(
            //   AssetImages.authimage,
            //   width: 120,
            //   height: 110,
            //   fit: BoxFit.cover,
            // ),
            // Text("Envi 2.0",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 16,),
            SizedBox(
              width: 120,
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color?>(Colors.blue[500]),
                backgroundColor: Colors.blue[200],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onBottom(Widget child) => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: child,
        ),
      );
}
