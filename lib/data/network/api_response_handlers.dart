import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:getx_adv1/data/app_exceptions.dart';
import 'package:getx_adv1/data/network/base_api_services.dart';
import "package:http/http.dart" as http;

class ApiResponseHandlers extends BaseApiServices {
  // Get api
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetException("Internet error");
    } on RequestTimeOutException {
      throw RequestTimeOutException("Time out");
    }

    return jsonResponse;
  }

  // post api
  @override
  Future<dynamic> postApi(var data, String url) async {
    dynamic jsonResponse;

    try {
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(data))
          .timeout(Duration(seconds: 10));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetException("Internet error");
    } on RequestTimeOutException {
      throw RequestTimeOutException("Time out");
    }

    return jsonResponse;
  }


}


// make a function to return the api reponse in json
dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;

    case 400:
      throw InvalidUrlException("Please check your url");

    default:
      throw FetchDataException("");
  }
}
