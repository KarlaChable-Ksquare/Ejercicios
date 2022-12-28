class MovieModel {
  int? id;
  String? url;
  String? name;
  String? language;
  Image? image;
  String? summary;

  MovieModel(
      {this.id, this.url, this.name, this.language, this.image, this.summary});

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    language = json['language'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['name'] = name;
    data['language'] = language;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['summary'] = summary;
    return data;
  }
}

class Image {
  String? medium;
  String? original;

  Image({this.medium, this.original});

  Image.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medium'] = medium;
    data['original'] = original;
    return data;
  }
}
