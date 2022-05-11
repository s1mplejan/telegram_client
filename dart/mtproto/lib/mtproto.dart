import 'dart:io';
import 'dart:convert';
import 'dart:async';

main() async {
  print('started');
  Socket socket = await Socket.connect('149.154.167.50', 443);
  print('connected');

  // listen to the received data event stream
  socket.listen((List<int> event) {
    print(utf8.decode(event));
  });

  // send hello
  socket.add(utf8.encode('hello'));

  // wait 5 seconds
  await Future.delayed(Duration(seconds: 5));

  // .. and close the socket
  socket.close();
}