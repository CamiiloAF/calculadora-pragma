import 'package:flutter/material.dart';

import '../interfaces/utils.dart';

class Responsive extends Utils {
  static double distancePercentFromHeight(
    BuildContext context,
    double percent,
  ) {
    double totalHeight = 892, totalPercent = 100;
    totalHeight = MediaQuery.of(context).size.height;
    return (percent * totalHeight) / totalPercent;
  }

  static double distancePercentFromWidth(
    BuildContext context,
    double percent,
  ) {
    double totalWidth = 412, totalPercent = 100;
    totalWidth = MediaQuery.of(context).size.width;
    return (percent * totalWidth) / totalPercent;
  }
}
