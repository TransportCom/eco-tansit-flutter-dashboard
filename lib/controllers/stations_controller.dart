import 'package:admin_dashboard/service/stations_service.dart';
import 'package:get/get.dart';
import '../models/station.dart';

class StationsController extends GetxController {
  var stations = <Station>[].obs;
  var isLoading = true.obs;

  void fetchStations() async {
    try {
      isLoading(true);
      var stations = await StationsService().fetchStations();
      if (stations.isNotEmpty) {
        this.stations.assignAll(stations);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
