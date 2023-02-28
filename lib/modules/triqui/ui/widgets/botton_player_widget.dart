import 'package:aleteo_triqui/modules/triqui/models/model_game_state.dart';
import 'package:flutter/material.dart';

import '../../../../app_config.dart';
import '../../blocs/triqui_bloc.dart';
import '../../helpers/helpers.dart';

class BottonPlayers extends StatelessWidget {
  const BottonPlayers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final triquiBloc = blocCore.getBlocModule<TriquiBloc>(TriquiBloc.name);

    return StreamBuilder<ModelGameState>(
        stream: triquiBloc.modelGameStateStream,
        builder: (context, AsyncSnapshot<ModelGameState> snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ContainerText(
                title: 'Jugador 1 O',
                color: triquiBloc.isPlayerOne == true
                    ? Colors.white
                    : Colors.black12,
              ),
              SizedBox(
                width: Responsive.distancePercentFromWidth(context, 4.8543),
              ),
              _ContainerText(
                title: 'Jugador 2 X',
                color: triquiBloc.isPlayerOne ? Colors.black12 : Colors.white,
              ),
            ],
          );
        });
  }
}

class _ContainerText extends StatelessWidget {
  final String title;
  final Color color;
  const _ContainerText({
    required this.title,
    required this.color,

    /// TODO revisar la inclusion de Super key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: Responsive.distancePercentFromHeight(context, 4.4843),
      width: Responsive.distancePercentFromWidth(context, 34.9514),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
