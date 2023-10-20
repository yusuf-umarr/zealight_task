import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:zealight_task/core/constant.dart';
import 'package:zealight_task/core/utils.dart';
import 'package:zealight_task/feature/home/models/school_model.dart';

class HomeServices {
  Future<Object> fetchSchool() async {
    try {
      http.Response res = await http.get(Uri.parse(baseUri), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });

      if (200 == res.statusCode) {
        // print("seen!!!!");
        // print("seen!!!!");
        // print(res.body);

        // print(schoolModelFromJson(res.body));

        return Success(response: schoolModelFromJson(res.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE,
          errorResponse: jsonDecode(res.body));
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'Please check your connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'Please check your connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
