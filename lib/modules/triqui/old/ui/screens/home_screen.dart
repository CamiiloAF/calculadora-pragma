import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../widgets/botton_player_widget.dart';
import '../widgets/footer.dart';
import '../widgets/triqui_clean_widget.dart';
import '../widgets/triqui_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD0BCFF),
      body: Center(
        child: Column(
          children: [
            SizedBox(
                height: Responsive.distancePercentFromHeight(context, 17.9372)),
            const BottonPlayers(),
            SizedBox(
                height: Responsive.distancePercentFromHeight(context, 4.9327)),
            const TriquiCleanWidget(),
            SizedBox(
                height: Responsive.distancePercentFromHeight(context, 6.2780)),
            const BuilTresEnRaya(),
            SizedBox(
                height: Responsive.distancePercentFromHeight(context, 19.3946)),
            const Footer()
          ],
        ),
      ),
    );
  }
}
