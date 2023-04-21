import 'dart:async';

import 'package:decimal/decimal.dart';

import '../../../entities/entity_bloc.dart';

class CounterBloc extends BlocModule {
  static const name = 'counterBloc';

  final BlocGeneral<int> _counterBloc = BlocGeneral<int>(0);

  final BlocGeneral<String> _value1Bloc = BlocGeneral<String>('0.0');
  final BlocGeneral<String> _value2Bloc = BlocGeneral<String>('0.0');
  final BlocGeneral<Decimal> _sumBloc = BlocGeneral<Decimal>(Decimal.parse('0.0'));

  final BlocGeneral<String> _nameOfInsectBloc = BlocGeneral<String>('insecto');

  int get counterValue => _counterBloc.value;

  Stream<int> get counterValueStream => _counterBloc.stream;

  String get nameOfInsect => _nameOfInsectBloc.value;

  Stream<String> get nameOfInsectStream => _nameOfInsectBloc.stream;

  String get value1 => _value1Bloc.value;

  String get value2 => _value2Bloc.value;

  Decimal get sum => _sumBloc.value;

  set value1(String value) => _value1Bloc.value = value;

  set value2(String value) => _value2Bloc.value = value;

  Stream<Decimal> get sumValueStream => _sumBloc.stream;

  void calculateSum() {
    _sumBloc.value = Decimal.parse(value1) + Decimal.parse(value2);
  }

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
