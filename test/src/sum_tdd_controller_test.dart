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
    const value = "5\n2,3";

    // act
    final result = controller.add(value);

    // assert
    expect(result, equals(10));
  });
}
