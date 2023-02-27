import 'package:flutter/material.dart';

import '../models/model_list.dart';

class ControllerTriqui extends ChangeNotifier {
  final ModelList _modelList = ModelList();

  ModelList get modelList => _modelList;

  List<String> get optionList => modelList.optionList;

  bool get playerTurn => modelList.playerTurn;
  bool get readyPlay => modelList.readyPlay;
  String get winner => modelList.winner;

  void changeValue(int index) {
    if (modelList.playerTurn && modelList.optionList[index] == '') {
      modelList.optionList[index] = 'o';
      modelList.playerTurn = true;
      modelList.readyPlay = false;
      modelList.filledBoxes += 1;
    } else if (!modelList.playerTurn && modelList.optionList[index] == '') {
      modelList.optionList[index] = 'x';
      modelList.playerTurn = false;
      modelList.readyPlay = false;
      modelList.filledBoxes += 1;
    }
    modelList.playerTurn = !modelList.playerTurn;
    notifyListeners();
  }

  void cleanList() {
    for (int i = 0; i < modelList.optionList.length; i++) {
      modelList.optionList[i] = '';
      modelList.readyPlay = true;
      modelList.winner = '';
      modelList.filledBoxes = 0;
    }
    notifyListeners();
  }

  void checkWinner() {
    //filas
    if (modelList.optionList[0] == modelList.optionList[1] &&
        modelList.optionList[0] == modelList.optionList[2] &&
        modelList.optionList[0] != '') {
      modelList.winner = modelList.optionList[0];
    } else if (modelList.optionList[3] == modelList.optionList[4] &&
        modelList.optionList[3] == modelList.optionList[5] &&
        modelList.optionList[3] != '') {
      modelList.winner = modelList.optionList[3];
    } else if (modelList.optionList[6] == modelList.optionList[7] &&
        modelList.optionList[6] == modelList.optionList[8] &&
        modelList.optionList[6] != '') {
      modelList.winner = modelList.optionList[6];
    }
    //columnas
    else if (modelList.optionList[0] == modelList.optionList[3] &&
        modelList.optionList[0] == modelList.optionList[6] &&
        modelList.optionList[0] != '') {
      modelList.winner = modelList.optionList[0];
    } else if (modelList.optionList[1] == modelList.optionList[4] &&
        modelList.optionList[1] == modelList.optionList[7] &&
        modelList.optionList[1] != '') {
      modelList.winner = modelList.optionList[1];
    } else if (modelList.optionList[2] == modelList.optionList[5] &&
        modelList.optionList[2] == modelList.optionList[8] &&
        modelList.optionList[2] != '') {
      modelList.winner = modelList.optionList[2];
    }
    //diagonales
    else if (modelList.optionList[0] == modelList.optionList[4] &&
        modelList.optionList[0] == modelList.optionList[8] &&
        modelList.optionList[0] != '') {
      modelList.winner = modelList.optionList[0];
    } else if (modelList.optionList[2] == modelList.optionList[4] &&
        modelList.optionList[2] == modelList.optionList[6] &&
        modelList.optionList[2] != '') {
      modelList.winner = modelList.optionList[2];
    } else if (modelList.filledBoxes == 9) {
      modelList.winner = '';
    }
  }
}
