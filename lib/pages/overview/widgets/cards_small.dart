import 'package:admin_dashboard/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/customers_controller.dart';
import '../../../controllers/stations_controller.dart';
import '../../../models/station.dart';
import 'info_card_small.dart';

class OverviewCardsSmallScreen extends StatefulWidget {
  const OverviewCardsSmallScreen({super.key});

  @override
  State<OverviewCardsSmallScreen> createState() =>
      _OverviewCardsSmallScreenState();
}

class _OverviewCardsSmallScreenState extends State<OverviewCardsSmallScreen> {
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

    return SizedBox(
      height: 400,
      child: Obx(
        () => Column(
          children: [
            InfoCardSmall(
              title: Constants.stationsCount,
              value: stationsController.stations.length,
              onTap: () {},
            ),
            SizedBox(
              height: width / 64,
            ),
            InfoCardSmall(
              title: Constants.customerCount,
              value: customersController.customers.length,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
