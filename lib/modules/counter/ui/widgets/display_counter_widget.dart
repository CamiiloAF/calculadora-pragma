import 'package:flutter/material.dart';

import '../../blocs/counter_bloc.dart';

class DisplayCounterWidget extends StatelessWidget {
  const DisplayCounterWidget({
    super.key,
    required this.fontSize,
    required this.counterBloc,
  });

  final double fontSize;
  final CounterBloc counterBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: counterBloc.counterValueStream,
        builder: (context, snapshot) {
          return Text(
            '${counterBloc.nameOfInsect}: ${counterBloc.counterValue}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: fontSize,
            ),
          );
        });
  }
}
