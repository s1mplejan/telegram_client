import 'dart:io';
import 'dart:convert';
import 'dart:async';

main() async {
  print('started');
  Socket socket = await Socket.connect('149.154.167.50', 443);
  print('connected');
  socket.close();
}
