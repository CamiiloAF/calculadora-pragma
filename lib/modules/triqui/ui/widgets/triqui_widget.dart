import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../app_config.dart';
import '../../blocs/triqui_bloc.dart';
import '../../helpers/helpers.dart';
import '../../models/model_game_state.dart';

class BuildTresEnRaya extends StatelessWidget {
  const BuildTresEnRaya({super.key});

  @override
  Widget build(BuildContext context) {
    //final optionList = TriquiState.of(context).controllerTriqui.modelList.optionList
    //final triquiBloc = blocCore.getBlocModule<TriquiBloc>(TriquiBloc.name);
    final squareEdge =
        Responsive.distancePercentFromWidth(context, 51.47).clamp(200.0, 380.0);
    return SizedBox(
      height: squareEdge,
      width: squareEdge,
      child: const _BoardWidget(),
    );
  }
}

class _BoardWidget extends StatefulWidget {
  const _BoardWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<_BoardWidget> {
  late StreamSubscription<ModelGameState> streamSubscription;
  late TriquiBloc triquiBloc;

  @override
  void initState() {
    super.initState();
    triquiBloc = blocCore.getBlocModule<TriquiBloc>(TriquiBloc.name);
    triquiBloc.addTestingFunction('imprimeFunction', (val) {
      debugPrint('Aqui estoy haciendo el tonto: ${val.optionList}');
    });
    streamSubscription = triquiBloc.modelGameStateStream.listen((event) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            triquiBloc.playTurn(index, context);
          },
          child: _TriquiTileWidget(
            index: index,
            option: triquiBloc.optionList[index],
          ),
        );
      },
    );
  }
}

class _TriquiTileWidget extends StatelessWidget {
  const _TriquiTileWidget({
    Key? key,
    required this.option,
    required this.index,
  }) : super(key: key);

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
                : Theme.of(context).primaryColorDark,
            fontSize: 100,
          ),
        ),
      ),
    );
  }
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
