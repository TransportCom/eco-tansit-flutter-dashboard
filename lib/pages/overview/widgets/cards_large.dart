import 'package:admin_dashboard/constants/constants.dart';
import 'package:admin_dashboard/controllers/customers_controller.dart';
import 'package:admin_dashboard/controllers/stations_controller.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/pages/overview/widgets/info_card.dart';
import 'package:get/get.dart';
import '../../../models/station.dart';

class OverviewCardsLargeScreen extends StatefulWidget {
  const OverviewCardsLargeScreen({
    super.key,
  });

  @override
  State<OverviewCardsLargeScreen> createState() =>
      _OverviewCardsLargeScreenState();
}

class _OverviewCardsLargeScreenState extends State<OverviewCardsLargeScreen> {
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

    return Obx(() => Row(
          children: [
            SizedBox(
              width: width / 64,
            ),
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
        ));
  }
}
