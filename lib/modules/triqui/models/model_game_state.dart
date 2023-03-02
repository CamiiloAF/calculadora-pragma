import '../../../entities/entity_model.dart';

class ModelGameState extends ModelEntity {
  ModelGameState({
    this.optionList = const [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ],
    this.nameOfWinner = '',
    this.filledBoxes = 0,
    this.isPlayerOne = true,
    this.isReadyToPlay = false,
  });

  final List<String> optionList;
  final String nameOfWinner;
  final int filledBoxes;
  final bool isPlayerOne;
  final bool isReadyToPlay;

  ModelGameState copyWith({
    List<String>? optionList,
    String? nameOfWinner,
    int? filledBoxes,
    bool? isPlayerOne,
    bool? isReadyToPlay,
  }) =>
      ModelGameState(
        optionList: optionList ?? this.optionList,
        nameOfWinner: nameOfWinner ?? this.nameOfWinner,
        filledBoxes: filledBoxes ?? this.filledBoxes,
        isPlayerOne: isPlayerOne ?? this.isPlayerOne,
        isReadyToPlay: isReadyToPlay ?? this.isReadyToPlay,
      );

  factory ModelGameState.fromJson(Map<String, dynamic> json) => ModelGameState(
        optionList: List<String>.from(json["optionList"].map((x) => x)),
        nameOfWinner: json["nameOfWinner"],
        filledBoxes: json["filledBoxes"],
        isPlayerOne: json["isPlayerOne"],
        isReadyToPlay: json["isReadyToPlay"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "optionList": List<dynamic>.from(optionList.map((x) => x)),
        "nameOfWinner": nameOfWinner,
        "filledBoxes": filledBoxes,
        "isPlayerOne": isPlayerOne,
        "isReadyToPlay": isReadyToPlay,
      };

  // @override
  // bool operator ==(Object other) {
  //   return super == other;
  // }

  @override
  ModelGameState fromJson(Map<String, dynamic> source) {
    return ModelGameState();
  }
}

/*
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
*/
