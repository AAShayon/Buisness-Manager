import 'package:buisness_manager/modules/customer/view/widget/customer_supplier_create.dart';
import 'package:buisness_manager/modules/customer/view/widget/customer_supplier_update.dart';
import 'package:buisness_manager/modules/customer/viewModel/customer_view_model.dart';
import 'package:buisness_manager/modules/transaction/view/transaction_screen.dart';
import 'package:buisness_manager/view/widget/animation/fadde_in_animation.dart';
import 'package:buisness_manager/view/widget/common_use_container.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/custom_table.dart';
import 'package:buisness_manager/view/widget/no_internet_widget.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class CustomerSupplierViewScreen extends StatefulWidget {
  final dynamic name;
  final String branchId;
  final int customerOrSupplierType;

  CustomerSupplierViewScreen(
      {super.key,
      this.name,
      required this.branchId,
      required this.customerOrSupplierType});

  @override
  State<CustomerSupplierViewScreen> createState() =>
      _CustomerSupplierViewScreenState();
}

class _CustomerSupplierViewScreenState
    extends State<CustomerSupplierViewScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final customerViewModel = Provider.of<CustomerViewModel>(context, listen: false);
      customerViewModel.resetPage();
      customerViewModel.clearList();
      final page = customerViewModel.page;
      _loadData(context, page: page.toString());
      scrollController.addListener(_scrollListener);
    });
  }

  Future<void> _loadData(BuildContext context, {dynamic page, dynamic limit}) async {
    final customerViewModel = Provider.of<CustomerViewModel>(context, listen: false);
    await customerViewModel.customerListFetch(context, branchId: widget.branchId, customerOrSupplierType: widget.customerOrSupplierType, page: page.toString(), limit: 10);
  }

  void _scrollListener() {
    final customerViewModel = Provider.of<CustomerViewModel>(context, listen: false);
    final isLoading = customerViewModel.isLoadingState;
    final branchList = customerViewModel.customer;
    if (!isLoading &&
        branchList.length >= 10 && scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      customerViewModel.pageCounter(context: context);
      final page = customerViewModel.page;
      _loadData(context, page: page.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerViewModel>(
      builder: (context, customerViewModel, child) {
        final customerList = customerViewModel.customer;
        return RefreshIndicator(
          onRefresh: () async {
            setState(() {
              customerViewModel.resetPage();
              customerViewModel.clearList();
            });
            await _loadData(context, limit: 10, page: 1);
            return Future<void>.delayed(const Duration(seconds: 2));
          },
          child: Scaffold(
            body: Provider.of<InternetConnectionStatus>(context) ==
                    InternetConnectionStatus.disconnected
                ? NoInternetWidget(
                    onPressed: () {
                      setState(() {
                        customerViewModel.resetPage();
                        customerViewModel.clearList();
                      });
                      _loadData(context, limit: 10, page: 1);
                    },
                  )
                : CustomContainer(
                    child: ListView(
                      controller: scrollController,
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
                          child: CommonUseContainer(
                            color: Colors.greenAccent,
                            height: 100.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FadeInAnimation(
                                  delay: 10,direction: FadeInDirection.rtl,fadeOffset: 40,
                                  child: HeadlineLargeText(
                                      text: 'Branch Name ',
                                      color: Colors.white),
                                ),
                                HeadlineLargeText(
                                  text: widget.name,
                                  color: Colors.white,
                                ),
                              ],
                            ),),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 100.w),
                          child: CustomCircularButton(
                            text: widget.customerOrSupplierType == 0
                                ? 'Add Customer'
                                : 'Add Supplier',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CustomerOrSupplierCreate(
                                    branchID: widget.branchId,
                                    customerOrSupplierType:
                                        widget.customerOrSupplierType,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h,horizontal:100.w ),
                          child: Center(
                            child: CommonUseContainer(
                              height: 59.h,
                              width: 200.w,
                              color: Colors.greenAccent,
                              child: Center(
                                child: HeadLineMediumText(
                                  text: widget.customerOrSupplierType == 0
                                      ? 'Customer List'
                                      : 'Supplier List',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                          child: Card(
                            color: Colors.greenAccent,
                            child: Row(
                              children: [
                                CustomTableWithBorder(text: 'Serial',topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),width: 80.w,),
                               CustomTableWithBorder(text: 'ID',topLeft: Radius.circular(0),topRight: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0), width: 60.w,),
                               CustomTableWithBorder(text: 'Name',topLeft: Radius.circular(0),topRight: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0), width: 80.w,),
                               CustomTableWithBorder(text: 'Number',topLeft: Radius.circular(0),topRight: Radius.circular(10),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(10), width: 107.w,),

                              ],
                            ),
                          ),
                        ),
                        customerList.isNotEmpty
                            ?
                        ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: customerList.length,
                                itemBuilder: (context, index) {
                                  final customer = customerList[index];
                                if(index < customerList.length)  {
                                    return FadeInAnimation(
                                      direction: FadeInDirection.rtl,
                                      delay: 1.0 + index,
                                      fadeOffset:
                                          index == 0 ? 80 : 80.0 * index,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:20.w),
                                        child:
                                        Card(
                                          color: Colors.greenAccent,
                                          child:InkWell(
                                            onTap: (){
                                              _showCustomerOption(context,  customer.id, widget.customerOrSupplierType, widget.branchId,customer.name);
                                            },
                                            child: Row(
                                              children: [
                                                CustomTableWithBorder(text: '${index+1}', topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),width: 80.w,),
                                                CustomTableWithBorder(text: '${customer.id}',topLeft: Radius.circular(0),topRight: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0), width: 60.w,),
                                                CustomTableWithBorder(text: '${customer.name}',topLeft: Radius.circular(0),topRight: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0), width: 80.w,),
                                                CustomTableWithBorder(text: '${customer.phone}',topLeft: Radius.circular(0),topRight: Radius.circular(10),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(10), width: 107.w,),
                                              ],
                                            ),
                                          )
                                        ),
                                      ),
                                    );
                                  }
                                else{
                                  return Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Center(
                                      child: Text(
                                        "No Customer",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18.sp),
                                      ),
                                    ),
                                  );
                                }
                                },
                              )
                            :
                        Center(
                                child: HeadLineMediumText(
                                  text: widget.customerOrSupplierType == 0
                                      ? 'No Customer Found'
                                      : 'No Supplier Found',
                                  color: Colors.white,
                                ),
                              ),
                        customerViewModel.isLoadingState
                            ?
                        Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      color: Colors.greenAccent,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    HeadLineMediumText(
                                      text: widget.customerOrSupplierType == 0
                                          ? 'Loading Customer List'
                                          : 'Loading Supplier List',
                                      color: Colors.greenAccent,
                                    )
                                  ],
                                ),
                              )
                            : SizedBox.shrink(),
                        SizedBox(height: 25.h,)
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
  void _showCustomerOption(BuildContext context, int customerSupplierID,int customerOrSupplierType,String branchId,String customerName) {
    final customerViewModel = Provider.of<CustomerViewModel>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.greenAccent,
          title: Text(widget.customerOrSupplierType == 0
              ? ' Customer Option'
              : ' Supplier Option',
            style: TextStyle(color:Colors.black),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.remove_red_eye_rounded),
                title: const Text('Transaction List'),
                onTap: () async {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionScreen(
                        customerSupplierID: customerSupplierID.toString(),
                        branchID: branchId,
                        customerSupplierType: customerOrSupplierType,
                        customerName:customerName ,
                      ),
                    ),
                  ).then((value) {
                    if(context.mounted){
                      Navigator.of(context).pop();
                    }
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
                      builder: (context) => CustomerOrSupplierUpdate(
                        branchId: branchId,
                        customerOrSupplierId: customerSupplierID.toString(),
                        customerSupplierType: customerOrSupplierType,
                      ),
                    ),
                  );
                  // log("============================>${id}");
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete'),
                onTap: () async {
                  Navigator.of(context).pop();
                  final isDeleted = await customerViewModel.deleteCustomer(
                    context,
                    branchId: branchId,
                    customerOrSupplierId: customerSupplierID.toString(),
                  );
                  if (isDeleted) {
                    await customerViewModel.customerListFetch(
                      context,
                      branchId: branchId,
                      customerOrSupplierType: customerOrSupplierType,
                      page: 1,
                      limit: 10,
                    ).then((isFetched) {
                      Navigator.pop(context);
                    });
                  }

                },
              ),
            ],
          ),
        );
      },
    );
  }
}


