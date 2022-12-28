class Cleaning {
  Name? name;
  int? age;
  String? dOB;
  List<String>? hobbies;
  Education? education;

  Cleaning({this.name, this.age, this.dOB, this.hobbies, this.education});

  Cleaning.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    age = json['age'];
    dOB = json['DOB'];
    hobbies = json['hobbies'].cast<String>();
    education = json['education'] != null
        ? Education.fromJson(json['education'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['age'] = age;
    data['DOB'] = dOB;
    data['hobbies'] = hobbies;
    if (education != null) {
      data['education'] = education!.toJson();
    }
    return data;
  }
}

class Name {
  String? first;
  String? middle;
  String? last;

  Name({this.first, this.middle, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    middle = json['middle'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['first'] = first;
    data['middle'] = middle;
    data['last'] = last;
    return data;
  }
}

class Education {
  String? highschool;
  String? college;

  Education({this.highschool, this.college});

  Education.fromJson(Map<String, dynamic> json) {
    highschool = json['highschool'];
    college = json['college'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['highschool'] = highschool;
    data['college'] = college;
    return data;
  }
}
