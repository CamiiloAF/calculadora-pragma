import '../../../entities/entity_model.dart';

class ModelGameState extends ModelEntity {
  final List<String> optionList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  bool isPlayerOne = true;
  int filledBoxes = 0;
  bool isReadyToPlay = false;
  String nameOfWinner = '';

  void reset() {
    for (int i = 0; i < optionList.length; i++) {
      optionList[i] = '';
      isReadyToPlay = true;
      nameOfWinner = '';
      filledBoxes = 0;
    }
  }

  @override
  ModelGameState fromJson(Map<String, dynamic> source) {
    return ModelGameState();
  }

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{'optionList': optionList.toString()};
  }
}
