import 'package:grekino/services/i_connectivity_service.dart';

import 'locator.dart';

class Init {
  static Future initialize() async {
    await _registerServices();
    await _loadSettings();
  }

  static _registerServices() async {
    //TODO register services
    setupLocator();
  }

  static _loadSettings() async {
    //TODO load settings
    await locator.get<IConnectivityService>().checkInternetConnection();
  }
}