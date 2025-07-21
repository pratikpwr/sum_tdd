class SumTddController {
  int add(String value) {
    if (value.isEmpty) {
      return 0;
    }
    if (value.length == 1) {
      return int.parse(value);
    }
    
    int result = 0;

    String numbersString = value;
    List<String> numbers = [];

    String delimiter = ",";

    if (value.startsWith("//")) {
      delimiter = value.substring(2, 3);
      numbersString = value.substring(4);
    }

    if (value.contains("\n")) {
      numbersString = numbersString.replaceAll("\n", ",");
    }

    numbers = numbersString.split(delimiter);

    final negativeNumbers = <int>[];
    bool hasNegatives = false;

    for (var number in numbers) {
      final num = int.tryParse(number);
      if (num == null) {
        continue;
      }

      if (num < 0) {
        negativeNumbers.add(num);
        hasNegatives = true;
      } else if (num > 1000) {
        continue;
      } else if (!hasNegatives) {
        // Only calculate sum if no negatives found yet
        result += num;
      }
    }

    if (hasNegatives) {
      final errorMessage =
          "negative numbers not allowed: ${negativeNumbers.join(",")}";
      print(errorMessage);
      throw Exception(errorMessage);
    }

    return result;
  }
}
