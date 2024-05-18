import 'package:buisness_manager/modules/admin/view/user_profile.dart';
import 'package:buisness_manager/modules/admin/viewModel/user_profile_view_model.dart';
import 'package:buisness_manager/modules/auth/model/core/response_model/logIn_response_model.dart';
import 'package:buisness_manager/modules/auth/view/login.dart';
import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
import 'package:buisness_manager/modules/branch/view/widgets/branch_list.dart';
import 'package:buisness_manager/modules/branch/view/widgets/branch_create.dart';
import 'package:buisness_manager/modules/branch/viewModel/branch_view_model.dart';
import 'package:buisness_manager/view/widget/common_use_container.dart';
import 'package:buisness_manager/view/widget/custom_main_use_container.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key,});

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    final userProfileViewModel=Provider.of<UserProfileViewModel>(context,listen:false );
    final branchViewModel = Provider.of<BranchViewModel>(context, listen: false);
    await branchViewModel.branchListFetch();
    await userProfileViewModel.getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        await _loadData();
      },
      child: Consumer2<AuthViewModel,UserProfileViewModel>(
          builder: (context, authViewModel,userProfileViewModel, child) {
            final user=userProfileViewModel.responseUser;
            if(user != null || userProfileViewModel.isLoadingState )
            {
              return CustomContainer(
              appBar: AppBar(
                backgroundColor: Colors.greenAccent,
                leading: userProfileViewModel.isLoadingState
                    ? CircularProgressIndicator(color: Colors.amber)
                    : IconButton(onPressed: () async {
                      await userProfileViewModel.getUserProfile();
                      if (context.mounted) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfile()));
                      }
                    },
                    icon: const Icon(Iconsax.user)),
                title: Center(
                    child: user != null
                        ? Text('Welcome, ${user.name ?? "User"}')
                        : const Text('User !!!!!')),
                actions: [ userProfileViewModel.isLoadingState
                    ? CircularProgressIndicator(color: Colors.amber):
                  IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () async {
                        await authViewModel.logOut(context);
                        if (context.mounted) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
                        }
                      })
                ],
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                        SizedBox(height: 20.h),
                        CommonUseContainer(
                          width: 200.w,
                          child: Column(
                            children: [
                              const HeadlineLargeText(text: 'My Business ', color: Colors.white),
                              HeadlineLargeText(
                                text: user!.businessType ?? 'N/A',
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonUseContainer(
                                width: 150.w,
                                height: 50.h,
                                child: const HeadLineMediumText(text: 'My Branches', color: Colors.black)),
                            SizedBox(width: 25.w),
                            IconButton(onPressed: () {
                              _showBranchOption(context);
                            }, icon: Icon(Icons.add, size: 40)),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Consumer<BranchViewModel>(
                          builder: (context, branchViewModel, child) {
                            if (branchViewModel.isLoadingState) {
                              return CircularProgressIndicator();
                            } else if (branchViewModel.branches?.branches != null) {
                              return BranchListGridView();
                            } else {
                              return Text('No branches available', style: TextStyle(fontSize: 20));
                            }
                          },
                        ),

                    ],
                  ),
                ),
              ),
            );}

            return Center(child: const CircularProgressIndicator(color: Colors.amber,));

      }),
    );
  }

  void _showBranchOption(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Branch Options'),
          content: TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => BranchCreate()));
            },
            child: HeadLineMediumText(text: 'CreateBranch', color: Colors.black),
          ),
        );
      },
    );
  }
}
