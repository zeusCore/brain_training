part of store;

abstract class AMatrixState with ChangeNotifier {
  int level = 30;
  PlayType type = PlayType.MatrixMemery;
  MatrixData matrixData;
  MatrixInfo matrixInfo;
  AMatrixState() : super();
  setMatrix(MatrixData _matrixData, MatrixInfo _matrixInfo);
}
