import 'package:flutter/material.dart';

import '../../../../ui/widgets/responsive/my_app_scaffold_widget.dart';
import '../../helpers/helpers.dart';
import '../widgets/botton_player_widget.dart';
import '../widgets/footer.dart';
import '../widgets/triqui_clean_widget.dart';
import '../widgets/triqui_widget.dart';

class TriquiHomePage extends StatelessWidget {
  const TriquiHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyAppScaffold(
      //   child: Center(
      //     child: Text(
      //         '${blocCore.getBlocModule<TriquiBloc>(TriquiBloc.name).modelGameState}'),
      //   ),
      child: Container(
        color: Colors.red,
        child: Column(
          children: [
            SizedBox(
                height: Responsive.distancePercentFromHeight(context, 17.9372)),
            const BottonPlayers(), // revisado
            SizedBox(
                height: Responsive.distancePercentFromHeight(context, 4.9327)),
            const TriquiCleanWidget(), // revisado
            SizedBox(
                height: Responsive.distancePercentFromHeight(context, 6.2780)),
            const BuildTresEnRaya(),
            SizedBox(
                height: Responsive.distancePercentFromHeight(context, 19.3946)),
            const Footer()
          ],
        ),
      ),
    );
  }
}
