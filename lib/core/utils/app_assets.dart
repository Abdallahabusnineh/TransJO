import 'dart:convert';

abstract class AppAssets {
  static const String imageBase= "assets/images/";
  static const String loginBus="${imageBase}Animation - 1702035910937.json";
  static const String googleIcon="${imageBase}google.png";
  static const String cameraIcon="${imageBase}diaphragm.png";
   static  String emailAuth="";
   static  String passwordAuth="";
   static String basicAuth='Basic ' + base64.encode(utf8.encode('$emailAuth:$passwordAuth'));

}
