import 'package:buisness_manager/modules/branch/view/branch_view_information.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_update_request_model.dart';
import 'package:buisness_manager/modules/transaction/view/transaction_screen.dart';
import 'package:buisness_manager/modules/transaction/viewModel/transaction_view_model.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/custom_text_from_filed.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionUpdate extends StatefulWidget {
   final String transactionID;
   final String branchID;
   final String customerID;
   final int customerSupplierType;
  const TransactionUpdate({super.key, required this.transactionID, required this.branchID, required this.customerID, required this.customerSupplierType,});

  @override
  State<TransactionUpdate> createState() => _TransactionUpdateState();
}

class _TransactionUpdateState extends State<TransactionUpdate> {
  final _transactionUpdateFormKey = GlobalKey<FormState>();

  final TextEditingController amountController = TextEditingController();
  final TextEditingController transactionDateController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController billController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    transactionDateController.dispose();
    detailsController.dispose();
    billController.dispose();
    super.dispose();
  }
  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime finalDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          transactionDateController.text = DateFormat('yyyy-MM-dd HH:mm').format(finalDateTime);
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
        child: Form(
          key: _transactionUpdateFormKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: HeadlineLargeText(text: 'Transaction Update', color: Colors.white),
                ),
                Container(
                  width: 350.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hintText: 'Amount',
                          prefixIcon: Iconsax.money,
                          textInputTypeKeyboard: TextInputType.number,
                          controller: amountController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter amount';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.h),
                        GestureDetector(
                          onTap: () async {
                            _selectDateTime(context);
                          },
                          child: AbsorbPointer(child: CustomTextFormField(controller: transactionDateController, hintText: 'Add Date', textInputTypeKeyboard: TextInputType.name, prefixIcon: Icons.date_range_sharp,
                          )),
                        ),
                        SizedBox(height: 15.h),
                        CustomTextFormField(
                          hintText: 'Details',
                          prefixIcon: Icons.details,
                          textInputTypeKeyboard: TextInputType.text,
                          controller: detailsController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter details';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.h),
                        CustomTextFormField(
                          hintText: 'Bill No',
                          prefixIcon: Icons.receipt,
                          textInputTypeKeyboard: TextInputType.number,
                          controller: billController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter bill number';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                CustomCircularButton(
                  text: 'Update',
                  onPressed: () async {
                    if (_transactionUpdateFormKey.currentState!.validate()) {
                      final transactionUpdateRequestModel = TransactionUpdateRequestModel(
                        amount: amountController.text,
                        billNo:billController.text,
                        details: detailsController.text,
                        transactionDate: transactionDateController.text,
                      );
                      final transactionViewModel = Provider.of<TransactionViewModel>(context, listen: false);
                      await transactionViewModel.updateTransaction(transactionUpdateRequestModel, context, branchID: widget.branchID,transactionID: widget.transactionID).then((value) async{
                        await transactionViewModel.transactionListFetch(context, branchID: widget.branchID, customerOrSupplierID: widget.customerID,limit: 10,page: 1).then((isFetched) {
                          Navigator.pop(context);
                        });

                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}