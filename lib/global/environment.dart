import 'dart:io';

class Enviroment {
  // static String apiUrl = Platform.isAndroid
  //     ? 'http://192.168.1.15:3000/api'
  //     : 'http://192.168.1.15:3000/api';

  // static String socketUrl = Platform.isAndroid
  //     ? 'http://192.168.1.15:3000/'
  //     : 'http://192.168.1.15:3000/';

  static String apiUrl = Platform.isAndroid
      ? 'https://piogram.azurewebsites.net/api'
      : 'https://piogram.azurewebsites.net/api';

  static String socketUrl = Platform.isAndroid
      ? 'https://piogram.azurewebsites.net/'
      : 'https://piogram.azurewebsites.net/';
}
