import 'dart:async';

import 'package:aleteo_triqui/blocs/bloc_user_notifications.dart';
import 'package:flutter/material.dart';

import '../../../entities/entity_bloc.dart';
import '../models/model_game_state.dart';

class TriquiBloc extends BlocModule {
  static const name = 'triquiBloc';
  final BlocGeneral<ModelGameState> _blocTriquiOptionsListGeneral =
      BlocGeneral<ModelGameState>(const ModelGameState());

  List<String> get optionList => _blocTriquiOptionsListGeneral.value.optionList;
  ModelGameState get modelGameState => _blocTriquiOptionsListGeneral.value;
  Stream<ModelGameState> get modelGameStateStream =>
      _blocTriquiOptionsListGeneral.stream;

  bool get isPlayerOne => modelGameState.isPlayerOne;
  bool get isReadyToPlay => modelGameState.isReadyToPlay;
  String get nameOfWinner => modelGameState.nameOfWinner;

  TriquiBloc(this.blocCore);

  void addTestingFunction(
      String nameOfFunction, Function(ModelGameState val) function) {
    _blocTriquiOptionsListGeneral.addFunctionToProcessTValueOnStream(
        nameOfFunction, function);
  }

  final BlocCore blocCore;

  void playTurn(int index, BuildContext context) {
    changeValue(index);
    checkWinner(index);
    final userNotificationBloc = blocCore
        .getBlocModule<UserNotificationsBloc>(UserNotificationsBloc.name);
    final msg =
        nameOfWinner != '' ? 'GANADOR\nJugador: $nameOfWinner' : 'Nadie Gano';
    userNotificationBloc.showGeneralAlert(msg);
  }

  void changeValue(int index) {
    final List<String> listTmp = List.of(modelGameState.optionList);
    ModelGameState modelGameStateTmp =
        modelGameState.copyWith(isPlayerOne: modelGameState.isPlayerOne);
    if (modelGameState.optionList[index] == '') {
      listTmp[index] = modelGameState.isPlayerOne ? 'o' : 'x';
      modelGameStateTmp = modelGameState.copyWith(
          optionList: listTmp,
          isPlayerOne: !modelGameState.isPlayerOne,
          isReadyToPlay: false,
          filledBoxes: modelGameState.filledBoxes + 1);
    }
    _updateModelGameState(modelGameStateTmp);
  }

  void checkWinner(int index) {
    String nameOfWinner = '';
    final List<List<int>> listOfPossibleTriquis =
        getListWithPosibleTriki(index);
    for (final tmpList in listOfPossibleTriquis) {
      if (modelGameState.optionList[tmpList[0]] ==
              modelGameState.optionList[tmpList[1]] &&
          modelGameState.optionList[tmpList[1]] ==
              modelGameState.optionList[tmpList[2]]) {
        nameOfWinner = modelGameState.optionList[tmpList[0]];
      }
    }
    _updateNameOfWinner(nameOfWinner);
    return;
  }

  void _updateNameOfWinner(String nameOfWinner) {
    _updateModelGameState(
      modelGameState.copyWith(nameOfWinner: nameOfWinner),
    );
  }

  void cleanList() {
    _updateModelGameState(const ModelGameState());
  }

  void _updateModelGameState(ModelGameState modelGameStateTmp) {
    debugPrint('Intentando actualizar el stream de datos');
    debugPrint(modelGameState.toString());
    debugPrint(modelGameStateTmp.toString());
    if (modelGameState != modelGameStateTmp) {
      debugPrint('Actualizando el Stream de datos');
      _blocTriquiOptionsListGeneral.value = modelGameStateTmp;
    }
  }

  @override
  FutureOr<void> dispose() {
    _blocTriquiOptionsListGeneral.dispose();
  }

  List<List<int>> getListWithPosibleTriki(int lastMovement) {
    const List<List<int>> posiblesTrikis = [
      [0, 1, 2], // rows
      [3, 4, 5], // rows
      [6, 7, 8], // rows
      [0, 3, 6], // columns
      [1, 4, 7], // columns
      [2, 5, 8], // columns
      [0, 4, 8], // diagonal
      [2, 4, 6], // diagonal
    ];
    List<List<int>> listWithFilterForLastMovement =
        posiblesTrikis.where((value) => value.contains(lastMovement)).toList();
    //listWithFilterForLastMovement
    //    .addAll(posiblesTrikis.where((value) => value.contains(lastMovement)));
    return listWithFilterForLastMovement;
  }
}

