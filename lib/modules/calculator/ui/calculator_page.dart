import 'package:aleteo_triqui/ui/widgets/forms/custom_autocomplete_input_widget.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAutoCompleteInputWidget(
          onEditingValueFunction: (val) {},
          label: 'Número 1',
        )
      ],
      );
  }
}
