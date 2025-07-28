class FatchTeacherModel {
  String? status;
  String? firstname;
  String? lastname;

  FatchTeacherModel({this.status, this.firstname, this.lastname});

  FatchTeacherModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    firstname = json['firstname'];
    lastname = json['lastname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    return data;
  }
}
