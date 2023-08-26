import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';


class ConnectionService{
  final Connectivity _connectivity = Connectivity();
  Future<ConnectivityResult> get connectivity async{
    ConnectivityResult result;
    result =await _connectivity.checkConnectivity();

    return result;
  }
}