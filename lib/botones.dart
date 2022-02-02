import 'package:flutter/material.dart';

class MyBoton extends StatelessWidget {
  final color;
  final textColor;
  final String textBoton;
  final TapBoton;

  MyBoton({this.color, this.textColor, required this.textBoton, this.TapBoton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: TapBoton,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                textBoton,
                style: TextStyle(color: textColor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
