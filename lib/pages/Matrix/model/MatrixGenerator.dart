part of matrix_model;

class MatrixGenerator {
  int level = 0;
  PlayType type = PlayType.MatrixMemery;
  AMatrixSection section;
  MatrixInfo info;
  MatrixData data;

  MatrixGenerator(this.level, this.type) {
    if (this.type == PlayType.MatrixMemery) {
      section = new MatrixMemerySection();
    }
    info = section.getSectionConfig(level);
    data = section.getMatrixData(info);
  }

  getNewMatrixData() {
    data = section.getMatrixData(info);
    return data;
  }

  upLevel() {
    this.level++;
    info = section.getSectionConfig(level);
    data = section.getMatrixData(info);
  }
}
