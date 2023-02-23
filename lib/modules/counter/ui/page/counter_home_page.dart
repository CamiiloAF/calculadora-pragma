import 'package:aleteo_triqui/ui/widgets/custom_fat_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../app_config.dart';
import '../../../../blocs/bloc_responsive.dart';
import '../../../../ui/widgets/responsive/my_app_scaffold_widget.dart';
import '../../blocs/counter_bloc.dart';
import '../widgets/counter_button_widget.dart';
import '../widgets/display_counter_widget.dart';
import '../widgets/display_size_screen_widget.dart';
import '../widgets/insect_name_widget.dart';

class CounterHomePage extends StatelessWidget {
  const CounterHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveBloc =
        blocCore.getBlocModule<ResponsiveBloc>(ResponsiveBloc.name);
    final counterBloc = blocCore.getBlocModule<CounterBloc>(CounterBloc.name);
    print('Seteando');
    print(responsiveBloc.size);
    double width = 150;

    final fontSize = responsiveBloc.gutterWidth * 2.5;

    return MyAppScaffold(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveBloc.marginWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InsectNameWidget(
              fontSize: fontSize,
              counterBloc: counterBloc,
            ),
            DisplaySizeScreenWidget(
              responsiveBloc: responsiveBloc,
              width: width,
            ),
            SizedBox(
              width: responsiveBloc.workAreaSize.width,
              child: DisplayCounterWidget(
                fontSize: fontSize,
                counterBloc: counterBloc,
              ),
            ),
            Wrap(
              children: [
                CounterButtonWidget(
                  label: 'Increment',
                  function: () {
                    counterBloc.incrementCounter();
                  },
                ),
                CounterButtonWidget(
                  label: 'Decrement',
                  function: () {
                    counterBloc.decrementCounter();
                  },
                ),
                CounterButtonWidget(
                  label: 'Reset',
                  function: () {
                    counterBloc.reset();
                  },
                ),
              ],
            ),
            Wrap(
              children: [
                CustomFatButtonWidget(
                  label: 'Hormigas',
                  function: () {
                    counterBloc.setInsectName('Hormigas');
                  },
                ),
                CustomFatButtonWidget(
                  label: 'Escarabajos',
                  function: () {
                    counterBloc.setInsectName('Escarabajos');
                  },
                ),
                CustomFatButtonWidget(
                  label: 'Grillos',
                  function: () {
                    counterBloc.setInsectName('Grilllos');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

///
/// Ui _> Informa al Bloc que el tamaño de la pantalla
/// Bloc realiza la logica correspondiente
/// Bloc le informa al aUI que partes deben actualizarse
/// La UI se redibuja
