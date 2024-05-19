import 'dart:developer';

import 'package:buisness_manager/modules/branch/view/branch_view_information.dart';
import 'package:buisness_manager/modules/customer/view/widget/customer_supplier_create.dart';
import 'package:buisness_manager/modules/customer/view/widget/customer_supplier_update.dart';
import 'package:buisness_manager/modules/customer/viewModel/customer_view_model.dart';
import 'package:buisness_manager/modules/transaction/view/widget/transaction_list.dart';
import 'package:buisness_manager/view/widget/common_use_container.dart';

import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../model/core/response_model/customer_list_response_model.dart';

class CustomerSupplierViewScreen extends StatefulWidget {
  dynamic name;
  String branchId;
  int customerOrSupplierType;

  CustomerSupplierViewScreen({super.key, this.name, required this.branchId, required this.customerOrSupplierType});

  @override
  State<CustomerSupplierViewScreen> createState() => _CustomerSupplierViewScreenState();
}

class _CustomerSupplierViewScreenState extends State<CustomerSupplierViewScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future _loadData() async {
    final customerViewModel = Provider.of<CustomerViewModel>(context, listen: false);
    await customerViewModel.customerListFetch(branchId: widget.branchId, customerOrSupplierType: widget.customerOrSupplierType);
  }


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _loadData();
      },
      child: Scaffold(
        body: CustomContainer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.h,),
                HeadlineLargeText(text: widget.name ?? 'No Name', color: Colors.white),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: CustomCircularButton(text: 'Add Customer', onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerOrSupplierCreate(id:widget.branchId,)));
                  }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: HeadLineMediumText(text: 'Customer List', color: Colors.white),
                ),
                Consumer<CustomerViewModel>(
                  builder: (context, customerViewModel, child) {
                    final customers=customerViewModel.customers?.customerList;
                   if(customerViewModel.isLoadingState){
                     return CircularProgressIndicator(color: Colors.green,);
                   } else if(customers == null){
                     return Text('No data');
                   }else{
                     return  GridView.builder(
                       shrinkWrap: true,
                         itemCount: customers.length,
                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2,
                           crossAxisSpacing: 10.0,
                           mainAxisSpacing: 10.0,
                         ), itemBuilder: (context ,index){
                       final customer=customers[index];
                       return Card(
                         child: InkWell(
                           onTap: (){
                             _showCustomerSupplierOption(context, widget.branchId ,customer.id.toString());
                           },
                           child: Column(
                             children: [
                               Text('${customer.name}'),
                               Text('${customer.id}'),
                               Text('${customer.phone}'),
                             ],
                           ),
                         ),
                       );
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

  void _showCustomerSupplierOption(BuildContext context, String branchId ,String customerOrSupplierId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Customer Supplier Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.remove_red_eye_rounded),
                title: const Text('View Transaction'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionList(customerSupplierID: customerOrSupplierId)));
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Update'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerOrSupplierUpdate(branchId: branchId, customerOrSupplierId: customerOrSupplierId,)));
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete'),
                onTap: () async {
              final customerViewModel=Provider.of<CustomerViewModel>(context);
              await customerViewModel.deleteCustomer(context, branchId: branchId, customerOrSupplierId: customerOrSupplierId).then((isDeleted){
                if(isDeleted){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BranchViewInformationScreen()), (route) => false);
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
