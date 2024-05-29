// import 'dart:async';
// import 'package:buisness_manager/modules/auth/view/login.dart';
// import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';
//
// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
//   bool _isLoading = true;
//   bool _isConnected = false;
//
//
//   @override
//   void initState() {
//     super.initState();
//     _startLoading();
//     _connectivitySubscription =
//         Connectivity().onConnectivityChanged.listen((result) {
//           if (result == ConnectivityResult.none) {
//             setState(() {
//               _isConnected = false;
//               _isLoading = false;
//             });
//           } else {
//             _startLoading();
//           }
//         });
//   }
//
//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//     super.dispose();
//   }
//
//   void _startLoading() {
//     Timer(Duration(seconds: 3), () {
//       _checkConnectivity();
//     });
//   }
//
//   Future<void> _checkConnectivity() async {
//     bool isConnected = await _isConnectedToInternet();
//     setState(() {
//       _isConnected = isConnected;
//       _isLoading = false;
//     });
//   }
//
//   Future<bool> _isConnectedToInternet() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     return connectivityResult != ConnectivityResult.none;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
//     // bool isLoggedIn = await authViewModel.isLoggedIn();
//     return Scaffold(
//         body: Center(
//             child: _isLoading
//                 ? Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Lottie.asset(
//                   "assets/onboarding.json",
//                   width: 365.w,
//                   height: 400.h,
//                   fit: BoxFit.fill,
//                 ),
//                 SizedBox(height: 20.h),
//                 Text(
//                   'Establishing connection...',
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//                 SizedBox(height: 20.h),
//                 SizedBox(
//                   width: 200.w,
//                   child: TweenAnimationBuilder(
//                     duration: const Duration(seconds: 3),
//                     builder: (context, value, child) =>
//                         Column(
//                           children: [
//                             LinearProgressIndicator(
//                               backgroundColor: Colors.black,
//                               color: Colors.green,
//                               value: value,
//                             ),
//                             SizedBox(height: 10.h),
//                             Text(
//                               '${(value * 100).toInt()}%',
//                               style: const TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 shadows: [
//                                   Shadow(
//                                     color: Colors.lightGreenAccent,
//                                     blurRadius: 10,
//                                     offset: Offset(2, 2),
//                                   ),
//                                   Shadow(
//                                     color: Colors.blue,
//                                     blurRadius: 10,
//                                     offset: Offset(-2, -2),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                     tween: Tween(begin: 0.0, end: 1.0),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//
//               ],
//             ) : _isConnected
//                 ?
//             // isLoggedIn ? BranchViewInformationScreen():
//             Login()
//                 : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'No Internet Connection',
//                     style: TextStyle(fontSize: 18.0),
//                   ),
//                   SizedBox(height: 20.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       _startLoading();
//                     },
//                     child: Text('Retry'),
//                   )
//                   ,
//                 ]
//             )
//         )
//     );
//   }
// }
///
// import 'dart:async';
// import 'dart:developer';
// import 'package:buisness_manager/modules/auth/view/login.dart';
// import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
// import 'package:buisness_manager/modules/branch/view/branch_view_information.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
//   bool _isLoading = true;
//   bool _isConnected = false;
//   String? _token;
//
//   @override
//   void initState() {
//     super.initState();
//     _startLoading();
//     _connectivitySubscription =
//         Connectivity().onConnectivityChanged.listen((result) {
//           if (result == ConnectivityResult.none) {
//             setState(() {
//               _isConnected = false;
//               _isLoading = false;
//             });
//           } else {
//             _startLoading();
//           }
//         });
//   }
//
//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//     super.dispose();
//   }
//
//   void _startLoading() {
//     Timer(Duration(seconds: 3), () {
//       _checkConnectivity();
//     });
//   }
//
//   Future<void> _checkConnectivity() async {
//     bool isConnected = await _isConnectedToInternet();
//     if (isConnected) {
//       final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
//       bool isLoggedIn = await authViewModel.isLoggedIn();
//       if (isLoggedIn) {
//         _token = await authViewModel.getToken(); // Assuming you have a method to get the token
//       }
//     }
//     setState(() {
//       _isConnected = isConnected;
//       _isLoading = false;
//     });
//   }
//
//   Future<bool> _isConnectedToInternet() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     return connectivityResult != ConnectivityResult.none;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     log("user shared preference token : ============>${_token}");
//     return Scaffold(
//       body: Center(
//         child: _isLoading
//             ? Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Lottie.asset(
//               "assets/onboarding.json",
//               width: 365.w,
//               height: 400.h,
//               fit: BoxFit.fill,
//             ),
//             SizedBox(height: 20.h),
//             Text(
//               'Establishing connection...',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             SizedBox(height: 20.h),
//             SizedBox(
//               width: 200.w,
//               child: TweenAnimationBuilder(
//                 duration: const Duration(seconds: 3),
//                 builder: (context, value, child) => Column(
//                   children: [
//                     LinearProgressIndicator(
//                       backgroundColor: Colors.black,
//                       color: Colors.green,
//                       value: value,
//                     ),
//                     SizedBox(height: 10.h),
//                     Text(
//                       '${(value * 100).toInt()}%',
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         shadows: [
//                           Shadow(
//                             color: Colors.lightGreenAccent,
//                             blurRadius: 10,
//                             offset: Offset(2, 2),
//                           ),
//                           Shadow(
//                             color: Colors.blue,
//                             blurRadius: 10,
//                             offset: Offset(-2, -2),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 tween: Tween(begin: 0.0, end: 1.0),
//               ),
//             ),
//             SizedBox(height: 20.0),
//           ],
//         )
//             : _isConnected
//             ? _token != null
//             ? BranchViewInformationScreen()
//         // Column(
//         //   mainAxisAlignment: MainAxisAlignment.center,
//         //   children: [
//         //     // Text(
//         //     //   'User is logged in with token:',
//         //     //   style: TextStyle(fontSize: 18.0),
//         //     // ),
//         //     // SizedBox(height: 10.0),
//         //     // Text(
//         //     //   _token!,
//         //     //   style: TextStyle(fontSize: 16.0),
//         //     // ),
//         //   ],
//         // )
//             : Login()
//             : Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'No Internet Connection',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 _startLoading();
//               },
//               child: Text('Retry'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:developer';
import 'package:buisness_manager/modules/auth/view/login.dart';
import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
import 'package:buisness_manager/modules/branch/view/branch_view_information.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool _isLoading = true;
  bool _isConnected = false;
  String? _token;

  @override
  void initState() {
    super.initState();
    _startLoading();
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) {
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
    Timer(Duration(seconds: 3), () {
      _checkConnectivity();
    });
  }

  Future<void> _checkConnectivity() async {
    bool isConnected = await _isConnectedToInternet();
    if (isConnected) {
      final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      bool isLoggedIn = await authViewModel.isLoggedIn();
      if (isLoggedIn) {
        _token = await authViewModel.getToken();
      }
    }
    setState(() {
      _isConnected = isConnected;
      _isLoading = false;
    });

    // Navigate to the appropriate screen
    if (_isConnected && _token != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BranchViewInformationScreen()));
    } else if (_isConnected && _token == null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    }
  }

  Future<bool> _isConnectedToInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Widget build(BuildContext context) {
    log("User shared preference token: ${_token}");
    return Scaffold(
      body: Center(
        child: _isLoading
            ? _buildLoadingScreen()
            : _isConnected
            ? _token != null
            ? BranchViewInformationScreen()
            : Login()
            : _buildNoConnectionScreen(),
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          "assets/onboarding.json",
          width: 365.w,
          height: 400.h,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 20.h),
        Text(
          'Establishing connection...',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: 200.w,
          child: TweenAnimationBuilder(
            duration: const Duration(seconds: 3),
            builder: (context, value, child) => Column(
              children: [
                LinearProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.green,
                  value: value,
                ),
                SizedBox(height: 10.h),
                Text(
                  '${(value * 100).toInt()}%',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.lightGreenAccent,
                        blurRadius: 10,
                        offset: Offset(2, 2),
                      ),
                      Shadow(
                        color: Colors.blue,
                        blurRadius: 10,
                        offset: Offset(-2, -2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            tween: Tween(begin: 0.0, end: 1.0),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget _buildNoConnectionScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'No Internet Connection',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: _startLoading,
          child: Text('Retry'),
        ),
      ],
    );
  }
}


