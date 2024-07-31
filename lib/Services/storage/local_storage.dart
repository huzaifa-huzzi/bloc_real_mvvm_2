import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage{

  final storage = const FlutterSecureStorage();

  // function for manage it
     Future<bool> setValue(String key,String value)async{
       await storage.write(key: key, value: value);
       return true;
     }
     // reading this value
    Future<dynamic> readValue(String key)async{
       return await storage.read(key: key);
    }
     //for clearing the values
    Future<bool> clearValue(String key)async{
       await storage.delete(key: key);
       return true;
    }

}