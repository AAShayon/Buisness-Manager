
import 'package:buisness_manager/modules/transaction/view/widget/transaction_create.dart';
import 'package:buisness_manager/modules/transaction/view/widget/transaction_list.dart';
import 'package:buisness_manager/modules/transaction/viewModel/transaction_view_model.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/no_internet_widget.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';


class TransactionScreen extends StatefulWidget {
  final String customerSupplierID;
  final String branchID;
  final int customerSupplierType;

  const TransactionScreen({super.key, required this.customerSupplierID, required this.branchID, required this.customerSupplierType});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future _loadData() async {
    final transactionViewModel = Provider.of<TransactionViewModel>(context, listen: false);
    await transactionViewModel.transactionListFetch(branchID: widget.branchID, customerOrSupplierID: widget.customerSupplierID,context);
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<InternetConnectionStatus>(context) == InternetConnectionStatus.disconnected
        ? NoInternetWidget(
      onPressed: () {
        _loadData();
      },
    )
        :  Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
         await _loadData();
        },
        child: CustomContainer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15.h),
                HeadlineLargeText(text:  widget.customerSupplierType == 0
                    ? 'Customer List'
                    : 'Supplier List', color: Colors.white),
                SizedBox(height: 15.h),
                HeadlineLargeText(text: 'ID ${widget.customerSupplierID}', color: Colors.white),
                SizedBox(height: 10.h),
                CustomCircularButton(
                  text: 'Create Transaction',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionCreate(branchID: widget.branchID, customerOrSupplierId: widget.customerSupplierID, customerSupplierType: widget.customerSupplierType,)));
                  },
                ),
                SizedBox(height: 20.h),
                TransactionList(branchID:widget.branchID ,customerSupplierID: widget.customerSupplierID, customerSupplierType: widget.customerSupplierType,)
              ],
            ),
          ),
        ),
      ),
    );
  }

}
