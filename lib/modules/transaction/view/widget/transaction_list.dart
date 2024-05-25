import 'package:buisness_manager/model/core/api_urls.dart';
import 'package:buisness_manager/modules/branch/view/branch_view_information.dart';
import 'package:buisness_manager/modules/transaction/view/widget/transaction_create.dart';
import 'package:buisness_manager/modules/transaction/view/widget/transaction_update.dart';
import 'package:buisness_manager/modules/transaction/viewModel/transaction_view_model.dart';
import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../model/core/response_model/TransactionsListResponseModel.dart';

class TransactionList extends StatefulWidget {
  final String customerSupplierID;
  final String branchID;

  const TransactionList({super.key, required this.customerSupplierID, required this.branchID});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future _loadData() async {
    final transactionViewModel = Provider.of<TransactionViewModel>(context, listen: false);
    await transactionViewModel.transactionListFetch(branchID: widget.branchID, customerOrSupplierID: widget.customerSupplierID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _loadData();
        },
        child: CustomContainer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                Center(child: HeadlineLargeText(text: "Supplier/Customer", color: Colors.white)),
                SizedBox(height: 15.h),
                Consumer<TransactionViewModel>(
                  builder: (context, transactionViewModel, child) {
                    if (transactionViewModel.isLoadingState) {
                      return Center(child: CircularProgressIndicator(color: Colors.green));
                    } else if (transactionViewModel.transactions == null || transactionViewModel.transactions!.transactionList!.isEmpty) {
                      return Center(child: Text('No Data', style: TextStyle(color: Colors.white)));
                    }

                    final transactions = transactionViewModel.transactions!.transactionList;

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HeadlineLargeText(text: 'ID ${widget.customerSupplierID}', color: Colors.white),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: CustomCircularButton(
                            text: 'Create Transaction',
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionCreate(branchID: widget.branchID, customerOrSupplierId: widget.customerSupplierID,)));
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          height: 700.h,
                          width: double.infinity,
                          child: _buildTransactionTable(context, transactions!),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionTable(BuildContext context, List<Transaction> transactions) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 10.w,
        columns: [
          _buildDataColumn('Trans. No'),
          _buildDataColumn('Amount'),
          _buildDataColumn('Details'),
          _buildDataColumn('Bill No'),
          _buildDataColumn('Actions'),
        ],
        rows: transactions.map((transaction) {
          return DataRow(
            cells: [
              _buildDataCell(transaction.id.toString()),
              _buildDataCell(transaction.amount.toString()),
              _buildDataCell(transaction.details ?? 'N/A'),
              _buildDataCell(transaction.billNo ?? 'N/A'),
              DataCell(
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    _showTransactionOption(context, transactionID: transaction.id.toString() ,branchID:widget.branchID,customerID:widget.customerSupplierID,billID: transaction.billNo.toString() );
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  DataColumn _buildDataColumn(String label) {
    return DataColumn(
      label: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(label),
      ),
    );
  }

  DataCell _buildDataCell(String content) {
    return DataCell(
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(content),
      ),
    );
  }

  void _showTransactionOption(BuildContext context,
      {required String branchID, required String transactionID,required String customerID,required String billID}) {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransactionUpdate(transactionID: transactionID, branchID: branchID, customerID:customerID,)),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete'),
                onTap: () async {
                  final transactionViewModel = Provider.of<TransactionViewModel>(context, listen: false);
                  await transactionViewModel.deleteTransaction(context, branchID: branchID, transactionID: transactionID).then((isDeleted) {
                    if (isDeleted) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => BranchViewInformationScreen()),
                            (route) => false,
                      );
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
