import 'package:socket_io_client/socket_io_client.dart' as IO;


//this is a singleton class this means that only onne object is created and we can use it evrywhere
class SocketClient {
  IO.Socket? socket; // we had put a ? to ensure that the socket can have a null value
  static SocketClient? _instance;

  SocketClient._internal() {
    // here we have to pass the server link when we deploy our server

    socket = IO.io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });
    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    // ??=: This is the null-aware assignment operator. It checks whether the left-hand side (_instance) is null. If it is null, it will assign the right-hand side (SocketClient._internal()) to it. If it's not null, it will leave the current value of _instance unchanged.
    return _instance!;
  }
}
