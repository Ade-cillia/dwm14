import 'package:dwm14/components/square.dart';
import 'package:flutter/material.dart';

class RowCube extends StatelessWidget {
  const RowCube({
    Key key,
    this.firstCubeColor,
    this.secondCubeColor,
  }) : super(key: key);

  final firstCubeColor;
  final secondCubeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Square(
          color: firstCubeColor,
        ),
        SizedBox(
          width: 10,
        ),
        Square(color: secondCubeColor),
      ],
    );
  }
}