/*

    // ["","","","","","","o","o","o"]
    if (modelGameState.optionList[6] == modelGameState.optionList[7] &&
        modelGameState.optionList[6] == modelGameState.optionList[8] &&
        modelGameState.optionList[6] != '') {
      nameOfWinner = modelGameState.optionList[6];
    }
    // ["","","","o","o","o","","",""]
    if (modelGameState.optionList[3] == modelGameState.optionList[4] &&
        modelGameState.optionList[3] == modelGameState.optionList[5] &&
        modelGameState.optionList[3] != '') {
      nameOfWinner = modelGameState.optionList[3];
    }
    // ["o","o","o","","","","","",""]
    if (modelGameState.optionList[0] == modelGameState.optionList[1] &&
        modelGameState.optionList[0] == modelGameState.optionList[2] &&
        modelGameState.optionList[0] != '') {
      nameOfWinner = modelGameState.optionList[0];
    }
    //columnas
    // ["o","","","o","","","o","",""]
    if (modelGameState.optionList[0] == modelGameState.optionList[3] &&
        modelGameState.optionList[0] == modelGameState.optionList[6] &&
        modelGameState.optionList[0] != '') {
      nameOfWinner = modelGameState.optionList[0];
    }
    // ["","o","","","o","","","o",""]
    if (modelGameState.optionList[1] == modelGameState.optionList[4] &&
        modelGameState.optionList[1] == modelGameState.optionList[7] &&
        modelGameState.optionList[1] != '') {
      nameOfWinner = modelGameState.optionList[1];
    }
    // ["","","o","","","o","","","o"]
    if (modelGameState.optionList[2] == modelGameState.optionList[5] &&
        modelGameState.optionList[2] == modelGameState.optionList[8] &&
        modelGameState.optionList[2] != '') {
      nameOfWinner = modelGameState.optionList[2];
    }
    //diagonales
    // ["o","","","","o","","","","o"]
    if (modelGameState.optionList[0] == modelGameState.optionList[4] &&
        modelGameState.optionList[0] == modelGameState.optionList[8] &&
        modelGameState.optionList[0] != '') {
      nameOfWinner = modelGameState.optionList[0];
    }
    // ["","","o","","o","","o","",""]
    if (modelGameState.optionList[2] == modelGameState.optionList[4] &&
        modelGameState.optionList[2] == modelGameState.optionList[6] &&
        modelGameState.optionList[2] != '') {
      nameOfWinner = modelGameState.optionList[2];
    }

    // if (modelGameState.filledBoxes == 9) {
    //   _updateNameOfWinner(nameOfWinner);
    // }
    _updateNameOfWinner(nameOfWinner);


 */
////
/*

bool validarTriki(int indexLastMovement) {
  bool wasWinner = false;

  if (canMakeMovement) {
    List<List<int>> list =
        TrikiWinner.getListWithPosibleTriki(indexLastMovement);

    for (final element in list) {
      if (state[element[0]] == player &&
          state[element[1]] == player &&
          state[element[2]] == player) {
        canMakeMovement = false;
        return !wasWinner;
      }
    }
  }

  return wasWinner;
}
*/

/*
void _checkWinner() {
  var winningCases = [
    [0,1,2], [3,4,5], [6,7,8],

    [0,3,6], [1,4,7], [2,5,8],

    [0,4,8], [2,4,6],
  ];

  int? winnerIndex;
  for (var element in winningCases) {
    winnerIndex = _tryGetWinnerIndexBasedOnOptionListPositions(element[0], element[1], element[2]);
    if(winnerIndex != null) break;
  }

  String nameOfWinner = "";
  if(winnerIndex != null) nameOfWinner = modelGameState.optionList[winnerIndex];
  _updateNameOfWinner(nameOfWinner);}

int? _tryGetWinnerIndexBasedOnOptionListPositions(int position1, int position2, int position3) {
  if (modelGameState.optionList[position1] == modelGameState.optionList[position2] &&
      modelGameState.optionList[position1] == modelGameState.optionList[position3] &&
      modelGameState.optionList[position1] != '') {
    return position1;
  }

  return null;
}

 */
