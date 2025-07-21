class SumTddController {
  int add(String value) {
    int result = 0;
    if (value.isEmpty) {
      result = 0;
    } else if (value.length == 1) {
      result = int.parse(value);
    } else {
      final numbers = value.split(",");
      for (var number in numbers) {
        result += int.parse(number);
      }
    }

    return result;
  }
}
