import 'package:flutter/material.dart';
import 'package:flutter_application_1/botones.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  var operacion = '';
  var solucion = '';

  final List<String> botones = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB8F7FF),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        operacion,
                        style: TextStyle(fontSize: 20),
                      )),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        solucion,
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: botones.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      //boton C
                      if (index == 0) {
                        return MyBoton(
                          textBoton: botones[index],
                          color: esOperador(botones[index])
                              ? Color(0xFF3F51B5)
                              : Color(0xFFFFA725),
                          textColor: Colors.white,
                          TapBoton: () {
                            setState(() {
                              operacion = '';
                            });
                          },
                        );
                      }

                      //boton DEL
                      if (index == 1) {
                        return MyBoton(
                          textBoton: botones[index],
                          color: esOperador(botones[index])
                              ? Color(0xFF3F51B5)
                              : Color(0xFFFFA725),
                          textColor: Colors.white,
                          TapBoton: () {
                            setState(() {
                              operacion =
                                  operacion.substring(0, operacion.length - 1);
                            });
                          },
                        );
                      }

                      //boton =
                      if (index == botones.length - 1) {
                        return MyBoton(
                          textBoton: botones[index],
                          color: esOperador(botones[index])
                              ? Color(0xFF3F51B5)
                              : Color(0xFFFFA725),
                          textColor: Colors.white,
                          TapBoton: () {
                            setState(() {
                              resultado();
                            });
                          },
                        );
                      }

                      return MyBoton(
                        textBoton: botones[index],
                        color: esOperador(botones[index])
                            ? Color(0xFF3F51B5)
                            : Color(0xFFFFA725),
                        textColor: Colors.white,
                        TapBoton: () {
                          setState(() {
                            operacion += botones[index];
                          });
                        },
                      );
                    }),
              ))
        ],
      ),
    );
  }

  bool esOperador(String x) {
    if (x == '%' ||
        x == '/' ||
        x == 'X' ||
        x == '-' ||
        x == '+' ||
        x == 'C' ||
        x == 'ANS' ||
        x == 'DEL' ||
        x == '=') {
      return true;
    }
    return false;
  }

  void resultado() {
    String operacionFinal = operacion;
    operacionFinal = operacionFinal.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(operacionFinal);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    solucion = eval.toString();
  }
}
//naranja = 0xFFFFA725
//azul = 0xFF3F51B5
