import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';
import '../../utils/utils.dart';

class BottonPlayers extends ConsumerWidget {
  const BottonPlayers({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ContainerText(
          title: 'Jugador 1 O',
          color: ref.watch(triquiProvider).playerTurn
              ? Colors.white
              : Colors.black12,
        ),
        SizedBox(
          width: Responsive.distancePercentFromWidth(context, 4.8543),
        ),
        _ContainerText(
          title: 'Jugador 2 X',
          color: ref.watch(triquiProvider).playerTurn
              ? Colors.black12
              : Colors.white,
        ),
      ],
    );
  }
}

class _ContainerText extends StatelessWidget {
  final String title;
  final Color color;
  const _ContainerText({
    super.key,
    required this.title,
    required this.color,
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
