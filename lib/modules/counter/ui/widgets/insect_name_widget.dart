import 'package:flutter/material.dart';

import '../../blocs/counter_bloc.dart';

class InsectNameWidget extends StatelessWidget {
  const InsectNameWidget({
    super.key,
    required this.fontSize,
    required this.counterBloc,
  });

  final double fontSize;
  final CounterBloc counterBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: counterBloc.nameOfInsectStream,
        builder: (context, snapshot) {
          return Text(
            counterBloc.nameOfInsect,
            style: TextStyle(fontSize: fontSize * 2),
          );
        });
  }
}
