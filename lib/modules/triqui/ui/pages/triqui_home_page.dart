import 'package:flutter/material.dart';
t';
import '../../../../ui/widgets/responsive/my_app_scaffold_widget.dart';
import '../../helpers/utils.dart';
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
      child: Center(
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
