import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../componant/colo.dart';

class Proj extends StatefulWidget {
  const Proj({super.key});

  @override
  State<Proj> createState() => _ProjState();
}

class _ProjState extends State<Proj> {
  List<String> symbols = [
    'C',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '.',
    '0',
    'Ans',
    '=',
  ];
  String input = "5*5";
  String output = "25";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("calculator"),
          titleTextStyle: TextStyle(color: Colors.blue, fontSize: 25),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: 90,
                margin: EdgeInsets.all(8),
                child: Text(
                  input,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: 90,
                margin: EdgeInsets.all(8),
                child: Text(
                  output,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: symbols.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          if (symbols[index] == 'C') {
                            setState(() {
                              input = '';
                              output = '';
                            });
                          } else if (symbols[index] == 'Del') {
                            setState(() {
                              input = input.substring(0, input.length - 1);
                            });
                          } else if (symbols[index] == 'Ans') {
                            setState(() {
                              input = output;
                              output = '';
                            });
                          } else if (symbols[index] == '%' ||
                              symbols[index] == '/' ||
                              symbols[index] == '*' ||
                              symbols[index] == '-' ||
                              symbols[index] == '+') {
                            if (input.endsWith('*') ||
                                input.endsWith('+') ||
                                input.endsWith('-') ||
                                input.endsWith('/') ||
                                input.endsWith('%')
                            ) {

                            }
                            else {
                              setState(() {
                                input += symbols[index];
                              });
                            }
                          } else if (symbols[index] == '=') {
                            Expression exp = Parser().parse(input);
                            double result = exp.evaluate(
                                EvaluationType.REAL, ContextModel());
                            setState(() {
                              output = result.toString();
                            });
                          } else {
                            setState(() {
                              input += symbols[index];
                            });
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(5),
                          child: Text(
                            symbols[index],
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: textcolors(symbols[index])),
                          ),
                          decoration: BoxDecoration(
                            color: buttonsColors(symbols[index]),
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ));
                  }),
            )
          ],
        ));
  }
}
