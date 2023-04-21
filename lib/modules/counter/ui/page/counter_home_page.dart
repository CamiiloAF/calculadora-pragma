import 'package:aleteo_triqui/modules/counter/ui/widgets/counter_button_widget.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app_config.dart';
import '../../../../blocs/bloc_responsive.dart';
import '../../../../ui/widgets/forms/custom_autocomplete_input_widget.dart';
import '../../../../ui/widgets/responsive/my_app_scaffold_widget.dart';
import '../../blocs/counter_bloc.dart';

class CounterHomePage extends StatelessWidget {
  const CounterHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveBloc =
        blocCore.getBlocModule<ResponsiveBloc>(ResponsiveBloc.name);
    final counterBloc = blocCore.getBlocModule<CounterBloc>(CounterBloc.name);

    final inputFormatters = [
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
    ];

    final children = [
      CustomAutoCompleteInputWidget(
        onEditingValueFunction: (val) {
          counterBloc.value1 = val;
          return null;
        },
        label: 'Número 1',
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: inputFormatters,
      ),
      CustomAutoCompleteInputWidget(
        onEditingValueFunction: (val) {
          counterBloc.value2 = val;
          return null;
        },
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: inputFormatters,
        label: 'Número 2',
      ),
      CounterButtonWidget(
        label: 'Sumar',
        function: () {
          counterBloc.calculateSum();
        },
      ),
      StreamBuilder<Decimal>(
        stream: counterBloc.sumValueStream,
        builder: (context, snapshot) {
          return Text(
            'Resultado: ${snapshot.data?.toStringAsPrecision(18) ?? '0.0'}',
          );
        },
      )
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
