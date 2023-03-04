import 'dart:math';

String bodyMassIndex({required double weight, required double height}) {
  var result = weight / pow(height, 2);
  return result.toStringAsFixed(2);
}
