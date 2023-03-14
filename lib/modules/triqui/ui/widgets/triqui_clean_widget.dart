import 'package:flutter/material.dart';

import '../../../../app_config.dart';
import '../../blocs/triqui_bloc.dart';
import '../../models/model_game_state.dart';

class TriquiCleanWidget extends StatelessWidget {
  const TriquiCleanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final triquiBloc = blocCore.getBlocModule<TriquiBloc>(TriquiBloc.name);
    return TextButton(
        onPressed: () {
          triquiBloc.cleanList();
        },
        child: StreamBuilder<ModelGameState>(
            stream: triquiBloc.modelGameStateStream,
            builder: (context, snapshot) {
              return Text(
                triquiBloc.isReadyToPlay ? 'Inicia la partida' : 'Reinicio',
                style: const TextStyle(fontSize: 24, color: Colors.black),
              );
            }));
  }
}

void showGameDialog(BuildContext context, String text) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Play Again',
              ),
            ),
          ],
        );
      });
}
