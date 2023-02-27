import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controllers/controller_triqui.dart';
import 'my_app.dart';

final triquiProvider = ChangeNotifierProvider((ref) {
  return ControllerTriqui();
});

class TriquiHomeMorelliaPage extends StatefulWidget {
  const TriquiHomeMorelliaPage({Key? key}) : super(key: key);

  @override
  State<TriquiHomeMorelliaPage> createState() => _TriquiHomeMorelliaPageState();
}

class _TriquiHomeMorelliaPageState extends State<TriquiHomeMorelliaPage> {
  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MyApp(),
    );
  }
}

// void main() {
//   runApp(
//     const ProviderScope(child: MyApp()));
// }
