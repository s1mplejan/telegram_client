void main() async {
  request(parameters: {});
}

request({
  Map<String, dynamic> parameters = const <String, dynamic>{},
}) {
  print(parameters);
  parameters["exte"] = "Azka";
  print(parameters);
}
