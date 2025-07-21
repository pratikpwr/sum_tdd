import 'package:flutter_test/flutter_test.dart';
import 'package:sum_tdd/src/sum_tdd_controller.dart';

void main() {
  late SumTddController controller;

  setUp(() {
    controller = SumTddController();
  });

  group("Simple Controller", () {
    test("should return 0 when string is empty", () {
      // arrange
      const value = "";

      // act
      final result = controller.add(value);

      // assert
      expect(result, equals(0));
    });

    test("should return 1 when string is 1", () {
      // arrange
      const value = "1";

      // act
      final result = controller.add(value);

      // assert
      expect(result, equals(1));
    });

    test("should add two numbers when passed as comma separated values", () {
      // arrange
      const value = "5,2";

      // act
      final result = controller.add(value);

      // assert
      expect(result, equals(7));
    });
  });
}
