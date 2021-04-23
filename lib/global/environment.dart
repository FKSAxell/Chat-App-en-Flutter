import 'dart:io';

class Enviroment {
  static String apiUrl = Platform.isAndroid
      ? 'https://piogram.azurewebsites.net/api'
      : 'https://piogram.azurewebsites.net/api';

  static String socketUrl = Platform.isAndroid
      ? 'https://piogram.azurewebsites.net/'
      : 'https://piogram.azurewebsites.net/';
}
