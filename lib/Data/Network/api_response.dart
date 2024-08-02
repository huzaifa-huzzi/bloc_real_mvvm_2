


import 'package:bloc_mvvm_2/Utils/enum.dart';

class ApiResponse<T>{

  Status? status;
  T? data;
  String? message;
  ApiResponse(this.data,this.status,this.message);

  //Now handling responses

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.completed(this.data) : status = Status.completed;
  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString(){
    return "Status : $status \n Message : $message \n Data:$data";
  }


}
