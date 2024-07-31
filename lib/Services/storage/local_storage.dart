import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage{

  final storage = const FlutterSecureStorage();

  // function for manage it
     Future<bool> setValue(String key,String value)async{
       await storage.write(key: key, value: value);
       return true;
     }

}