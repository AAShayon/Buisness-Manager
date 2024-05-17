import 'package:buisness_manager/modules/customer/view/widget/customer_supplier_update.dart';
import 'package:buisness_manager/modules/transaction/view/widget/transaction_list.dart';
import 'package:buisness_manager/view/widget/common_use_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomerList extends StatelessWidget {
  final String branchID;
  const CustomerList({super.key, required this.branchID});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:1000.h,
      width: 300.w,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {

          return CommonUseContainer(
            child: Card(
                child:Padding(padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w)
                  ,child: InkWell(
                    onTap: (){
                _showCustomerSupplierOption(context, branchID);

                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ID : 45"),
                        Text("Name: XYZ" ),
                        Text("Phone :0175465898" ),
                        /// -means You gave + means You recive
                        Text("Balance : 3500" ),

                      ],
                    ),
                  ),
                )
            ),
          );
        },
      )

    );
  }
  void _showCustomerSupplierOption(BuildContext context, String? id) {
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
                title: const Text('View'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> TransactionList(customerSupplierID: '45')));
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Update'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerOrSupplierUpdate()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete'),
                onTap: () {
                  Navigator.pop(context);
                  // Add your delete logic here
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
