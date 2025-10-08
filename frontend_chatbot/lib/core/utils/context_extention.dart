import 'package:flutter/widgets.dart';

extension BuildContextX on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}
