import 'package:buisness_manager/modules/auth/view/login.dart';
import 'package:buisness_manager/modules/auth/view_model/auth_view_model.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:buisness_manager/modules/auth/model/core/response_model/logIn_response_model.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  final LogInResponseModel? logInResponseModel;

  const LandingScreen({super.key,  this.logInResponseModel});

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late User? user;

  @override
  void initState() {
    super.initState();
    user = widget.logInResponseModel!.user;
    // Initialize any additional data if needed here
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context,authViewModel,child) {
        return CustomContainer(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            title: Center(child: Text('Welcome, ${user?.name ?? "User"}')),
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () async {
                await authViewModel.logOut(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );


                }
              )
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (user != null) ...[
                  Text('Name: ${user!.name ?? 'N/A'}', style: TextStyle(fontSize: 20)),
                  Text('Email: ${user!.email ?? 'N/A'}', style: TextStyle(fontSize: 20)),
                  Text('Phone: ${user!.phone ?? 'N/A'}', style: TextStyle(fontSize: 20)),
                  Text('Business Name: ${user!.businessName ?? 'N/A'}', style: TextStyle(fontSize: 20)),
                  // Add more user details as needed
                ] else
                  Text('No user data available', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        );
      }
    );
  }
}
