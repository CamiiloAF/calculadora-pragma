import 'dart:async';

import '../../../entities/entity_bloc.dart';

class CounterBloc extends BlocModule {
  static const name = 'counterBloc';

  final BlocGeneral<int> _counterBloc = BlocGeneral<int>(0);
  final BlocGeneral<String> _nameOfInsectBloc = BlocGeneral<String>('insecto');

  int get counterValue => _counterBloc.value;
  Stream<int> get counterValueStream => _counterBloc.stream;

  String get nameOfInsect => _nameOfInsectBloc.value;
  Stream<String> get nameOfInsectStream => _nameOfInsectBloc.stream;

  void incrementCounter() {
    _counterBloc.value = _counterBloc.value + 1;
  }

  void decrementCounter() {
    _counterBloc.value = (_counterBloc.value - 1).clamp(0, 999999999999);
  }

  void reset() {
    _counterBloc.value = 0;
  }

  void setInsectName(String nameOfInsectActual) {
    if (nameOfInsectActual.isNotEmpty) {
      _nameOfInsectBloc.value = nameOfInsectActual;
      reset();
    }
  }

  @override
  FutureOr<void> dispose() {
    _counterBloc.dispose();
    _nameOfInsectBloc.dispose();
  }
}
