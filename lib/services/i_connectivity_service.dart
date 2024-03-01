
abstract class IConnectivityService {
  bool get isDeviceConnected;
  Future<void> checkInternetConnection();
}