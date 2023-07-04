import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_api_calling/constants.dart';
import 'package:flutter_api_calling/model/usermodel.dart';
import 'model/signupModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>?> getUser1() async {
    // var url =
    // Uri.parse("https://mocki.io/v1/da83cc2a-9959-4efd-a402-5f33ad1be00c");
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
    var response = await http.get(url);
    print("url =$url");
    print("response = ");
    print(response.body);
    try {
      if (response.statusCode == 200) {
        print("statusCode==200");
        print(response.body.runtimeType);
        List jsonData = jsonDecode(response.body);
        List<UserModel> model =
            (jsonData).map((data) => UserModel.fromJson(data)).toList();
        print("hii");
        // print(model);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<String?> getUser() async {
    // var url =     Uri.parse("https://mocki.io/v1/da83cc2a-9959-4efd-a402-5f33ad1be00c");
    // var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
    var url =
        Uri.parse("https://mocki.io/v1/108ec35d-f7ee-4e17-bfe0-1453bdb68650");

    var response = await http.get(url);
    print("url =$url");
    print("response = ");
    print(response.body);
    try {
      if (response.statusCode == 200) {
        print("statusCode==200");
        print(response.body.runtimeType);
        // Map<String, dynamic> jsonData = json.decode(response.body);

        // List<UserModel> model = usermodelfromJson(jsonDecode(response.body));
        // print("hii");
        // print(model);
        // return model;
        return response.body;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<RootSignUp?> register(String name, String salary, String age) async {
    Map<String, String> data = {
      "name": name,
      "age": age,
      "salary": salary,
    };
    print(data);
    // String jsonstringmap = json.encode(data);
    // print(jsonstringmap);
    try {
      var response = await http.post(
          Uri.parse("https://dummy.restapiexample.com/api/v1/create"),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: jsonEncode(data));
      print("hi");
      print(response.body);
      Map<String, dynamic> jsonData = json.decode(response.body);
      // print(jsonData);
      var userDataModel = RootSignUp.fromJson(jsonData);
      print("user model");
      print(userDataModel);
      return userDataModel;
    } catch (e) {
      print("catch error");
      log(e.toString());
    }
    return null;
    // return response;
  }

  Future<http.Response?> registerUser(SignUpBody data) async {
    http.Response? response;
    print(data.toJson());
    try {
      response = await http.post(
          Uri.parse("https://dummy.restapiexample.com/api/v1/auth/register"),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: jsonEncode(data.toJson()));
    } catch (e) {
      print("error from api");
      log(e.toString());
    }
    print("test");
    print(response?.body);
    return response;
  }
}
