main() async {
  await invoke();
}

invoke() async {
  late int count = 0;
  var data = await Future.microtask(() {
    while (true) {
      if (count == 5) {
        return count;
      }
      count++;
    }
  });
  print(data);
}
