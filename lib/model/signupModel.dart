
class UserData {
  String name;
  String salary;
  String age;
  int id;
  UserData(
      {required this.name,
      required this.salary,
      required this.age,
      required this.id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["salary"] = salary;
    data['age'] = age;
    data['id'] = id;
    return data;
  }

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        salary: json["salary"],
        age: json["age"],
      );
}

class RootSignUp {
  String status;
  UserData? data;
  String? message;

  RootSignUp({required this.status, required this.data, this.message});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = <String, dynamic>{};
    data1["status"] = status;
    data1["data"] = data;
    data1['message'] = message;
    return data1;
  }

  factory RootSignUp.fromJson(Map<String, dynamic> json) => RootSignUp(
        status: json["status"],
        data: json["data"] != null ? UserData.fromJson(json['data']) : null,
        message: json["message"],
      );
}

class SignUpBody {
  String name;
  String phone;
  String email;
  String password;
  SignUpBody(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["f_name"] = name;
    data["phone"] = phone;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
