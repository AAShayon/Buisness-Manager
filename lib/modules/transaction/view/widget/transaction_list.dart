import 'package:buisness_manager/modules/transaction/view/widget/transaction_create.dart';
import 'package:buisness_manager/modules/transaction/view/widget/transaction_update.dart';
import 'package:buisness_manager/view/widget/common_use_container.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/custom_text_from_filed.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionList extends StatelessWidget {
  final String customerSupplierID;

  const TransactionList({super.key, required this.customerSupplierID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  CustomContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              Center(child: HeadlineLargeText(text: "Supplier/Customer", color: Colors.white)),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeadlineLargeText(text: 'UserName', color: Colors.white),
                  SizedBox(width: 50.w),
                  HeadlineLargeText(text: 'ID $customerSupplierID', color: Colors.white),
                ],
              ),
              SizedBox(height: 10.h,),
              Center(child: CustomCircularButton(text: 'Create Transaction', onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> TransactionCreate()));})),
              Column(
                children: [
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 700.h,
                    width: 300.w,
                    child: _buildTransactionTable(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionTable(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 5.w,
        columns: [
          _buildDataColumn('Trans. No'),
          _buildDataColumn('Amount'),
          _buildDataColumn('Details'),
          _buildDataColumn('Bill No'),
          _buildDataColumn('Actions'),
        ],
        rows: List<DataRow>.generate(
          10,
              (index) => DataRow(
            cells: [
              _buildDataCell('1003'),
              _buildDataCell('2000'),
              _buildDataCell('Anything'),
              _buildDataCell('001'),
              DataCell(
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      String trsndsctionID='45';
                      _showTransactionOption(context, trsndsctionID);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DataColumn _buildDataColumn(String label) {
    return DataColumn(
      label: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        padding: EdgeInsets.all(8.0),
        child: Text(label),
      ),
    );
  }

  DataCell _buildDataCell(String content) {
    return DataCell(
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Text(content),
      ),
    );
  }

  void _showTransactionOption(BuildContext context, String? id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Transaction Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Update'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const TransactionUpdate(
                    // transactionID:id ,
                  )));
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
