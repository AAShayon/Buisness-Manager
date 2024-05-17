import 'dart:async';

import 'package:buisness_manager/modules/transaction/view/widget/transaction_list.dart';
import 'package:buisness_manager/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:connectivity/connectivity.dart';

class CheckConnectivity extends StatefulWidget {
  const CheckConnectivity({super.key});

  @override
  _CheckConnectivityState createState() => _CheckConnectivityState();
}

class _CheckConnectivityState extends State<CheckConnectivity> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool _isLoading = true;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _startLoading();
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          _isConnected = false;
          _isLoading = false;
        });
      } else {
        _startLoading();
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  void _startLoading() {
    // Simulate a delay and connection establishment
    Timer(Duration(seconds: 3), () {
      _checkConnectivity();
    });
  }

  Future<void> _checkConnectivity() async {
    bool isConnected = await _isConnectedToInternet();
    setState(() {
      _isConnected = isConnected;
      _isLoading = false;
    });
  }

  Future<bool> _isConnectedToInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20.0),
            Text(
              'Establishing connection...',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        )
            : _isConnected
            ? OnboardingScreen()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _startLoading();
              },
              child: Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
