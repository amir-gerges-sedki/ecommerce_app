import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:master_store/core/helper/helper.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>>
      _connectivitySubscription; // Adjusted type
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((connectivityResults) {
      if (connectivityResults.isNotEmpty) {
        _updateConnectionStatus(
            connectivityResults.first); // Handle first result
      }
    });
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      HelperFun.warningSnackbar(message: 'No Internet Connection');
    }
  }

  // Check the internet connection status.
  Future<bool> isConnected() async {
    try {
      final resultList = await _connectivity.checkConnectivity();
      if (resultList.isEmpty || resultList.first == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  // Close the active connectivity stream.
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
