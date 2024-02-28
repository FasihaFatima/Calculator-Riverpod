import 'package:flutter/material.dart';

@immutable
abstract class CalculatorState{
  const CalculatorState();
}

class InputUpdatedState extends CalculatorState{
  final String inputText;
  const InputUpdatedState({required this.inputText});
}
class OutputUpdatedState extends CalculatorState{
  final String outputText;
  const OutputUpdatedState({required this.outputText});
}