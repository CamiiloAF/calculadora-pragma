import 'package:flutter/material.dart';

import '../../../../app_config.dart';
import '../../../../blocs/bloc_responsive.dart';
import '../../../../blocs/navigator_bloc.dart';
import '../../../../ui/widgets/custom_fat_button_widget.dart';
import '../../../../ui/widgets/forms/custom_autocomplete_input_widget.dart';
import '../../../../ui/widgets/responsive/my_app_scaffold_widget.dart';
import '../../../triqui/old/main.dart';
import '../../../triqui/ui/pages/triqui_home_page.dart';
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
    double width = 150;

    final fontSize = responsiveBloc.gutterWidth * 2.5;

    final children = <Widget>[
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
      CustomAutoCompleteInputWidget(
          suggestList: const ['hormigas', 'escarabajos', 'grillos'],
          onEditingValueFunction: (value) {
            if (value.replaceAll(' ', '').isEmpty) {
              return 'Escribe un nombre. Please';
            }
            counterBloc.setInsectName(value);
            return null;
          }),
      CounterButtonWidget(
        label: 'Go to triqui',
        function: () {
          blocCore
              .getBlocModule<NavigatorBloc>(NavigatorBloc.name)
              .pushPage('triqui home', const TriquiHomePage());
        },
      ),
      CounterButtonWidget(
        label: 'Go to Morellia Triqui',
        function: () {
          blocCore
              .getBlocModule<NavigatorBloc>(NavigatorBloc.name)
              .pushPage('Morellia home', const TriquiHomeMorelliaPage());
        },
      ),
    ];

    return MyAppScaffold(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveBloc.marginWidth),
        child: ListView.builder(
          itemCount: children.length,
          itemBuilder: (context, index) {
            return children[index];
          },
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
