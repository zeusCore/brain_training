library store;

import 'dart:async';

import 'package:brain_training/common/const.dart';
import 'package:brain_training/pages/Matrix/model/MatrixData.g.dart';
import 'package:brain_training/pages/Matrix/model/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'AMatrixState.dart';
part 'MainMatrixState.dart';

class Store {
  static MultiProvider bind(BuildContext context, Widget child) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainMatrixState>(
            create: (context) => MainMatrixState()),
      ],
      child: child,
    );
  }
}
