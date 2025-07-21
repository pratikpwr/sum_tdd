class SumTddController {
  int add(String value) {
    int result = 0;
    if (value.isEmpty) {
      result = 0;
    } else if (value.length == 1) {
      result = int.parse(value);
    } else {
      String numbersString = value;
      List<String> numbers = [];

      if (value.contains("\n")) {
        numbersString = value.replaceAll("\n", ",");
      }

      numbers = numbersString.split(",");

      for (var number in numbers) {
        final num = int.tryParse(number);
        if (num == null) {
          continue;
        }
        result += num;
      }
    }

    return result;
  }
}
