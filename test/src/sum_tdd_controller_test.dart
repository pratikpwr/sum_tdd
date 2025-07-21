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
  });
}
