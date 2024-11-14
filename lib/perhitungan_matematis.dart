import 'dart:math';
import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

class PerhitunganMatematisPage extends StatefulWidget {
  const PerhitunganMatematisPage({super.key});

  @override
  _PerhitunganMatematisPageState createState() =>
      _PerhitunganMatematisPageState();
}

class _PerhitunganMatematisPageState extends State<PerhitunganMatematisPage> {
  String input = "";
  String output = "";

  void _buttonPressed(String buttonText) {
    setState(() {
      input += buttonText;
    });
  }

  void _calculate() {
    try {
      String finalInput = input;
      finalInput = finalInput.replaceAll('x', '*').replaceAll('÷', '/');

      final expression = Expression.parse(finalInput);
      const evaluator = ExpressionEvaluator();
      final result = evaluator.eval(expression, {});

      setState(() {
        output = result.toString();
      });
    } catch (e) {
      setState(() {
        output = "Error";
      });
    }
  }

  void _clearInput() {
    setState(() {
      input = "";
      output = "";
    });
  }

  void _backspace() {
    setState(() {
      input = input.isNotEmpty ? input.substring(0, input.length - 1) : '';
    });
  }

  Widget _buildButton(String buttonText) {
    return GestureDetector(
      onTap: () {
        if (buttonText == '=') {
          _calculate();
        } else if (['+', '-', 'x', '÷'].contains(buttonText)) {
          _buttonPressed(buttonText);
        } else if (['sin', 'cos', 'tan', 'sqrt', 'log', 'ln']
            .contains(buttonText)) {
          _scientificOperation(buttonText);
        } else if (buttonText == 'C') {
          _clearInput(); // Clear button
        } else if (buttonText == '<--') {
          _backspace(); // Backspace button
        } else {
          _buttonPressed(buttonText);
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(2, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: TextStyle(
            color: buttonText == 'C' || buttonText == '<--'
                ? Colors.redAccent // Different color for C and Backspace
                : Colors.blueAccent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _scientificOperation(String operation) {
    try {
      double num = double.parse(input);

      switch (operation) {
        case 'sin':
          num = sin(num);
          break;
        case 'cos':
          num = cos(num);
          break;
        case 'tan':
          num = tan(num);
          break;
        case 'sqrt':
          num = sqrt(num);
          break;
        case 'log':
          num = log(num);
          break;
        case 'ln':
          num = log(num) / ln10;
          break;
        default:
          throw Exception("Operation not supported");
      }

      setState(() {
        output = num.toString();
        input = num.toString();
      });
    } catch (e) {
      setState(() {
        output = "Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> buttons = [
      '7',
      '8',
      '9',
      '÷',
      '4',
      '5',
      '6',
      'x',
      '1',
      '2',
      '3',
      '-',
      '0',
      '.',
      '=',
      '+',
      'sin',
      'cos',
      'tan',
      'sqrt',
      '<--', // Backspace button
      'C', // Clear button
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Ilmiah'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                input,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                output,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  return _buildButton(buttons[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
