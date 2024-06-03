import 'dart:ui';
import 'package:buisness_manager/modules/admin/view/user_profile.dart';
import 'package:buisness_manager/modules/admin/viewModel/user_profile_view_model.dart';
import 'package:buisness_manager/modules/auth/view/login.dart';
import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
import 'package:buisness_manager/modules/branch/view/branch_list_screen.dart';
import 'package:buisness_manager/modules/branch/view/widgets/branch_create.dart';
import 'package:buisness_manager/modules/branch/viewModel/branch_view_model.dart';
import 'package:buisness_manager/view/widget/common_use_container.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/no_internet_widget.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BranchViewInformationScreen extends StatefulWidget {
  const BranchViewInformationScreen({super.key});

  @override
  _BranchViewInformationScreenState createState() => _BranchViewInformationScreenState();
}

class _BranchViewInformationScreenState extends State<BranchViewInformationScreen> {
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    final userProfileViewModel = Provider.of<UserProfileViewModel>(context, listen: false);
    final branchViewModel = Provider.of<BranchViewModel>(context, listen: false);
    if(context.mounted){
      await branchViewModel.branchListFetch(context);
      await userProfileViewModel.getUserProfile(context);
    }
  }
  Future<bool> _onWillPop() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
       return await _onWillPop();
      },
      child: Consumer3<AuthViewModel, UserProfileViewModel, BranchViewModel>(
        builder: (context, authViewModel, userProfileViewModel, branchViewModel, child) {

          final user = userProfileViewModel.responseUser;
          return Provider.of<InternetConnectionStatus>(context) == InternetConnectionStatus.disconnected
              ? NoInternetWidget(onPressed: (){
             _loadData();
          },): Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.greenAccent,
                  leading: userProfileViewModel.isLoadingState
                      ? const CircularProgressIndicator(color: Colors.amber)
                      : IconButton(
                        onPressed: () async {
                          await userProfileViewModel.getUserProfile(context).then((value) {
                            if(value){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfile()));
                            }
                          });
                        },
                        icon: const Icon(Iconsax.user),
                      ),
                  title: Center(
                      child: Text(
                        'Welcome, ${user?.name??""}',
                        style: const TextStyle(fontSize: 20),
                      )
                  ),
                  actions: [
                    userProfileViewModel.isLoadingState
                        ? const CircularProgressIndicator(color: Colors.amber)
                        : IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () async {
                            await authViewModel.logOut(context).then((isLogout){
                            if(isLogout){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
                            }
                            });

                          },
                        ),
                  ],
                ),
                body: RefreshIndicator(
                  onRefresh: () async {
                    await _loadData();
                  },
                  child: CustomContainer(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:EdgeInsets.symmetric(vertical: 10.h),
                            child: Container(
                              width: 250.w,
                              height: 200.h,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(color: Colors.green.withOpacity(.7),),

                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      CarouselSlider(
                                        options: CarouselOptions(
                                          height: 200.h,
                                          autoPlay: true,
                                          autoPlayInterval: Duration(seconds: 6),
                                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          enlargeCenterPage: true,
                                          scrollDirection: Axis.horizontal,
                                          enableInfiniteScroll: true,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              _currentIndex = index;
                                            });
                                          },
                                        ),
                                        items: [
                                          'assets/business1.json',
                                          'assets/business2.json',
                                          'assets/business3.json',
                                        ].map((i) {
                                          return Builder(
                                            builder: (BuildContext context) {
                                              return Container(
                                                width: 365.w,
                                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                                child: Lottie.asset(i),
                                              );
                                            },
                                          );
                                        }).toList(),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AnimatedSmoothIndicator(
                            activeIndex: _currentIndex,
                            count: 3,
                            effect: ExpandingDotsEffect(
                              activeDotColor: Colors.blue,
                              dotColor: Colors.grey,
                              dotHeight: 8.h,
                              dotWidth: 8.w,
                              spacing: 4.w,
                            ),
                          ),
                          const SizedBox(height: 20),
                           !userProfileViewModel.isLoadingState &&!branchViewModel.isLoadingState && user!= null ?
                          Column(
                            children: [
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
                            ],
                          ) : CircularProgressIndicator(color: Colors.green,)
                        ],
                      ),
                    ),
                  ),
                ),
              );

        },
      ),
    );
  }
}

