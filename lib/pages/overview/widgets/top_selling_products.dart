import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/style.dart';
import '../../../controllers/stations_controller.dart';
import '../../../widgets/custom_text.dart';

class AvailableDriversTable extends StatefulWidget {
  const AvailableDriversTable({super.key});

  @override
  State<AvailableDriversTable> createState() => _AvailableDriversTableState();
}

class _AvailableDriversTableState extends State<AvailableDriversTable> {
  final StationsController stationsController = Get.put(StationsController());

  @override
  void initState() {
    super.initState();
    stationsController.fetchStations();
  }

  @override
  Widget build(BuildContext context) {
    var columns = const [
      DataColumn(label: Text('Title')),
      DataColumn(label: Text('Lan')),
      DataColumn(label: Text('Lat')),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    text: "Top Stations",
                    color: lightGray,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
              AdaptiveScrollbar(
                underColor: Colors.blueGrey.withOpacity(0.3),
                sliderDefaultColor: active.withOpacity(0.7),
                sliderActiveColor: active,
                controller: verticalScrollController,
                child: AdaptiveScrollbar(
                  controller: horizontalScrollController,
                  position: ScrollbarPosition.bottom,
                  underColor: lightGray.withOpacity(0.3),
                  sliderDefaultColor: active.withOpacity(0.7),
                  sliderActiveColor: active,
                  width: 13.0,
                  sliderHeight: 100.0,
                  child: SingleChildScrollView(
                    controller: verticalScrollController,
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      controller: horizontalScrollController,
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: stationsController.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : DataTable(
                                columns: columns,
                                rows: List<DataRow>.generate(
                                  5,
                                  (index) => DataRow(cells: [
                                    DataCell(CustomText(
                                      text: stationsController
                                          .stations[index].title!,
                                    )),
                                    DataCell(CustomText(
                                      text: stationsController
                                          .stations[index].lan
                                          .toString(),
                                    )),
                                    DataCell(CustomText(
                                      text: stationsController
                                          .stations[index].lat
                                          .toString(),
                                    )),
                                    DataCell(Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.deepOrange,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    )),
                                  ]),
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
