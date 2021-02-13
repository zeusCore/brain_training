library matrix_model;

import 'dart:math';

import './MatrixData.g.dart';
import '../../../common/const.dart';

part 'AMatrixSection.dart';
part 'MatrixMemerySection.dart';
part 'MatrixGenerator.dart';

class MatrixInfo {
  num complx = 0;
  int row = 2;
  int column = 2;
  int bit = 1;
  int deep = 1;
  int level = 0;
  MatrixInfo(
      this.complx, this.column, this.row, this.bit, this.deep, this.level);
}
