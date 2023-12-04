import 'package:get/get.dart';
import '../constants/constants.dart';
import '../models/station.dart';

class StationsService extends GetConnect {
  Future<List<Station>> fetchStations() async {
    final response = await get(Constants.stationsUrl);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      final List stations = response.body['stations'];
      return stations.map((station) => Station.fromJson(station)).toList();
    }
  }
}
