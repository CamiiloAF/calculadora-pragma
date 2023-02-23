import 'package:flutter/material.dart';

import '../../../../blocs/bloc_responsive.dart';

class DisplaySizeScreenWidget extends StatelessWidget {
  const DisplaySizeScreenWidget({
    super.key,
    required this.responsiveBloc,
    required this.width,
  });

  final ResponsiveBloc responsiveBloc;
  final double width;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Size>(
        stream: responsiveBloc.appScreenSizeStream,
        builder: (context, snapshot) {
          return Container(
            width: width,
            height: width,
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text(
                //'HOLA MUNDO'
                'Counter demo\n${responsiveBloc.value}\n${snapshot.data}'),
          );
        });
  }
}
