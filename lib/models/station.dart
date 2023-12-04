class Stations {
  List<Station>? stations;
  int? total;
  int? skip;
  int? limit;

  Stations({this.stations, this.total, this.skip, this.limit});

  Stations.fromJson(Map<String, dynamic> json) {
    if (json['stations'] != null) {
      stations = <Station>[];
      json['stations'].forEach((v) {
        stations!.add(Station.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stations != null) {
      data['stations'] = stations!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Station {
  int? id;
  String? title;
  double? lat;
  double? lan;

  Station({this.id, this.title, this.lat, this.lan});

  Station.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    lat = json['lat'];
    lan = json['lan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['lat'] = lat;
    data['lan'] = lan;
    return data;
  }
}
