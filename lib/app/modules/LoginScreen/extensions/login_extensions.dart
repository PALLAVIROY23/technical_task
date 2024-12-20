import 'dart:convert';

import 'package:technical_task/api/api_controller.dart';
import 'package:dio/dio.dart' as dio;
import '../../../../api/api.url.dart';
import '../model/login.model.dart';

extension LoginExtensions on ApiController{

  Future<LoginApi> fetchLogin({required String email, required String password,required String userType}) async {
    try {
      var dioInstance = dio.Dio();
      var data = json.encode({
        "email": email,
        "password": password,
      });
      var headers = {'Content-Type': 'application/json'};
      dio.Response response = await dioInstance.post(
        userType != "Vendor"
            ? AppUrl.logIn
            : AppUrl.vendorLogIn,
        options: dio.Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      if (response.statusCode == 200) {
        return LoginApi.fromJson(response.data);
      } else {
        print("error msg${response.statusMessage}");
        throw Exception('Error: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

}