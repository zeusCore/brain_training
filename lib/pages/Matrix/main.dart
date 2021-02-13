library matrix;

import 'dart:math';
import 'package:brain_training/pages/Matrix/model/MatrixData.g.dart';
import 'package:brain_training/store/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brain_training/pages/Matrix/model/main.dart';

part 'MatrixMemeryMap.dart';
part 'KeyboardInput.dart';
part 'MatrixHeader.dart';

class Matrix extends StatefulWidget {
  Matrix({
    Key key,
  }) : super(key: key);

  @override
  _MatrixState createState() => _MatrixState();
}

class _MatrixState extends State<Matrix> {
  @override
  Widget build(BuildContext context) {
    num screenWidth = MediaQuery.of(context).size.width;
    num screenHeight = MediaQuery.of(context).size.height;

    final AMatrixState matrixState = Provider.of<MainMatrixState>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          MatrixMemeryMap(),
          Positioned(
            child: MatrixHeader(),
            left: 0,
            top: 0,
            height: 60,
            width: screenWidth,
          )
        ],
      ),
    );
  }
}
