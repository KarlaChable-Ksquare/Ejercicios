class DistanceModel {
  String? name;
  String? capital;
  List<dynamic>? latlng;
  bool? independent;

  DistanceModel({this.name, this.capital, this.latlng, this.independent});

  DistanceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    capital = json['capital'];
    latlng = json['latlng'];
    independent = json['independent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['capital'] = capital;
    data['latlng'] = latlng;
    data['independent'] = independent;
    return data;
  }
}
