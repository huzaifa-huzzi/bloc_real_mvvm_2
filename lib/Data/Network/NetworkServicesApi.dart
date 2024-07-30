import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_mvvm_2/Data/Exceptions/App_Exceptions.dart';
import 'package:bloc_mvvm_2/Data/Network/BaseApiServices.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkServicesApi implements BaseApiServices {

  //for the get Api fetching
  @override
  Future<dynamic> getApi(String url) async {

     dynamic jsonResponse;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);



    }on SocketException {
      throw Exception();
    }on TimeoutException{
      throw FetchDataException();
    }

    return jsonResponse;

  }
   //Post Api fetching
  @override
  Future<dynamic> postApi(String url, var data) async {

    dynamic jsonResponse;
    if(kDebugMode){
      print(url);
      print(data);
    }
    try{
      final response = await http.post(Uri.parse(url),body: data).timeout(const Duration(seconds: 50));
      jsonResponse = returnResponse(response);



    }on SocketException {
      throw Exception();
    }on TimeoutException{
      throw FetchDataException();
    }

    return jsonResponse;

  }


      //handling the responses of status code
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400 :
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 500 :
        throw FetchDataException('Error While communicating with server ' + response.statusCode.toString());
        default:
          throw FetchDataException('Error While Fetching');
    }
  }


}