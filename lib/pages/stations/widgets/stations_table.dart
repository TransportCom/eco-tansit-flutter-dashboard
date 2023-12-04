// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/stations_controller.dart';
import '../../../widgets/custom_text.dart';

class StationsTable extends StatefulWidget {
  const StationsTable({super.key});

  @override
  State<StationsTable> createState() => _StationsTableState();
}

class _StationsTableState extends State<StationsTable> {
  final StationsController stationsController = Get.put(StationsController());

  @override
  void initState() {
    super.initState();
    stationsController.fetchStations();
  }

  @override
  Widget build(BuildContext context) {
    var columns = const [
      DataColumn(label: Text('Brand')),
      DataColumn(label: Text('Category')),
      DataColumn(label: Text('Station')),
      DataColumn(label: Text('Price')),
      DataColumn(label: Text('Rating')),
      DataColumn(label: Text('Stock')),
      DataColumn(label: Text('Actions')),
    ];

    final DataTableSource data = MyData();

    return Obx(() => Padding(
          padding: const EdgeInsets.all(16),
          child: stationsController.stations.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : PaginatedDataTable(
                  columns: columns,
                  source: data,
                  //header: const Text('All Stations'),
                  columnSpacing: 50,
                  horizontalMargin: 30,
                  rowsPerPage: 10,
                ),
        ));
  }
}

class MyData extends DataTableSource {
  final StationsController stationsController = Get.put(StationsController());

  List<Map<String, dynamic>> data = [];

  MyData() {
    for (var i = 0; i < stationsController.stations.length; i++) {
      data.add({
        'brand': stationsController.stations[i].brand,
        'category': stationsController.stations[i].category,
        'station': stationsController.stations[i].title,
        'price': stationsController.stations[i].price.toString(),
        'rating': stationsController.stations[i].rating.toString(),
        'stock': stationsController.stations[i].stock.toString(),
        'actions': {
          'edit': () {
            print('Edit');
          },
          'delete': () {
            print('Delete');
          },
        },
      });
    }
  }

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(CustomText(text: data[index]['brand'])),
      DataCell(CustomText(text: data[index]['category'])),
      DataCell(CustomText(text: data[index]['station'])),
      DataCell(CustomText(text: data[index]['price'])),
      DataCell(Row(
        children: [
          const Icon(Icons.star, color: Colors.orangeAccent),
          const SizedBox(width: 5),
          CustomText(text: data[index]['rating']),
        ],
      )),
      DataCell(CustomText(text: data[index]['stock'])),
      DataCell(Row(
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.green,
            onPressed: data[index]['actions']['edit'],
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.redAccent,
            onPressed: data[index]['actions']['delete'],
          ),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
