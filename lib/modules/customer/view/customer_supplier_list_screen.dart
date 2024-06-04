import 'package:buisness_manager/modules/branch/view/branch_view_information.dart';
import 'package:buisness_manager/modules/customer/view/widget/customer_supplier_create.dart';
import 'package:buisness_manager/modules/customer/view/widget/customer_supplier_update.dart';
import 'package:buisness_manager/modules/customer/viewModel/customer_view_model.dart';
import 'package:buisness_manager/modules/transaction/view/transaction_screen.dart';

import 'package:buisness_manager/view/widget/custom_circular_button.dart';
import 'package:buisness_manager/view/widget/custom_container.dart';
import 'package:buisness_manager/view/widget/no_internet_widget.dart';
import 'package:buisness_manager/view/widget/text_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class CustomerSupplierViewScreen extends StatefulWidget {
  final dynamic name;
  final String branchId;
  final int customerOrSupplierType;

  CustomerSupplierViewScreen(
      {super.key,
      this.name,
      required this.branchId,
      required this.customerOrSupplierType});

  @override
  State<CustomerSupplierViewScreen> createState() =>
      _CustomerSupplierViewScreenState();
}

class _CustomerSupplierViewScreenState
    extends State<CustomerSupplierViewScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future _loadData() async {
    final customerViewModel = Provider.of<CustomerViewModel>(context, listen: false);
    await customerViewModel.customerListFetch(
        branchId: widget.branchId,
        customerOrSupplierType: widget.customerOrSupplierType,
        context);
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<InternetConnectionStatus>(context) == InternetConnectionStatus.disconnected
        ? NoInternetWidget(
            onPressed: () {
              _loadData();
            },
          )
        : Scaffold(
            body: RefreshIndicator(
              onRefresh: () async {
               await _loadData();
              },
              child: CustomContainer(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      HeadlineLargeText(
                          text: widget.name ?? 'No Name', color: Colors.white),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: CustomCircularButton(
                            text: widget.customerOrSupplierType == 0
                                ? 'Add Customer'
                                : 'Add Supplier',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CustomerOrSupplierCreate(
                                            branchID: widget.branchId, customerOrSupplierType: widget.customerOrSupplierType,)));}),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: HeadLineMediumText(
                          text: widget.customerOrSupplierType == 0
                              ? 'Customer List'
                              : 'Supplier List',
                          color: Colors.white,
                        ),
                      ),
                      Consumer<CustomerViewModel>(
                        builder: (context, customerViewModel, child) {
                          final customers =
                              customerViewModel.customers?.customerList;
                          if (customerViewModel.isLoadingState) {
                            return CircularProgressIndicator(
                                color: Colors.green);
                          } else if (customers == null) {
                            return Text('No data');
                          } else {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columnSpacing:
                                    10.0, // Set column spacing to minimum
                                columns: const [
                                  DataColumn(label: Text('ID')),
                                  DataColumn(label: Text('Name')),
                                  DataColumn(label: Text('Phone')),
                                  DataColumn(label: Text('Actions')),
                                ],
                                rows: customers.map((customer) {
                                  return DataRow(cells: [
                                    DataCell(Text('${customer.id}')),
                                    DataCell(Text('${customer.name}')),
                                    DataCell(Text('${customer.phone}')),
                                    DataCell(
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                                Icons.remove_red_eye_rounded),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => TransactionScreen(customerSupplierID: customer.id.toString(), branchID: widget.branchId, customerSupplierType: widget.customerOrSupplierType,
                                                          )));
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CustomerOrSupplierUpdate(
                                                              branchId: widget
                                                                  .branchId,
                                                              customerOrSupplierId:
                                                                  customer.id
                                                                      .toString(), customerSupplierType: widget.customerOrSupplierType,)));
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () async {
                                              final customerViewModel = Provider
                                                  .of<CustomerViewModel>(
                                                      context,
                                                      listen: false);
                                              await customerViewModel
                                                  .deleteCustomer(context,
                                                      branchId: widget.branchId,
                                                      customerOrSupplierId:
                                                          customer.id
                                                              .toString())
                                                  .then((isDeleted) async {
                                                if (isDeleted) {
                                                  await customerViewModel
                                                      .customerListFetch(
                                                          context,
                                                          branchId:
                                                              widget.branchId,
                                                          customerOrSupplierType:
                                                              widget
                                                                  .customerOrSupplierType);
                                                }
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]);
                                }).toList(),
                              ),
                            );
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
