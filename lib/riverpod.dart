

import 'package:calculator_riverpod/states.dart';
import 'package:calculator_riverpod/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

final calculatorProvider = StateNotifierProvider<CalculatorNotifier, CalculatorState>(
    (ref) => CalculatorNotifier());

class CalculatorNotifier extends StateNotifier<CalculatorState> {
  CalculatorNotifier() : super(const InputUpdatedState(inputText: '0'));

}