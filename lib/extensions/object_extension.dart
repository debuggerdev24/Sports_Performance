import 'dart:developer';

extension LogExtension on Object{
  myLog(String msg){
    log(msg, name: runtimeType.toString());
  }
}