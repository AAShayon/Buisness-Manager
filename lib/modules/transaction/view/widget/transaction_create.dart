import 'package:buisness_manager/modules/branch/view/branch_view_information.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_create_request_model.dart';
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

class TransactionCreate extends StatefulWidget {
  final String branchID;
  final String customerOrSupplierId;
  const TransactionCreate({super.key, required this.branchID, required this.customerOrSupplierId});

  @override
  State<TransactionCreate> createState() => _TransactionCreateState();
}

class _TransactionCreateState extends State<TransactionCreate> {
  final _transactionCreateFormKey = GlobalKey<FormState>();

  final TextEditingController amountController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController transactionDateController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController billNoController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    typeController.dispose();
    transactionDateController.dispose();
    detailsController.dispose();
    billNoController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
        child: Form(
          key: _transactionCreateFormKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: HeadlineLargeText(text: 'Transaction Create', color: Colors.white),
                ),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Transaction Type',
                      prefixIcon: Icon(Icons.swap_horiz),
                      border: OutlineInputBorder(),
                    ),
                    value: typeController.text.isEmpty ? null : typeController.text,
                    items: const [
                      DropdownMenuItem<String>(
                        value: '0',
                        child: Text('You get'),
                      ),
                      DropdownMenuItem<String>(
                        value: '1',
                        child: Text('You gave'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        typeController.text = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select transaction type';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      transactionDateController.text = pickedDate.toLocal().toString(); // Use toLocal as a property
                    }
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
                  controller: billNoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter bill number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                CustomCircularButton(
                  text: 'Create',
                  onPressed: () async {
                    if (_transactionCreateFormKey.currentState!.validate()) {
                      final transactionCreateRequestModel = TransactionCreateRequestModel(
                        amount: amountController.text,
                        billNo: billNoController.text,
                        customerId: widget.customerOrSupplierId,
                        type: typeController.text,
                        details: detailsController.text,
                        transactionDate: transactionDateController.text,
                      );
                      final transactionViewModel = Provider.of<TransactionViewModel>(context, listen: false);
                      await transactionViewModel.createTransaction(transactionCreateRequestModel, context, branchID: widget.branchID).then((value) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TransactionScreen(customerSupplierID: widget.customerOrSupplierId, branchID: widget.branchID)));
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
