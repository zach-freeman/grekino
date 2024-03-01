import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:grekino/services/i_connectivity_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityService extends IConnectivityService {
  late StreamSubscription<ConnectivityResult> subscription;
  @override
  bool isDeviceConnected = false;
  
  ConnectivityService() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      log("Internet status ====== $isDeviceConnected");
    });
  }

  @override
  Future<void> checkInternetConnection() async {
    isDeviceConnected = await InternetConnectionChecker().hasConnection;
  }
}