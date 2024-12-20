import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:technical_task/api/api_controller.dart';
import 'package:technical_task/app/modules/SignUpScreen/model/signUp.model.dart';  // Import your model for signup
import '../../../../api/api.url.dart';
import '../model/getProfession.model.dart';

// Extension for the SignUpScreenController on ApiController
extension SignUpScreenController on ApiController {

  // Function to fetch profession list from the API
  Future<List<GetProfessionApi>> fetchProfessionListApi() async {
    try {
      var dioInstance = dio.Dio();
      dio.Response response = await dioInstance.get(
        AppUrl.GET_PROFESSION, // Using AppUrl.GET_PROFESSION for the API endpoint
      );

      // Check if the response status is 200 (OK)
      if (response.statusCode == 200) {
        // If response data is a list, parse it
        if (response.data is List) {
          List<GetProfessionApi> professionList = List<GetProfessionApi>.from(
            response.data.map((x) => GetProfessionApi.fromJson(x)),
          );
          return professionList;
        } else {
          throw Exception("Unexpected response format: Expected a list");
        }
      } else {
        throw Exception("Failed to fetch profession list: ${response.statusMessage}");
      }
    } catch (e) {
      throw Exception("Failed to fetch profession list: $e");
    }
  }

  // Function to handle SignUp API request
  Future<SignUpApi> fetchSignup(
      {required String email, required String password, required String phone, required String name, required String profession,required String userType}) async {
    try {
      var dioInstance = dio.Dio();
      var data = json.encode({
        "email": email,
        "password": password,
        "phone": phone,
        "name": name,
        "profession": profession
      });

      print("msg for ${data}");
      // Set headers for POST request
      var headers = {'Content-Type': 'application/json'};

      // Make the POST request
      dio.Response response = await dioInstance.post(
        userType != "Vendor"
       ? AppUrl.signUp
        : AppUrl.vendorSignUp,
        options: dio.Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      // Check the response status code
      if (response.statusCode == 200) {
        // If the response is successful, parse it into the SignUpApi model
        return SignUpApi.fromJson(response.data);
      } else {
        throw Exception('Error: ${response.statusMessage}');
      }
    } catch (e) {
      // Catch any errors (e.g., network issues, parsing errors)
      throw Exception('Failed to sign up: $e');
    }
  }
}
