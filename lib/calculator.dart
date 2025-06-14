import 'package:calculator/service/calculate.dart';
import 'package:calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  // This state class can be used to manage the state of the calculator,
  // such as the current input, the result, and any other necessary variables.
  // For example, you might want to keep track of the current input string, the
  // current operation, and the previous result.

  String currentInput = '';
  String result = '';
  String operation = '';
  String previousInput = '';
  String lastOperation = '';

  void onButtonPressed(String buttonText) {
    // Handle button presses here
    if (buttonText == 'AC') {
      currentInput = '';
      result = '';
      operation = '';
      previousInput = '';
   lastOperation = '';

    } else if (buttonText == 'C') {
      // currentInput =
      //     currentInput.isNotEmpty
      //         ? currentInput.substring(0, currentInput.length - 1)
      //         : '';
      //         if(previousInput.isNotEmpty && currentInput.length > 2){
      //           previousInput = previousInput.substring(previousInput.length-1);
      //           switch (lastOperation) {
      //             case '+':
      //               result = (double.parse(result) + double.parse(previousInput)).toString();
      //               break;
      //             case '-':
      //               result = (double.parse(result) - double.parse(previousInput)).toString();
      //               break;
      //             case '/':
      //               result =  (double.parse(result) / double.parse(previousInput)).toString();
      //               break;
      //             case '%':
      //               result = (double.parse(result) % double.parse(previousInput)).toString();
      //             case 'x':
      //              result = (double.parse(result) * double.parse(previousInput)).toString();
      //             default:
      //           }
      //         }
      return;
    } else if (buttonText == '=') {
      if (currentInput.length > 1 &&
          RegExp(r'^[0-9]$').hasMatch(currentInput[currentInput.length - 1])) {
        result =
            operations(
              symbol: currentInput[currentInput.length - 2],
              a: double.parse(result),
              b: double.parse(currentInput[currentInput.length - 1]),
            ).toString();
      } else {
        return;
      }
    } else {
      // Perform calculation based on the current input and operation
      // This is where you would implement the logic to calculate the result
      // For now, we'll just set the result to the current input
      // String symbol;
      currentInput += buttonText;
      debugPrint(currentInput);
      if (currentInput.length == 1 &&
          RegExp(r'^[0-9]$').hasMatch(currentInput)) {
        result = currentInput;
      } else if (currentInput.length == 1 &&
          RegExp(r'^[+\-x/%e\/]$').hasMatch(currentInput)) {
        // symbol = currentInput;
      } else if (currentInput.length <= 2 &&
          RegExp(
            r'^[+\-x/%e\/]$',
          ).hasMatch(currentInput[currentInput.length - 1])) {
        // symbol = currentInput[currentInput.length - 1];
      } else if (currentInput.isNotEmpty &&
          RegExp(
            r'^[+\-x/%e\/]$',
          ).hasMatch(currentInput[currentInput.length - 2]) &&
          RegExp(
            r'^[+\-x/%e\/]$',
          ).hasMatch(currentInput[currentInput.length - 1])) {
        currentInput = '';
      } else if (currentInput.length > 2 &&
          RegExp(r'^[0-9]$').hasMatch(currentInput[currentInput.length - 2]) &&
          RegExp(
            r'^[+\-x/%e\/]$',
          ).hasMatch(currentInput[currentInput.length - 1])) {
        if (previousInput.isNotEmpty) {
          result =
              operations(
                symbol: currentInput[currentInput.length - 1],
                a: double.parse(result),
                b: double.parse(previousInput),
              ).toString();
          previousInput = '';
        } else {
          result =
              operations(
                symbol: currentInput[currentInput.length - 1],
                a: double.parse(result),
                b: double.parse(currentInput[currentInput.length - 2]),
              ).toString();
          previousInput = '';
        }
        lastOperation = currentInput[currentInput.length - 1];
      } else if (currentInput.length > 1 &&
          RegExp(r'^[0-9]$').hasMatch(currentInput[currentInput.length - 1]) &&
          RegExp(r'^[0-9]$').hasMatch(currentInput[currentInput.length - 2])) {
        if (previousInput.isEmpty) {
          previousInput =
              currentInput[currentInput.length - 2] +
              currentInput[currentInput.length - 1];
        } else {
          previousInput = previousInput + currentInput[currentInput.length - 1];
        }

        debugPrint(previousInput);
      }
    }
    setState(() {});
  }

  double operations({
    required String symbol,
    required double a,
    required double b,
  }) {
    debugPrint(symbol);
    debugPrint(a.toString());
    debugPrint(b.toString());
    switch (symbol) {
      case '+':
        return CalculatorService.add(a, b);
      case '-':
        return CalculatorService.subtract(a, b);
      case 'x':
        return CalculatorService.multiply(a, b);
      case '/':
        return CalculatorService.divide(a, b);
      case '%':
        return CalculatorService.modulus(a, b);
      case 'e':
        return CalculatorService.power(a, b).toDouble();
      default:
        throw UnimplementedError('Operation not supported');
    }
  }

  @override
  Widget build(BuildContext context) {
    var children = [
      CalculatorButton(buttonText: '4', onPressed: () => onButtonPressed('4')),
      CalculatorButton(buttonText: '5', onPressed: () => onButtonPressed('5')),
      CalculatorButton(buttonText: '6', onPressed: () => onButtonPressed('6')),
      CalculatorButton(buttonText: '-', onPressed: () => onButtonPressed('-')),
    ];
    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      appBar: AppBar(
        backgroundColor: Color(0xfff7f7f7),

        title: Text(
          'Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  currentInput,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // BUTTONS
              ],
            ),
            SizedBox(height: 10),
            Row(
              spacing: 14,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  buttonText: 'AC',
                  onPressed: () => onButtonPressed('AC'),
                ),
                CalculatorButton(
                  buttonText: 'C',
                  onPressed: () => onButtonPressed('C'),
                ),
                CalculatorButton(
                  buttonText: '%',
                  onPressed: () => onButtonPressed('%'),
                ),
                CalculatorButton(
                  buttonText: '/',
                  onPressed: () => onButtonPressed('/'),
                ),
              ],
            ),
            Row(
              spacing: 14,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  buttonText: '7',
                  onPressed: () => onButtonPressed('7'),
                ),
                CalculatorButton(
                  buttonText: '8',
                  onPressed: () => onButtonPressed('8'),
                ),
                CalculatorButton(
                  buttonText: '9',
                  onPressed: () => onButtonPressed('9'),
                ),
                CalculatorButton(
                  buttonText: 'x',
                  onPressed: () => onButtonPressed('x'),
                ),
              ],
            ),
            Row(
              spacing: 14,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
            Row(
              spacing: 14,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  buttonText: '1',
                  onPressed: () => onButtonPressed('1'),
                ),
                CalculatorButton(
                  buttonText: '2',
                  onPressed: () => onButtonPressed('2'),
                ),
                CalculatorButton(
                  buttonText: '3',
                  onPressed: () => onButtonPressed('3'),
                ),
                CalculatorButton(
                  buttonText: '+',
                  onPressed: () => onButtonPressed('+'),
                ),
              ],
            ),
            Row(
              spacing: 14,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CalculatorButton(
                  buttonText: 'e',
                  onPressed: () => onButtonPressed('e'),
                ),
                CalculatorButton(
                  buttonText: '0',
                  onPressed: () => onButtonPressed('0'),
                ),
                CalculatorButton(
                  buttonText: '.',
                  onPressed: () => onButtonPressed('.'),
                ),
                CalculatorButton(
                  buttonText: '=',
                  onPressed: () => onButtonPressed('='),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
