import 'package:flutter/material.dart';

import '../../../../blocs/bloc_user_notifications.dart';

void displayAlert(BuildContext context, String winner,
    UserNotificationsBloc userNotificationsBloc) {
  // userNotificationsBloc.showGeneralAlert('GANADOR\nJugador: $winner');
  userNotificationsBloc.showAlert(
      context,
      Row(
        children: [
          const Icon(Icons.person),
          const SizedBox(
            width: 8.0,
          ),
          Text('GANADOR\nJugador: $winner')
        ],
      ));
  return;
}
