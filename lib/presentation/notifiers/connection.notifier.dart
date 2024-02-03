import 'dart:async';
import 'dart:io';
import 'package:inspo/utils/logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class ConnectionNotifier extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();

  bool _isOnline = true;
  bool get isOnline => _isOnline;

  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  ConnectivityResult get connectivityResult => _connectivityResult;

  Timer? _timer; // Timer can now be null
  int checkInterval = 5; // Interval time in seconds for retrying connection
  int _retrySeconds; // Variable to keep track of seconds left for retry
  int get retrySeconds => _retrySeconds; // Getter for retry seconds

  // Constructor will trigger the monitor function
  ConnectionNotifier(): _retrySeconds = 0 {
    startMonitoring();
  }

  /// Will start monitoring the user network connection making
  /// sure to notify any connection changes.
  Future<void> startMonitoring() async {
    await initConnectivity();
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) async {
      Log.d("Connectivity Changed: $result");

      if(result == ConnectivityResult.none){
        _isOnline = false;
        _startTimer(); // Start the timer when we are offline
      }else {
        if (!_isOnline) {
          bool isConnected = await _updateConnectionStatus();
          _isOnline = isConnected;
        }
        if (_isOnline) {
          _stopTimer(); // Stop the timer if we are back online
        }
      }
      _connectivityResult = result;
      notifyListeners();
    });
  }

  /// Initialize connectivity function
  Future<void> initConnectivity() async {
    try {
      ConnectivityResult status = await _connectivity.checkConnectivity();
      _isOnline = _connectivityResult != ConnectivityResult.none && await _updateConnectionStatus();
      Log.d("Connectivity Result: $status");

      if (!_isOnline) {
        _startTimer();
      }
      _connectivityResult = status;
      notifyListeners();
    } catch (e) {
      Log.e(e.toString());
    }
  }

  /// Check if the mobile has internet connection
  Future<bool> _updateConnectionStatus() async {
    try {
      List<InternetAddress> result = await InternetAddress.lookup('www.google.com');
      Log.i('Internet address result: $result\n${result.isNotEmpty && result[0].rawAddress.isNotEmpty}');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (e) {
      Log.e("Checking internet connection exception: ${e.toString()}");
      return false;
    }
  }

  Future<void> _checkInternetConnectivity() async {
    bool previousConnectionStatus = _isOnline;
    _isOnline = await _updateConnectionStatus();
    if (previousConnectionStatus != _isOnline) {
      notifyListeners();
    }
    if (_isOnline) {
      _stopTimer(); // We have connection now, so stop the timer
    }
  }


  void _startTimer() {
    _retrySeconds = 0; // Reset the retry seconds
    _timer ??= Timer.periodic(Duration(seconds: checkInterval), (timer) {
      _checkInternetConnectivity();
      _retrySeconds++; // Increment the retry seconds
      // if (_retrySeconds > 0) {
      //   _retrySeconds--;
      // }
      notifyListeners(); // Notify listeners on each tick
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
    _retrySeconds = 0; // Reset the retry seconds when stopping the timer
    notifyListeners(); // Notify listeners when timer is stopped
  }


  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }
}