class LoginModel {
  int? code;
  String? message;
  Data? data;

  LoginModel({this.code, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? sId;
  String? avartar;
  String? role;

  Data({this.name, this.sId, this.avartar, this.role});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sId = json['_id'];
    avartar = json['avartar'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['_id'] = sId;
    data['avartar'] = avartar;
    data['role'] = role;
    return data;
  }
}
