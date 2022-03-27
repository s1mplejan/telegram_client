import 'dart:io';

void main() {
  File file = File("${Directory.current.path.toString()}/code.dart");
  file.createSync(recursive: true);
  file.writeAsStringSync("void main()\{\}");
}
