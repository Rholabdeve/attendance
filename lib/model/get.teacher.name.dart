class TeacherName {
  String? status;
  String? message;
  List<Data>? data;

  TeacherName({this.status, this.message, this.data});

  TeacherName.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? empid;
  String? thumbid;
  String? firstname;
  String? lastname;

  Data({this.empid, this.thumbid, this.firstname, this.lastname});

  Data.fromJson(Map<String, dynamic> json) {
    empid = json['empid'];
    thumbid = json['thumbid'];
    firstname = json['firstname'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empid'] = empid;
    data['thumbid'] = thumbid;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    return data;
  }
}
