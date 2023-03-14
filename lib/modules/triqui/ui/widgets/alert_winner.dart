import 'package:flutter/material.dart';

import '../../../../app_config.dart';
import '../../blocs/triqui_bloc.dart';

class AlertWidget extends StatelessWidget {
  final String winner;

  const AlertWidget({
    super.key,
    required this.winner,
  });

  @override
  Widget build(BuildContext context) {
    // TODO revisar el acoplamiento

    final triquiBloc = blocCore.getBlocModule<TriquiBloc>(TriquiBloc.name);

    return AlertDialog(
      title: Text('$winner GANADOR'),
      actions: [
        TextButton(
            onPressed: () {
              triquiBloc.cleanList();
              //para regresar a la ventana anterior
              Navigator.pop(context);
            },
            child: const Text('Play again'))
      ],
    );
  }
}
