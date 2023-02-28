import 'package:aleteo_triqui/entities/entity_helpers.dart';
import 'package:flutter/material.dart';

class Responsive extends EntityHelpers {
  static double distancePercentFromHeight(
    BuildContext context,
    double percent,
  ) {
    double totalHeight = MediaQuery.of(context).size.height, totalPercent = 100;

    return (percent * totalHeight) / totalPercent;
  }

  static double distancePercentFromWidth(
    BuildContext context,
    double percent,
  ) {
    double totalWidth = MediaQuery.of(context).size.width;
    return (percent * totalWidth) / 100;
  }
}
