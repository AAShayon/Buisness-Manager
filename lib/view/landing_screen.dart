import 'package:buisness_manager/modules/admin/view/user_profile.dart';
import 'package:buisness_manager/modules/auth/model/core/response_model/logIn_response_model.dart';
import 'package:buisness_manager/modules/auth/view/login.dart';
import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
import 'package:buisness_manager/modules/branch/view/branch_list.dart';
import 'package:buisness_manager/modules/branch/view/widgets/branch_create.dart';
import 'package:buisness_manager/modules/branch/viewModel/branch_view_model.dart';
import 'package:buisness_manager/view/widget/common_use_container.dart';
import 'package:buisness_manager/view/widget/custom_main_use_container.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  final LogInResponseModel? logInResponseModel;

  const LandingScreen({super.key, this.logInResponseModel,});

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late User? user;
  @override
  void initState(){
    super.initState();
    user = widget.logInResponseModel!.user;
    _loadData();
  }
  Future<void> _loadData() async {
    final branchViewModel = Provider.of<BranchViewModel>(context, listen: false);
    await branchViewModel.branchListFetch();
    setState(() {}); // Trigger UI update after data fetch
  }

  @override
  Widget build(BuildContext context) {
    final branchViewModel = Provider.of<BranchViewModel>(context, listen: false);
    final branches = branchViewModel.branches?.branches;
    return Consumer<AuthViewModel>(builder: (context, authViewModel, child) {
      return CustomContainer(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          leading: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> UserProfile()));}, icon: Icon(Iconsax.user)),
          title: Center(
              child: user!= null
                  ? Text('Welcome, ${user!.name ?? "User"}')
                  : const Text('User !!!!!')),
          actions: [
            IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  await authViewModel.logOut(context);
                  if(context.mounted){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()),
                    );
                  }
                })
          ],
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (user != null) ...[
                  SizedBox(
                    height: 20.h,
                  ),
                  CommonUseContainer(
                      width: 200.w,
                      child: Column(
                        children: [
                          const HeadlineLargeText(
                              text: 'My Business ', color: Colors.white),
                          HeadlineLargeText(
                            text: user!.businessType ?? 'N/A',
                            color: Colors.white,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonUseContainer(
                          width: 150.w,
                          height: 50.h,
                          child: const HeadLineMediumText(
                              text: 'My Branches', color: Colors.black)),
                      SizedBox(width: 25.w,),

                      IconButton(onPressed: (){_showBranchOption(context);}, icon: Icon(Icons.add,size: 40,))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const BranchListGridView(),
                  ///-----
                  // CustomCircularButton(
                  //     text: 'BranchList',
                  //     onPressed: () async {
                  //       await branchViewModel.branchListFetch();
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(builder: (context) => MyBranchList() )
                  //       );
                  //     }
                  // )
                ] else
                  const Text('No user data available', style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
      );
    });
  }

  void _showBranchOption(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey,
          title: Text('Branch Options'),
          content: CommonUseContainer(
              width: 180.w,
              height: 70.h,
              child:  TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BranchCreate()));

                },
                child: HeadLineMediumText(
                    text: 'CreateBranch', color: Colors.black),
              ))
        );
      },
    );
  }


}


