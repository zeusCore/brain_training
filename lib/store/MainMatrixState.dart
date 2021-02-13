part of store;

class MainMatrixState extends AMatrixState {
  int level = 10;
  MainMatrixState() : super() {
    MatrixGenerator matrixGen = MatrixGenerator(level, PlayType.MatrixMemery);
    matrixData = matrixGen.data;
    matrixInfo = matrixGen.info;
    notifyListeners();
    // int i = 0;
    // Timer.periodic(Duration(milliseconds: 500), (t) {
    //   if (i > 9) {
    //     matrixGen.upLevel();
    //     matrixInfo = matrixGen.info;
    //     i = 0;
    //   }
    //   matrixData = matrixGen.getNewMatrixData();
    //   i++;
    //   notifyListeners();
    // });
  }

  @override
  void setMatrix(MatrixData _matrixData, MatrixInfo _matrixInfo) {
    matrixData = _matrixData;
    matrixInfo = _matrixInfo;
    notifyListeners();
  }
}
