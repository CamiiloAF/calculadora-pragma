import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

class TriquiCleanWidget extends ConsumerWidget {
  const TriquiCleanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
    onPressed: () {
      ref.read(triquiProvider.notifier).cleanList();
    }, 
    child: Text(
      ref.watch(triquiProvider).readyPlay?'Inicia la partida' : 'Reinicio', 
      style: const TextStyle(fontSize: 24, color: Colors.black),)
    );
    
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

