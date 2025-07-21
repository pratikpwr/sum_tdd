import 'package:flutter_test/flutter_test.dart';
import 'package:sum_tdd/src/sum_tdd_controller.dart';

void main() {
  late SumTddController controller;

  setUp(() {
    controller = SumTddController();
  });

  group("1. Simple Add Controller", () {
    test("1. a) should return 0 when string is empty", () {
      // arrange
      const value = "";

      // act
      final result = controller.add(value);

      // assert
      expect(result, equals(0));
    });

    test("1. b) should return 1 when string is 1", () {
      // arrange
      const value = "1";

      // act
      final result = controller.add(value);

      // assert
      expect(result, equals(1));
    });

    test(
      "1. c) should add two numbers when passed as comma separated values",
      () {
        // arrange
        const value = "5,2";

        // act
        final result = controller.add(value);

        // assert
        expect(result, equals(7));
      },
    );
  });

  test(
    "2. should add any amount of numbers when passed as comma separated values",
    () {
      // arrange
      const value = "5,2,4,5,3";

      // act
      final result = controller.add(value);

      // assert
      expect(result, equals(19));
    },
  );

  test("3. should handle new lines between numbers", () {
    // arrange
    const value = "1\n2,3";

    // act
    final result = controller.add(value);

    // assert
    expect(result, equals(6));
  });

  test("4. should support different delimiters", () {
    // arrange
    const value = "//;\n1;2";

    // act
    final result = controller.add(value);

    // assert
    expect(result, equals(3));
  });

  group("5. Negative numbers", () {
    test(
      "5. a) should throw an exception when a negative number is passed",
      () {
        // arrange
        const value = "-1,2";

        // act
        action() => controller.add(value);

        // assert
        expect(action, throwsA(isA<Exception>()));
      },
    );

    test(
      "5. b) should throw an exception when a negative number is passed, should match the error message",
      () {
        // arrange
        const value = "-1,2";
        const errorMessage = "negative numbers not allowed: -1";

        try {
          // act
          controller.add(value);
        } catch (e) {
          // assert
          expect(e.toString(), contains(errorMessage));
        }
      },
    );

    test(
      "5. c) should throw an exception when a negative number is passed, if there are multiple negative numbers in the string",
      () {
        // arrange
        const value = "-1,-2,3";
        const errorMessage = "negative numbers not allowed: -1,-2";

        try {
          // act
          controller.add(value);
        } catch (e) {
          // assert
          expect(e.toString(), contains(errorMessage));
        }
      },
    );
  });

  test("6. should ignore numbers greater than 1000", () {
    // arrange
    const value = "1001,2";

    // act
    final result = controller.add(value);

    // assert
    expect(result, equals(2));
  });
}
