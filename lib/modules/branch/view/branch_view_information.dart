import 'dart:developer';
import 'dart:ui';
import 'package:buisness_manager/modules/admin/view/user_profile.dart';
import 'package:buisness_manager/modules/admin/viewModel/user_profile_view_model.dart';
import 'package:buisness_manager/modules/auth/view/login.dart';
import 'package:buisness_manager/modules/auth/viewModel/auth_view_model.dart';
import 'package:buisness_manager/modules/branch/view/widgets/branch_create.dart';
import 'package:buisness_manager/modules/branch/view/widgets/branch_update.dart';
import 'package:buisness_manager/modules/branch/viewModel/branch_view_model.dart';
import 'package:buisness_manager/modules/customer/view/customer_supplier_list_screen.dart';
import 'package:buisness_manager/view/widget/common_use_container.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/no_internet_widget.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
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
  _BranchViewInformationScreenState createState() =>
      _BranchViewInformationScreenState();
}

class _BranchViewInformationScreenState
    extends State<BranchViewInformationScreen> {
  int _currentIndex = 0;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final branchViewModel =
          Provider.of<BranchViewModel>(context, listen: false);
      branchViewModel.resetPage();
      branchViewModel.clearList();
      final page = branchViewModel.page;
      _loadData(context, page: page.toString());
      scrollController.addListener(_scrollListener);
    });
  }

  Future<void> _loadData(BuildContext context,
      {dynamic page, dynamic limit}) async {
    final userProfileViewModel =
        Provider.of<UserProfileViewModel>(context, listen: false);
    final branchViewModel =
        Provider.of<BranchViewModel>(context, listen: false);

    if (context.mounted) {
      await branchViewModel.branchListFetch(context,
          page: page.toString(), limit: 10);
      await userProfileViewModel.getUserProfile(context);
    }
  }

  void _scrollListener() {
    final branchViewModel =
        Provider.of<BranchViewModel>(context, listen: false);
    final isLoading = branchViewModel.isLoadingState;
    // final isLoadMore=branchViewModel.isLoadMore;
    final branchlist = branchViewModel.branch;
    if (!isLoading &&
        branchlist.length >= 10 &&
        scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
      branchViewModel.pageCounter(context: context);
      final page = branchViewModel.page;
      _loadData(context, page: page.toString());
      print('Scrolling');
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
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _onWillPop();
      },
      child: Consumer3<AuthViewModel, UserProfileViewModel, BranchViewModel>(
        builder: (context, authViewModel, userProfileViewModel, branchViewModel,
            child) {
          final user = userProfileViewModel.responseUser;
          final branchList = branchViewModel.branch;
          return RefreshIndicator(
            color: Colors.greenAccent,
            onRefresh: () async {

              setState(() {
                branchViewModel.resetPage();
                branchViewModel.clearList();
              });
              await _loadData(context, page: 1, limit: 10);
              return Future<void>.delayed(const Duration(seconds: 2));
            },
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.greenAccent,
                leading: userProfileViewModel.isLoadingState
                    ? const CircularProgressIndicator(color: Colors.amber)
                    : IconButton(
                        onPressed: () async {
                          await userProfileViewModel
                              .getUserProfile(context)
                              .then((value) {
                            if (value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const UserProfile()));
                            }
                          });
                        },
                        icon: const Icon(Iconsax.user),
                      ),
                title: Center(
                    child: Text(
                  'Welcome, ${user?.name ?? ""}',
                  style: const TextStyle(fontSize: 20),
                )),
                actions: [
                  userProfileViewModel.isLoadingState ? const CircularProgressIndicator(color: Colors.amber)
                      : IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () async {
                            await authViewModel.logOut(context).then((isLogout) {
                              if (isLogout) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
                              }
                            });
                          },
                        ),
                ],
              ),
              body: Provider.of<InternetConnectionStatus>(context) ==
                      InternetConnectionStatus.disconnected
                  ? NoInternetWidget(
                      onPressed: () {
                        _loadData(context, page: 1, limit: 10);
                      },
                    )
                  : ListView(
                    controller: scrollController,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 25.w),
                        child: Container(
                          height: 200.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.greenAccent
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  color: Colors.green.withOpacity(.7),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 10.0, sigmaY: 10.0),
                                  child: Container(
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                ),
                              ),
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 200.h,
                                  autoPlay: true,
                                  autoPlayInterval:
                                      Duration(seconds: 6),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
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
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Lottie.asset(i),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: AnimatedSmoothIndicator(
                          activeIndex: _currentIndex,
                          count: 3,
                          effect: ExpandingDotsEffect(
                            activeDotColor: Colors.greenAccent,
                            dotColor: Colors.grey,
                            dotHeight: 8.h,
                            dotWidth: 8.w,
                            spacing: 4.w,
                          ),
                        ),
                      ),
                      ///
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
                        child: CommonUseContainer(
                          color: Colors.greenAccent,
                          height: 100.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeadlineLargeText(
                                text: 'My Business ',
                                color: Colors.white),
                            HeadlineLargeText(
                              text: user?.businessType ?? 'Not Available',
                              color: Colors.white,
                            ),
                          ],
                        ),),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 37.h,
                           width: 150.w,
                           decoration: BoxDecoration(
                             color: Colors.greenAccent,
                             borderRadius: BorderRadius.circular(10),
                           ),
                            child: Center(
                              child: Text('My Branches',style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),)
                            ),
                          ),
                          const SizedBox(width: 25),
                          CustomCircularButton(
                              text: 'Create Branch',
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const BranchCreate()));
                              }),
                        ],
                      ),
                      branchList.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 10.h),
                              child: GridView.builder(
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                ),
                                itemCount: branchList.length,
                                itemBuilder: (context, index) {
                                  final branch = branchList[index];
                                  // log('total branch-===>${branchList.length}');
                                  if (index < branchList.length) {
                                    return CommonUseContainer(
                                      color: Colors.greenAccent,
                                      child: Card(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h,
                                              horizontal: 8.w),
                                          child: InkWell(
                                            onTap: () {
                                              log('===================> ${branchList[index]}');
                                              _showBranchOption(
                                                context,
                                                branch.name,
                                                branch.id!,
                                                // branchIndex: index
                                              );
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("${branch.id}",style: TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontSize: 15.sp,
                                                )),
                                                Text(branch.name ?? '',style: TextStyle(
                                                  color: Colors.greenAccent,
                                                  fontSize: 15.sp,
                                                ),),
                                                Icon(Icons.business, size: 40.sp,color: Colors.greenAccent,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Center(
                                        child: Text(
                                          "No Branch",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 18.sp),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            )
                          : SizedBox.shrink(),
                      branchViewModel.isLoadingState == false
                          ? SizedBox()
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    'Loading Branches......',
                                    style: TextStyle(
                                        color: Colors.greenAccent,
                                        fontSize: 18.sp),
                                  )
                                ],
                              ),
                            ),
                      // BranchListGridView(scrollController: scrollController,)
                      const SizedBox(height: 20)
                    ],
                  ),
            ),
          );
        },
      ),
    );
  }

  void _showBranchOption(BuildContext context, dynamic name, num id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Branch Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.remove_red_eye_rounded),
                title: const Text('Customer List'),
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerSupplierViewScreen(
                        name: name,
                        branchId: id.toString(),
                        customerOrSupplierType: 0,
                      ),
                    ),
                  ).then((value) {
                    Navigator.of(context).pop();
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.remove_red_eye_rounded),
                title: const Text('Supplier List'),
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerSupplierViewScreen(
                        name: name,
                        branchId: id.toString(),
                        customerOrSupplierType: 1,
                      ),
                    ),
                  ).then((value) {
                    Navigator.of(context).pop();
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Update'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BranchUpdate(
                                id: id,
                              )));
                  // log("============================>${id}");
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete'),
                onTap: () {
                  Navigator.of(context).pop();
                  showDialog<bool>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext deleteContext) {
                      return AlertDialog(
                        title: Text('Confirm Delete'),
                        content: Text(
                            'Are you sure you want to delete your Branch?'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('No'),
                            onPressed: () {
                              Navigator.of(deleteContext).pop();
                              // Navigator.of(showDialogContext).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Yes'),
                            onPressed: () async {
                              final branchViewModel =
                                  Provider.of<BranchViewModel>(deleteContext,
                                      listen: false);
                              await branchViewModel
                                  .deleteBranch(
                                      context: deleteContext,
                                      branchId: id.toString())
                                  .then((isDeleted) async {
                                if (isDeleted) {
                                  Navigator.of(deleteContext).pop();
                                }
                              });
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
