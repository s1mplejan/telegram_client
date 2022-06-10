import 'dart:io';
import 'dart:convert';
import 'dart:async';

void main() async {
  Socket socket = await Socket.connect('149.154.167.40', 443);
  print('connected');

  socket.add(utf8.encode("test"));
  // listen to the received data event stream
  socket.listen((List<int> event) {
    print(utf8.decode(event));
  });

  socket.add(utf8.encode("test"));
  // send hello
  while (true) {
    // wait 5 seconds
    await Future.delayed(Duration(microseconds: 1));
  }
  // .. and close the socket
  socket.close();
}
