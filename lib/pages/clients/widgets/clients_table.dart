import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/style.dart';
import '../../../controllers/customers_controller.dart';
import '../../../widgets/custom_text.dart';

class ClientsTable extends StatefulWidget {
  const ClientsTable({Key? key}) : super(key: key);

  @override
  State<ClientsTable> createState() => _ClientsTableState();
}

class _ClientsTableState extends State<ClientsTable> {
  final CustomersController customersController =
      Get.put(CustomersController());

  @override
  void initState() {
    super.initState();
    customersController.fetchCustomers();
  }

  @override
  Widget build(BuildContext context) {
    var columns = const [
      DataColumn(label: Text('Last Active')),
      DataColumn(label: Text('Email')),
      DataColumn(label: Text('Password')),
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('Lastname')),
      DataColumn(label: Text('Verified')),
      DataColumn(label: Text('Login Stamp')),
      DataColumn(label: Text('Role')),
      DataColumn(label: Text('Tel')),
      DataColumn(label: Text('Actions')),
    ];

    final verticalScrollController = ScrollController();
    final horizontalScrollController = ScrollController();

    return Obx(() => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: active.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: lightGray.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 30),
          child: Scrollbar(
            isAlwaysShown: true,
            thickness: 13.0,
            child: SingleChildScrollView(
              controller: verticalScrollController,
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                controller: horizontalScrollController,
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: customersController.isLoading.value
                      ? const CircularProgressIndicator()
                      : DataTable(
                          columns: columns,
                          rows: List<DataRow>.generate(
                            customersController.customers.length,
                            (index) => DataRow(cells: [
                              DataCell(CustomText(
                                text: customersController
                                    .customers[index].lastActive
                                    .toString(),
                              )),
                              DataCell(CustomText(
                                  text: customersController
                                      .customers[index].email
                                      .toString())),
                              DataCell(CustomText(
                                  text: customersController
                                      .customers[index].password
                                      .toString())),
                              DataCell(CustomText(
                                  text: customersController
                                      .customers[index].name
                                      .toString())),
                              DataCell(CustomText(
                                  text: customersController
                                      .customers[index].lastname
                                      .toString())),
                              DataCell(CustomText(
                                  text: customersController
                                      .customers[index].verified
                                      .toString())),
                              DataCell(CustomText(
                                  text: customersController
                                      .customers[index].loginStamp
                                      .toString())),
                              DataCell(CustomText(
                                  text: customersController
                                      .customers[index].role
                                      .toString())),
                              DataCell(CustomText(
                                  text: customersController.customers[index].tel
                                      .toString())),
                              DataCell(Container(
                                decoration: BoxDecoration(
                                  color: light,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: active, width: .5),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                child: CustomText(
                                  text: 'Block User',
                                  color: active.withOpacity(.7),
                                  weight: FontWeight.bold,
                                ),
                              )),
                            ]),
                          ),
                        ),
                ),
              ),
            ),
          ),
        ));
  }
}
