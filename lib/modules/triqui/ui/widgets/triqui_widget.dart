import 'package:aleteo_triqui/blocs/bloc_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app_config.dart';
import '../../blocs/triqui_bloc.dart';
import '../../helpers/helpers.dart';

class BuildTresEnRaya extends StatelessWidget {
  const BuildTresEnRaya({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    //final optionList = TriquiState.of(context).controllerTriqui.modelList.optionList
    final triquiBloc = blocCore.getBlocModule<TriquiBloc>(TriquiBloc.name);
    final squareEdge =
        Responsive.distancePercentFromWidth(context, 51.47).clamp(200.0, 380.0);
    return SizedBox(
      height: squareEdge,
      width: squareEdge,
      child: Expanded(
        flex: 3,
        child: StreamBuilder(
            stream: triquiBloc.modelGameStateStream,
            builder: (context, snapshot) {
              return GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  // print('Verificando la lista');
                  // print('Verificando la lista');
                  // print('Verificando la lista');
                  // print(triquiBloc.optionList);
                  // print(triquiBloc.optionList.length);

                  return GestureDetector(
                    onTap: () {
                      print('ME ATRAPASTE');
                      // triquiBloc.changeValue(index);
                      // triquiBloc.checkWinner();
                      // if (triquiBloc.nameOfWinner != '') {
                      //   displayAlert(context, triquiBloc.nameOfWinner);
                      // } else if (triquiBloc.modelGameState.filledBoxes == 9) {
                      //   displayAlert(context, 'Nadie Gano');
                      // }
                    },
                    child: _TriquiTileWidget(
                      index: index,
                      option: 'x',
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}

class _TriquiTileWidget extends StatelessWidget {
  const _TriquiTileWidget({
    super.key,
    required this.option,
    required this.index,
  });

  final String option;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: _getBorder(context, index)),
      child: Center(
        child: Text(
          option,
          style: TextStyle(
            color: option == 'x'
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.secondary,
            fontSize: 100,
          ),
        ),
      ),
    );
  }
}

void displayAlert(BuildContext context, String winner) {
  showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        final responsiveBloc =
            blocCore.getBlocModule<ResponsiveBloc>(ResponsiveBloc.name);

        return CupertinoAlertDialog(
          content: SizedBox(
            width: responsiveBloc.widthByColumns(2),
            //Responsive.distancePercentFromWidth(context, 83.4951),
            child: Row(
              children: [
                const Icon(Icons.person),
                SizedBox(
                  width: responsiveBloc.gutterWidth,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'GANADOR',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text('JUGADOR: $winner',
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
                SizedBox(
                  height: responsiveBloc.gutterWidth,
                )
              ],
            ),
          ),
        );
      });
}

Border _getBorder(BuildContext context, int index) {
  Border border = Border.all();
  final BorderSide borderSide =
      BorderSide(width: 6, color: Theme.of(context).primaryColor);
  switch (index) {
    case 0:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: borderSide,
            bottom: borderSide);
      }
      break;
    case 1:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: borderSide,
            bottom: borderSide);
      }
      break;
    case 2:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: BorderSide.none,
            bottom: borderSide);
      }
      break;
    case 3:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: borderSide,
            bottom: borderSide);
      }
      break;
    case 4:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: borderSide,
            bottom: borderSide);
      }
      break;
    case 5:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: BorderSide.none,
            bottom: borderSide);
      }
      break;
    case 6:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: borderSide,
            bottom: BorderSide.none);
      }
      break;
    case 7:
      {
        border = Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: borderSide,
            bottom: BorderSide.none);
      }
      break;
    case 8:
      {
        border = const Border(
            left: BorderSide.none,
            top: BorderSide.none,
            right: BorderSide.none,
            bottom: BorderSide.none);
      }
      break;
  }
  return border;
}
