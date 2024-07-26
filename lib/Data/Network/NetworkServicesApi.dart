import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc_mvvm_2/Data/Exceptions/App_Exceptions.dart';
import 'package:bloc_mvvm_2/Data/Network/BaseApiServices.dart';
import 'package:bloc_mvvm_2/config/Internet%20Exception/Internet_Exception.dart';
import 'package:http/http.dart' as http;

class NetworkServicesApi implements BaseApiServices {

  //for the get Api fetching
  @override
  Future<dynamic> getApi(String url) async {

    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 50));




    }on SocketException {
      throw Exception();
    }on TimeoutException{
      throw FetchDataException();
    }

  }


   //Post Api fetching
  @override
  Future<dynamic> postApi(String url, data) async {

  }

  dynamic returnResponse(http.Response response){
    switch(response){
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400 :
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 500 :
        throw FetchDataException('Error While communicating with server ' + response.statusCode.toString());
    }
  }


}