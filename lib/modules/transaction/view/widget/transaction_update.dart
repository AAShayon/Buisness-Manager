import 'package:buisness_manager/modules/branch/view/branch_view_information.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_create_request_model.dart';
import 'package:buisness_manager/modules/transaction/model/core/request_model/transaction_update_request_model.dart';
import 'package:buisness_manager/modules/transaction/view/widget/transaction_list.dart';
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
  // final String? transactionID;
  const TransactionUpdate({super.key,});

  @override
  State<TransactionUpdate> createState() => _TransactionUpdateState();
}

class _TransactionUpdateState extends State<TransactionUpdate> {
  final _transactionFormKey = GlobalKey<FormState>();

  final TextEditingController amountController = TextEditingController();
  final TextEditingController transactionDateController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController billNoController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
 



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
      body: CustomContainer(child:  Form(
        key: _transactionFormKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 20.h),child:  HeadlineLargeText(text: 'Transaction Update', color: Colors.white),),
              SizedBox(height: 15.h),
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
              CustomTextFormField(
                hintText: 'Transaction Date',
                prefixIcon: Icons.calendar_today,
                textInputTypeKeyboard: TextInputType.datetime,
                controller: transactionDateController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter transaction date';
                  }
                  try {
                    DateFormat('yyyy-MM-dd HH:mm:ss').parse(value);
                  } catch (e) {
                    return 'Please enter a valid date format';
                  }
                  return null;
                },
                onTap: () async {
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
                      transactionDateController.text =
                          DateFormat('yyyy-MM-dd HH:mm:ss')
                              .format(finalDateTime);
                    }
                  }
                },
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
              CustomCircularButton(text: 'Create', onPressed: () async{
                if (_transactionFormKey.currentState!.validate()) {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> TransactionList(customerSupplierID: '45')));
                  final transactionUpdateRequestModel=TransactionUpdateRequestModel(

                    amount: amountController.text,
                    billNo: billNoController.text,
                    details: detailsController.text,
                    transactionDate: transactionDateController.text,
                  );
                  final transactionViewModel=Provider.of<TransactionViewModel>(context);
               await   transactionViewModel.updateTransaction(transactionUpdateRequestModel, context).then((value){
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BranchViewInformationScreen()));
               });

                }

              })

            ],
          ),
        ),
      ),),
    );
  }
}

