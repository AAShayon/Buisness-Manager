// import 'dart:async';
// import 'dart:developer';
// import 'package:buisness_manager/modules/auth/model/service/remote/auth_service.dart';
// import 'package:buisness_manager/modules/auth/view/login.dart';
// import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
// import 'package:buisness_manager/modules/branch/view/branch_view_information.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';
//
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
//   final AuthService _authService =AuthRemoteDataSource();
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
//   Future<void> _checkConnectivity() async {
//     bool isConnected = await _isConnectedToInternet();
//     bool isLoggedIn = false;
//     if (isConnected) {
//       final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
//       isLoggedIn = await authViewModel.isLoggedIn();
//     }
//     setState(() {
//       _isConnected = isConnected;
//       _isLoading = false;
//     });
//
//     if (_isConnected && isLoggedIn) {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (context) => BranchViewInformationScreen()));
//     } else if (_isConnected && !isLoggedIn) {
//       Navigator.of(context)
//           .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
//     }
//   }
//
//   Future<bool> _isConnectedToInternet() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     return connectivityResult != ConnectivityResult.none;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // log("User shared preference token: ${_token}");
//     return Scaffold(
//       body: Center(
//         child: _isLoading
//             ? _buildLoadingScreen()
//             : _isConnected?
//            _buildLoadingScreen()
//             : _buildNoConnectionScreen(),
//         //_isConnected
//         //             ? _token != null
//         //             ? BranchViewInformationScreen()
//         //             : Login()
//       ),
//     );
//   }
//
//   Widget _buildLoadingScreen() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Lottie.asset(
//           "assets/onboarding.json",
//           width: 365.w,
//           height: 400.h,
//           fit: BoxFit.fill,
//         ),
//         SizedBox(height: 20.h),
//         Text(
//           'Loading......',
//           style: TextStyle(fontSize: 18.0),
//         ),
//         SizedBox(height: 20.h),
//         SizedBox(
//           width: 200.w,
//           child: TweenAnimationBuilder(
//             duration: const Duration(seconds: 3),
//             builder: (context, value, child) => Column(
//               children: [
//                 LinearProgressIndicator(
//                   backgroundColor: Colors.black,
//                   color: Colors.green,
//                   value: value,
//                 ),
//                 SizedBox(height: 10.h),
//                 Text(
//                   '${(value * 100).toInt()}%',
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     shadows: [
//                       Shadow(
//                         color: Colors.lightGreenAccent,
//                         blurRadius: 10,
//                         offset: Offset(2, 2),
//                       ),
//                       Shadow(
//                         color: Colors.blue,
//                         blurRadius: 10,
//                         offset: Offset(-2, -2),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             tween: Tween(begin: 0.0, end: 1.0),
//           ),
//         ),
//         SizedBox(height: 20.0),
//       ],
//     );
//   }
//
//   Widget _buildNoConnectionScreen() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text(
//           'No Internet Connection',
//           style: TextStyle(fontSize: 18.0),
//         ),
//         SizedBox(height: 20.0),
//         ElevatedButton(
//           onPressed: _startLoading,
//           child: Text('Retry'),
//         ),
//       ],
//     );
//   }
// }
//
//
import 'dart:async';
import 'package:buisness_manager/modules/auth/view/login.dart';
import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
import 'package:buisness_manager/modules/branch/view/branch_view_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();

}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      _loginCheck();
    });
  }
  Future<void> _loginCheck() async{
    bool isLoggedIn=false;
    final authViewModel=Provider.of<AuthViewModel>(context ,listen:false);
    isLoggedIn=await authViewModel.isLoggedIn();
    if(isLoggedIn){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BranchViewInformationScreen()));
    }
    else{
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            'Loading......',
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
      ),
    );;
  }
}
