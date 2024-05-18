import 'package:buisness_manager/modules/branch/view/widgets/branch_list.dart';
import 'package:buisness_manager/modules/branch/viewModel/branch_view_model.dart';
import 'package:buisness_manager/modules/customer/view/customer_supplier_list_screen.dart';
import 'package:buisness_manager/modules/customer/view/widget/customer_supplier_create.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_main_use_container.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BranchViewScreen extends StatefulWidget {
  final String? name;
  final String? id;

  const BranchViewScreen({super.key, this.name, this.id});

  @override
  State<BranchViewScreen> createState() => _BranchViewScreenState();
}

class _BranchViewScreenState extends State<BranchViewScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }
  Future _loadData()async{
      final branchViewModel = Provider.of<BranchViewModel>(context, listen: false);
      await branchViewModel.branchListFetch();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        _loadData();
      },
      child: CustomContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h,),
              HeadlineLargeText(text: widget.name ?? 'No Name', color: Colors.white),
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
             CustomerList(branchID:widget.id.toString()),

            ],
          ),
        ),
      ),
    );
  }
}
