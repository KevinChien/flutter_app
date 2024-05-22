import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:my_calculator_app/history.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _input = '';
  double _result = 0.0;
  List<String> _history = [];

  void _calculate() {
    try {
      setState(() {
        _result = eval(_input); // eval 函式計算表達式的結果
        _history.add('$_input = $_result');
      });
    } catch (e) {
      setState(() {
        _result = 0.0;
        _history.add('$_input = Error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _input = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Enter expression',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calculate,
            child: Text('Calculate'),
          ),
          SizedBox(height: 20),
          Text('Result: $_result'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => History(history: _history)),
              );
            },
            child: Text('View History'),
          ),
        ],
      ),
    );
  }
}

double eval(String expression) {
  Parser p = Parser();
  Expression exp = p.parse(expression);
  ContextModel cm = ContextModel();
  return exp.evaluate(EvaluationType.REAL, cm);
}
