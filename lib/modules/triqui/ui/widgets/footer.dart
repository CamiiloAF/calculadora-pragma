import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.distancePercentFromHeight(context, 5.9417),
      width: Responsive.distancePercentFromWidth(context, 834961),
      child: const Image(image: AssetImage('assets/patrocina-1.png')),
    );
  }
}