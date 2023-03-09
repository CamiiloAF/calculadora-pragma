import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app_config.dart';
import '../../../../blocs/bloc_responsive.dart';

void displayAlert(BuildContext context, String winner) {
  showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        final responsiveBloc =
            blocCore.getBlocModule<ResponsiveBloc>(ResponsiveBloc.name);

        return CupertinoAlertDialog(
          content: SizedBox(
            width: responsiveBloc.widthByColumns(2),
            //Responsive.distancePercentFromWidth(context, 83.4951),
            child: Row(
              children: [
                const Icon(Icons.person),
                SizedBox(
                  width: responsiveBloc.gutterWidth,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'GANADOR',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text('JUGADOR: $winner',
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
                SizedBox(
                  height: responsiveBloc.gutterWidth,
                )
              ],
            ),
          ),
        );
      });
}
