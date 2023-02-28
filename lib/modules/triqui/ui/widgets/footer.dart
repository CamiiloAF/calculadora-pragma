import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          Responsive.distancePercentFromHeight(context, 5.9417).clamp(10, 30),
      width: Responsive.distancePercentFromWidth(context, 834961),
      child: const Image(image: AssetImage('assets/patrocina-1.png')),
    );
  }
}
