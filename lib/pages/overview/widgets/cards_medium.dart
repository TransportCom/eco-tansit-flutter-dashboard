import 'package:admin_dashboard/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/pages/overview/widgets/info_card.dart';
import 'package:get/get.dart';

import '../../../controllers/customers_controller.dart';
import '../../../controllers/stations_controller.dart';
import '../../../models/station.dart';

class OverviewCardsMediumScreen extends StatefulWidget {
  const OverviewCardsMediumScreen({super.key});

  @override
  State<OverviewCardsMediumScreen> createState() =>
      _OverviewCardsMediumScreenState();
}

class _OverviewCardsMediumScreenState extends State<OverviewCardsMediumScreen> {
  final CustomersController customersController =
      Get.put(CustomersController());

  final StationsController stationsController = Get.put(StationsController());

  @override
  void initState() {
    super.initState();
    stationsController.fetchStations();
    customersController.fetchCustomers();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: width / 64,
            ),
            Row(
              children: [
                InfoCard(
                  title: Constants.stationsCount,
                  value: stationsController.stations.length,
                  topColor: Colors.redAccent,
                  onTap: () {},
                ),
                SizedBox(
                  width: width / 64,
                ),
                InfoCard(
                  title: Constants.customerCount,
                  value: customersController.customers.length,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ));
  }
}
