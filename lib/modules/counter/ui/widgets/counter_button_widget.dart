import 'package:flutter/material.dart';

class CounterButtonWidget extends StatelessWidget {
  const CounterButtonWidget(
      {super.key, required this.function, this.label = 'press me'});

  final VoidCallback function;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    /*
    return CustomFatButtonWidget(
      label: label,
      function: function,
    );
    */
    return InkWell(
      onTap: function,
      child: Container(
          margin: const EdgeInsets.all(5),
          alignment: Alignment.center,
          width: 100,
          height: 25,
          decoration: BoxDecoration(
              border: Border.all(
                  color: theme.buttonTheme.colorScheme?.primary ??
                      theme.primaryColor),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Text(label)),
    );
  }
}
