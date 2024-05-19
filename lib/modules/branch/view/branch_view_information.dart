import 'package:buisness_manager/modules/admin/view/user_profile.dart';
import 'package:buisness_manager/modules/admin/viewModel/user_profile_view_model.dart';
import 'package:buisness_manager/modules/auth/model/core/response_model/logIn_response_model.dart';
import 'package:buisness_manager/modules/auth/view/login.dart';
import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
import 'package:buisness_manager/modules/branch/view/branch_list_screen.dart';
import 'package:buisness_manager/modules/branch/view/widgets/branch_create.dart';
import 'package:buisness_manager/modules/branch/viewModel/branch_view_model.dart';
import 'package:buisness_manager/view/widget/common_use_container.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';


class BranchViewInformationScreen extends StatefulWidget {
  const BranchViewInformationScreen({super.key});

  @override
  _BranchViewInformationScreenState createState() => _BranchViewInformationScreenState();
}

class _BranchViewInformationScreenState extends State<BranchViewInformationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    final userProfileViewModel = Provider.of<UserProfileViewModel>(context, listen: false);
    final branchViewModel = Provider.of<BranchViewModel>(context, listen: false);
    await branchViewModel.branchListFetch();
    await userProfileViewModel.getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<AuthViewModel, UserProfileViewModel, BranchViewModel>(
      builder: (context, authViewModel, userProfileViewModel, branchViewModel, child) {

        final user = userProfileViewModel.responseUser;
        return !authViewModel.isLoadingState&&!userProfileViewModel.isLoadingState&&!branchViewModel.isLoadingState&&user!=null
            ?Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.greenAccent,
                leading: userProfileViewModel.isLoadingState
                    ? const CircularProgressIndicator(color: Colors.amber)
                    : IconButton(
                      onPressed: () async {
                        await userProfileViewModel.getUserProfile();
                        if (context.mounted) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfile()));
                        }
                      },
                      icon: const Icon(Iconsax.user),
                    ),
                title: Center(
                    child: Text(
                      'Welcome, ${user.name??""}',
                      style: const TextStyle(fontSize: 20),
                    )
                ),
                actions: [
                  userProfileViewModel.isLoadingState
                      ? const CircularProgressIndicator(color: Colors.amber)
                      : IconButton(
                        icon: const Icon(Icons.logout),
                        onPressed: () async {
                          await authViewModel.logOut(context);
                          if (context.mounted) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
                          }
                        },
                      ),
                ],
              ),
              body: RefreshIndicator(
                onRefresh: () async {
                  await _loadData();
                },
                child: CustomContainer(
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          CommonUseContainer(
                            width: 200.w,
                            child: Column(
                              children: [
                                const Expanded(
                                  child: HeadlineLargeText(
                                      text: 'My Business ', color: Colors.white),
                                ),
                                HeadlineLargeText(
                                  text: user.businessType ?? 'Not Available',
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonUseContainer(
                                color: Colors.greenAccent.withOpacity(.5),
                                width: 150.w,
                                height: 50.h,
                                child: Center(
                                  child: HeadLineSmallText(
                                    text: 'My Branches',
                                    color: Colors.white,
                                    fontsize: 17.spMin,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 25),
                              CustomCircularButton(
                                  text: 'Create Branch',
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const BranchCreate()));
                                  }),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const BranchListGridView()
                          // if (branchViewModel.isLoadingState)
                          //   const CircularProgressIndicator()
                          // else if (branchViewModel.branches != null&&branchViewModel.branches!.branches!=null)
                          //   BranchListGridView(branches: branchViewModel.branches!.branches!)
                          // else
                          //   const Text('No branches found'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
            :const Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: Colors.amber),
              ),
            );
      },
    );
  }
}

