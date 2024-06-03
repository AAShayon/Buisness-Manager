import 'package:buisness_manager/modules/branch/view/branch_view_information.dart';
import 'package:buisness_manager/modules/transaction/model/core/response_model/TransactionsListResponseModel.dart';
import 'package:buisness_manager/modules/transaction/view/widget/transaction_update.dart';
import 'package:buisness_manager/modules/transaction/viewModel/transaction_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
class TransactionList extends StatelessWidget {
  final String branchID;
  final String customerSupplierID;
  final int customerSupplierType;
  const TransactionList({super.key, required this.branchID, required this.customerSupplierID, required this.customerSupplierType});
  String? _formatDateTime(String? dateTime) {
    if (dateTime == null) return null;
    DateTime parsedDate = DateTime.parse(dateTime);
    return DateFormat('hh:mm a yyyy-MM-dd').format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionViewModel>(
      builder: (context, transactionViewModel, child) {
        if (transactionViewModel.isLoadingState) {
          return Center(child: CircularProgressIndicator(color: Colors.green));
        } else if (transactionViewModel.transactions == null || transactionViewModel.transactions!.transactionList!.isEmpty) {
          return Center(child: Text('No Data', style: TextStyle(color: Colors.white)));
        }

        final transactions = transactionViewModel.transactions!.transactionList;

        return Column(
          children: [
            _buildTransactionTable(context, transactions!),
          ],
        );
      },
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
          _buildDataColumn('Date '),
        ],
        rows: transactions.map((transaction) {
          return DataRow(
            cells: [
              _buildDataCell(transaction.id.toString()),
              _buildDataCell(transaction.amount.toString()),
              _buildDataCell(transaction.details ?? 'N/A'),
              _buildDataCell(transaction.billNo ?? 'N/A'),
              _buildDataCell(_formatDateTime(transaction.transactionDate) ?? 'N/A'),
            ],
            onSelectChanged: (selected){
              if(selected != null && selected){
                _showTransactionOption(context, transactionID: transaction.id.toString() ,branchID:branchID,customerID:customerSupplierID,billID: transaction.billNo.toString() );

              }
            }
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
        child: Text(content,overflow: TextOverflow.ellipsis,maxLines: 1,),
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
                    MaterialPageRoute(builder: (context) => TransactionUpdate(transactionID: transactionID, branchID: branchID, customerID:customerID, customerSupplierType:customerSupplierType,)),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete'),
                onTap: () async {
                  final transactionViewModel = Provider.of<TransactionViewModel>(context, listen: false);
                  await transactionViewModel.deleteTransaction(context, branchID: branchID, transactionID: transactionID).then((isDeleted)async {
                    if (isDeleted) {
                  await transactionViewModel.transactionListFetch(context, branchID: branchID, customerOrSupplierID: customerID).then((isFetched) {
                    if(isFetched){
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  });
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
