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

    int calculateTotalStock(List<Station> stock) {
      int totalStock = 0;
      for (int i = 0; i < stationsController.stations.length; i++) {
        totalStock += stationsController.stations[i].stock!;
      }
      return totalStock;
    }

    int calculateTotalValue(List<Station> stock) {
      int totalValue = 0;
      for (int i = 0; i < stationsController.stations.length; i++) {
        totalValue += stationsController.stations[i].stock! *
            stationsController.stations[i].price!;
      }
      return totalValue;
    }

    return Obx(() => Row(
          children: [
            InfoCard(
              title: Constants.totalStock,
              value: calculateTotalStock(stationsController.stations),
              onTap: () {},
              topColor: Colors.orange,
            ),
            SizedBox(
              width: width / 64,
            ),
            InfoCard(
              title: Constants.valueOfStock,
              value: calculateTotalValue(stationsController.stations),
              topColor: Colors.lightGreen,
              onTap: () {},
            ),
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
