import 'dart:convert';

import 'package:flutter/foundation.dart';

abstract class ModelEntity {
  /// TODO: complete the model abstract class according to firestore documentation
  Map<String, dynamic> toJson() {
    return {};
  }

  ModelEntity fromJson(Map<String, dynamic> source);

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  Map<String, dynamic> fromString(String source) {
    var tmp = {} as Map<String, dynamic>;
    try {
      tmp = jsonDecode(source);
    } catch (e) {
      if (kDebugMode) print(e);
    }
    return tmp;
  }
}
