import 'dart:async';

import '../../../entities/entity_bloc.dart';
import '../models/model_game_state.dart';

class TriquiBloc extends BlocModule {
  static const name = 'triquiBloc';
  final BlocGeneral<ModelGameState> _blocTriquiOptionsListGeneral =
      BlocGeneral<ModelGameState>(ModelGameState());

  List<String> get optionList => _blocTriquiOptionsListGeneral.value.optionList;
  ModelGameState get modelGameState => _blocTriquiOptionsListGeneral.value;
  Stream<ModelGameState> get modelGameStateStream =>
      _blocTriquiOptionsListGeneral.stream;

  bool get isPlayerOne => modelGameState.isPlayerOne;
  bool get isReadyToPlay => modelGameState.isReadyToPlay;
  String get nameOfWinner => modelGameState.nameOfWinner;

  TriquiBloc(this.blocCore) {
    print('INICIALIZANDO EL MODELO');
    print(modelGameState);
    print(modelGameState);
  }

  final BlocCore blocCore;

  void changeValue(int index) {
    final List<String> listTmp = List.of(modelGameState.optionList);
    if (modelGameState.isPlayerOne && modelGameState.optionList[index] == '') {
      listTmp[index] = 'o';
      _updateModelGameState(
        modelGameState.copyWith(
            optionList: listTmp,
            isPlayerOne: true,
            isReadyToPlay: false,
            filledBoxes: modelGameState.filledBoxes + 1),
      );
    } else if (!modelGameState.isPlayerOne &&
        modelGameState.optionList[index] == '') {
      listTmp[index] = 'x';
      _updateModelGameState(
        modelGameState.copyWith(
            optionList: listTmp,
            isPlayerOne: false,
            isReadyToPlay: false,
            filledBoxes: modelGameState.filledBoxes + 1),
      );
    }
    modelGameState.copyWith(isPlayerOne: modelGameState.isPlayerOne);
    // modelGameState.isPlayerOne = !modelGameState.isPlayerOne;
    // _blocTriquiOptionsListGeneral.value = _blocTriquiOptionsListGeneral.value;
  }

  void checkWinner() {
    //filas
    if (modelGameState.optionList[0] == modelGameState.optionList[1] &&
        modelGameState.optionList[0] == modelGameState.optionList[2] &&
        modelGameState.optionList[0] != '') {
      _updateNameOfWinner(modelGameState.optionList[0]);
//      modelGameState.nameOfWinner = modelGameState.optionList[0];
    } else if (modelGameState.optionList[3] == modelGameState.optionList[4] &&
        modelGameState.optionList[3] == modelGameState.optionList[5] &&
        modelGameState.optionList[3] != '') {
      _updateNameOfWinner(modelGameState.optionList[3]);
      // modelGameState.nameOfWinner = modelGameState.optionList[3];
    } else if (modelGameState.optionList[6] == modelGameState.optionList[7] &&
        modelGameState.optionList[6] == modelGameState.optionList[8] &&
        modelGameState.optionList[6] != '') {
      _updateNameOfWinner(modelGameState.optionList[6]);
      // modelGameState.nameOfWinner = modelGameState.optionList[6];
    }
    //columnas
    else if (modelGameState.optionList[0] == modelGameState.optionList[3] &&
        modelGameState.optionList[0] == modelGameState.optionList[6] &&
        modelGameState.optionList[0] != '') {
      _updateNameOfWinner(modelGameState.optionList[0]);
      // modelGameState.nameOfWinner = modelGameState.optionList[0];
    } else if (modelGameState.optionList[1] == modelGameState.optionList[4] &&
        modelGameState.optionList[1] == modelGameState.optionList[7] &&
        modelGameState.optionList[1] != '') {
      _updateNameOfWinner(modelGameState.optionList[0]);
      // modelGameState.nameOfWinner = modelGameState.optionList[1];
    } else if (modelGameState.optionList[2] == modelGameState.optionList[5] &&
        modelGameState.optionList[2] == modelGameState.optionList[8] &&
        modelGameState.optionList[2] != '') {
      _updateNameOfWinner(modelGameState.optionList[2]);
      // modelGameState.nameOfWinner = modelGameState.optionList[2];
    }
    //diagonales
    else if (modelGameState.optionList[0] == modelGameState.optionList[4] &&
        modelGameState.optionList[0] == modelGameState.optionList[8] &&
        modelGameState.optionList[0] != '') {
      _updateNameOfWinner(modelGameState.optionList[0]);
      // modelGameState.nameOfWinner = modelGameState.optionList[0];
    } else if (modelGameState.optionList[2] == modelGameState.optionList[4] &&
        modelGameState.optionList[2] == modelGameState.optionList[6] &&
        modelGameState.optionList[2] != '') {
      _updateNameOfWinner(modelGameState.optionList[2]);
      // modelGameState.nameOfWinner = modelGameState.optionList[2];
    } else if (modelGameState.filledBoxes == 9) {
      _updateNameOfWinner('');
      //modelGameState.nameOfWinner = '';
    }
  }

  void _updateNameOfWinner(String nameOfWinner) {
    _updateModelGameState(
      modelGameState.copyWith(nameOfWinner: nameOfWinner),
    );
  }

  void cleanList() {
    _updateModelGameState(ModelGameState());
  }

  void _updateModelGameState(ModelGameState modelGameStateTmp) {
    _blocTriquiOptionsListGeneral.value = modelGameState;
  }

  @override
  FutureOr<void> dispose() {
    _blocTriquiOptionsListGeneral.dispose();
  }
}
