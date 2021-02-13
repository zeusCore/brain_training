part of matrix_model;

class MatrixMemerySection extends AMatrixSection {
  List<List<num>> sections;
  static final MatrixMemerySection _instance = MatrixMemerySection._internal();
  factory MatrixMemerySection() {
    return _instance;
  }
  MatrixMemerySection._internal() {
    sections = [];
    initSection();
  }

  @override
  initSection() {
    // for (int i = 2; i < 8; i++) {
    //   for (int iii = 1; iii < 4; iii++) {
    //     sections.add([calcComplx(i, i, iii, 1), i, i, iii, 1]);
    //   }
    // }
    for (int i = 2; i < 8; i++) {
      for (int iii = 1; iii < 4; iii++) {
        for (int iiii = 1; iiii < 5; iiii++) {
          sections.add([calcComplx(i, i, iii, iiii), i, i, iii, iiii]);
        }
      }
    }
    sections.sort((a, b) => a[0] - b[0]);
    print('all level: ${sections.length}');
  }

  @override
  MatrixData getMatrixData(MatrixInfo config) {
    MatrixData data = new MatrixData(list: []);
    for (int i = 0; i < config.deep; i++) {
      List<MatrixDataListItem> deep = [];
      data.list.add(deep);
      for (int i = 0; i < config.row; i++) {
        for (int ii = 0; ii < config.column; ii++) {
          deep.add(MatrixDataListItem(
              index: i * config.column + ii,
              value: getNum(config.bit).toString()));
        }
      }
    }
    return data;
  }

  @override
  MatrixInfo getSectionConfig(int currentLevel) {
    List<num> conf = sections[currentLevel];
    return new MatrixInfo(
        conf[0], conf[1], conf[2], conf[3], conf[4], currentLevel);
  }

  num calcComplx(int _row, int _column, num _deep, num _bit) {
    return _bit * _deep * _row * _column +
        _deep * _row * _column +
        _row * _column;
  }

  num getNum(int bit) {
    Random rdm = new Random();
    switch (bit) {
      case 2:
        return ((rdm.nextInt(100))) % 90 + 9;
      case 3:
        return (rdm.nextInt(1000)) % 900 + 99;
      case 4:
        return (rdm.nextInt(10000)) % 9000 + 999;
      case 1:
      default:
        return rdm.nextInt(10) % 10;
    }
  }
}
