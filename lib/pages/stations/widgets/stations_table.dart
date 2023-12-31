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
      DataColumn(label: Text('Id')),
      DataColumn(label: Text('Title')),
      DataColumn(label: Text('Latitude')),
      DataColumn(label: Text('Longitude')),
      DataColumn(label: Text('Actions'))
    ];

    final DataTableSource data = MyData();

    return Obx(() => Padding(
          padding: const EdgeInsets.all(16),
          child: stationsController.stations.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : PaginatedDataTable(
                  columns: columns,
                  source: data,
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
        'id': stationsController.stations[i].id,
        'title': stationsController.stations[i].title,
        'lat': stationsController.stations[i].lat,
        'lan': stationsController.stations[i].lan,
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
      DataCell(CustomText(text: data[index]['id'].toString())),
      DataCell(CustomText(text: data[index]['title'])),
      DataCell(CustomText(text: data[index]['lat'].toString())),
      DataCell(CustomText(text: data[index]['lan'].toString())),
      DataCell(Row(
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.green,
            onPressed: () {
              print('Edit');
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.redAccent,
            onPressed: () {
              print('Delete');
            },
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
