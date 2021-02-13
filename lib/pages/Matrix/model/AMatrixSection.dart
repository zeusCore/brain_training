part of matrix_model;

abstract class AMatrixSection {
  List<List<num>> sections;
  initSection();
  MatrixData getMatrixData(MatrixInfo config);
  MatrixInfo getSectionConfig(int currentLevel);
}
