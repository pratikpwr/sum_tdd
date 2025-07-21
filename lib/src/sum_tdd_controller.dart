class SumTddController {
  int add(String value) {
    int result = 0;
    if (value.isEmpty) {
      result = 0;
    } else if (value.length == 1) {
      result = int.parse(value);
    }

    return result;
  }
}
