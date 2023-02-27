import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

class AlertWidget extends ConsumerWidget {

  String winner ;

  AlertWidget({super.key, required this.winner});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('GANADOR'),
      actions: [
        TextButton(
          onPressed: (){
            ref.read(triquiProvider.notifier).cleanList();
            //para regresar a la ventana anterior
            Navigator.pop(context);
          }, 
          child: const Text('Play again'))
      ],
    );
  }
}