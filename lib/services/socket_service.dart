import 'package:chat/global/environment.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket;

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;

  Function get emit => this._socket.emit;

  void connect() async {
    final token = await AuthService.getToken();

    // Dart client

    this._socket = IO.io(Enviroment.socketUrl, {
      'transports': ['websocket'],
      'autoConnect': true,
      'forcesNew': true,
      'extraHeaders': {'x-token': token}
    });

    this._socket.onConnect((_) {
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    this._socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    // socket.on(
    //   'nuevo-mensaje',
    //   (payload) {
    //     // print('nuevo-mensaje: $payload');
    //     print('nombre: ${payload['nombre']}');
    //     print('mensaje: ${payload['mensaje']}');
    //     print(payload.containsKey('mensaje2') ? payload['mensaje2'] : 'no hay');
    //   },
    // );
  }

  void disconnect() {
    this._socket.disconnect();
  }
}
