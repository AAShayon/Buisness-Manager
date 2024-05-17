import 'package:buisness_manager/modules/branch/view/widgets/branch_list.dart';
import 'package:buisness_manager/modules/customer/view/customer_supplier_list_screen.dart';
import 'package:buisness_manager/modules/customer/view/widget/customer_supplier_create.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_main_use_container.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BranchViewScreen extends StatelessWidget {
  final String? name;
  final String? id;

  const BranchViewScreen({super.key, this.name, this.id});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h,),
            HeadlineLargeText(text: name ?? 'No Name', color: Colors.white),
            // HeadlineLargeText(text: id ?? 'No ID', color: Colors.white),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: CustomCircularButton(text: 'Add Customer', onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerOrSupplierCreate()));
              }),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: HeadLineMediumText(text: 'Customer List', color: Colors.white),
            ),
           CustomerList(branchID:id.toString()),

          ],
        ),
      ),
    );
  }

}
