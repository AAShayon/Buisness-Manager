import 'package:buisness_manager/modules/transaction/view/widget/transaction_create.dart';
import 'package:buisness_manager/modules/transaction/view/widget/transaction_list.dart';
import 'package:buisness_manager/modules/transaction/view/widget/transaction_update.dart';
import 'package:buisness_manager/modules/transaction/viewModel/transaction_view_model.dart';
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
import 'package:intl/intl.dart';

class TransactionScreen extends StatefulWidget {
  final String customerSupplierID;
  final String customerName;
  final String branchID;
  final int customerSupplierType;

  const TransactionScreen({super.key, required this.customerSupplierID, required this.branchID, required this.customerSupplierType, required this.customerName});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final transactionViewModel=Provider.of<TransactionViewModel>(context,listen: false);
       transactionViewModel.resetPage();
       transactionViewModel.clearList();
       final page=transactionViewModel.page;
       _loadData(context,page: page.toString());
       scrollController.addListener(_scrollListener);
    });
  }

  Future _loadData(BuildContext context,{dynamic page, dynamic limit}) async {
    final transactionViewModel = Provider.of<TransactionViewModel>(context, listen: false);
    await transactionViewModel.transactionListFetch(branchID: widget.branchID, customerOrSupplierID: widget.customerSupplierID,  context, page: page.toString(), limit: 10);
  }

  void _scrollListener(){
    final transactionViewModel=Provider.of<TransactionViewModel>(context,listen: false);
    final isLoading=transactionViewModel.isLoadingState;
    final transactionList=transactionViewModel.transaction;
    if(!isLoading && transactionList.length >=10 && scrollController.position.pixels == scrollController.position.maxScrollExtent){
      transactionViewModel.pageCounter(context: context);
      final page=transactionViewModel.page;
      _loadData(context,page: page.toString());
    }
  }


  String? _formatDateTime(String? dateTime) {
    if (dateTime == null) return null;
    DateTime parsedDate = DateTime.parse(dateTime);
    return DateFormat('hh:mm a yyyy-MM-dd').format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    // final transactionViewModel=Provider.of<TransactionViewModel>(context,listen: false);
    return  Consumer<TransactionViewModel>(
      builder: (context,transactionViewModel,child) {
        final transactionList=transactionViewModel.transaction;
        return RefreshIndicator(
          onRefresh: () async {
            setState(() {
              transactionViewModel.resetPage();
              transactionViewModel.clearList();
            });
            await _loadData(context,limit: 10,page: 1);
          },
          child: Scaffold(
            body:Provider.of<InternetConnectionStatus>(context) == InternetConnectionStatus.disconnected
                ? NoInternetWidget(
              onPressed: () {
                _loadData(context,limit: 10,page: 1);
              },
            )
                : CustomContainer(
                  child: ListView(
                    controller: scrollController,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                      children: [
                    SizedBox(height: 10.h),
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
                                      text:  widget.customerSupplierType == 0
                                          ? 'Customer Name'
                                          : 'Supplier Name',
                                      color: Colors.white,),
                                ),
                                HeadlineLargeText(
                                  text: widget.customerName,
                                  color: Colors.white,
                                ),
                              ],
                            ),),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 80.w),
                          child: CustomCircularButton(
                            text: 'Create Transaction',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TransactionCreate(
                                        branchID: widget.branchID,
                                        customerOrSupplierId: widget.customerSupplierID,
                                        customerSupplierType: widget.customerSupplierType,
                                      )));
                            },
                          ),
                        ),
                        Padding(
                      padding:EdgeInsets.symmetric(vertical: 10.h,horizontal:100.w ),
                      child: HeadlineLargeText(
                          text: 'Transaction List',
                          color: Colors.white),
                    ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),
                          child: Card(
                            color: Colors.greenAccent,
                            child: Row(
                              children: [
                                CustomTableWithBorder(text: 'Transaction No ',topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),width: 70.w,fontSize: 9.5.sp,),
                                CustomTableWithBorder(text: 'Amount',topLeft: Radius.circular(0),topRight: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0), width: 45.w,fontSize: 9.5.sp,),
                                CustomTableWithBorder(text: 'Details',topLeft: Radius.circular(0),topRight: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0), width: 100.w,fontSize: 9.5.sp,),
                                CustomTableWithBorder(text: 'Bill No',topLeft: Radius.circular(0),topRight: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0), width: 40.w,fontSize: 9.5.sp,),
                                CustomTableWithBorder(text: 'Date ',topLeft: Radius.circular(0),topRight: Radius.circular(10),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(10), width: 102.w,fontSize: 9.5.sp,),
                              ],
                            ),
                          ),
                        ),

                    transactionList.isNotEmpty ?
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: transactionList.length,
                      itemBuilder: (context, index) {
                        final transaction = transactionList[index];
                        if(index < transactionList.length)  {
                          return FadeInAnimation(
                            direction: FadeInDirection.rtl,
                            delay: 1.0 + index,
                            fadeOffset:
                            index == 0 ? 80 : 80.0 * index,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:5.w),
                              child:
                              Card(
                                  color: Colors.greenAccent,
                                  child:InkWell(
                                    onTap: (){

                                      _showTransactionOption(context, branchID: widget.branchID, transactionID: transaction.id.toString(), customerID: widget.customerSupplierID, billID: transaction.billNo.toString());
                                    },
                                    child: Row(
                                      children: [
                                        CustomTableWithBorder(text: '${transaction.transactionNo} ',topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),width: 70.w,fontSize: 9.5.sp,),
                                        CustomTableWithBorder(text: '${transaction.amount}',topLeft: Radius.circular(0),topRight: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0), width: 45.w,fontSize: 9.5.sp,),
                                        CustomTableWithBorder(text: '${transaction.details}',topLeft: Radius.circular(0),topRight: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0), width: 100.w,fontSize: 9.5.sp,),
                                        CustomTableWithBorder(text: '${transaction.billNo}',topLeft: Radius.circular(0),topRight: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0), width: 40.w,fontSize: 9.5.sp,),
                                        CustomTableWithBorder(text: '${_formatDateTime(transaction.transactionDate) }',topLeft: Radius.circular(0),topRight: Radius.circular(10),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(10), width: 102.w,fontSize: 9.5.sp,),

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
                        text: 'No Transaction Found',
                        color: Colors.white,
                      ),
                    ),
                    transactionViewModel.isLoadingState
                        ? Center(
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
                            text: 'Loading Transaction List',
                            color: Colors.greenAccent,
                          )
                        ],
                      ),
                    ) : SizedBox.shrink()

                  ],
                ),
            ),

          ),
        );
      }
    );
  }

  void _showTransactionOption(BuildContext context,
      {required String branchID, required String transactionID, required String customerID, required String billID}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.greenAccent,
          title: const Text('Transaction Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Update'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TransactionUpdate(
                          transactionID: transactionID,
                          branchID: branchID,
                          customerID: customerID,
                          customerSupplierType: widget.customerSupplierType,
                        )),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete'),
                onTap: () async {
                  final transactionViewModel = Provider.of<TransactionViewModel>(context, listen: false);
                  await transactionViewModel.deleteTransaction(context, branchID: branchID, transactionID: transactionID).then((isDeleted) async {
                    if (isDeleted) {
                      await transactionViewModel
                          .transactionListFetch(context, branchID: branchID, customerOrSupplierID: customerID)
                          .then((isFetched) {
                        if (isFetched) {
                          Navigator.pop(context);
                        }
                      });
                    }
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
//        child: CustomContainer(
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 15.h),
//                 HeadlineLargeText(
//                     text: widget.customerSupplierType == 0 ? 'Customer List' : 'Supplier List',
//                     color: Colors.white),
//                 SizedBox(height: 15.h),
//                 HeadlineLargeText(text: 'ID ${widget.customerSupplierID}', color: Colors.white),
//                 SizedBox(height: 10.h),
//                 CustomCircularButton(
//                   text: 'Create Transaction',
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => TransactionCreate(
//                               branchID: widget.branchID,
//                               customerOrSupplierId: widget.customerSupplierID,
//                               customerSupplierType: widget.customerSupplierType,
//                             )));
//                   },
//                 ),
//                 SizedBox(height: 20.h),
//                 _buildTransactionList()
//               ],
//             ),
//           ),
//         ),