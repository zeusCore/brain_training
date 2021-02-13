part of matrix;

class MatrixMemeryMap extends StatefulWidget {
  MatrixMemeryMap({
    Key key,
  }) : super(key: key);

  @override
  _MatrixMemeryMapState createState() => _MatrixMemeryMapState();
}

class _MatrixMemeryMapState extends State<MatrixMemeryMap> {
  int activeMapIndex = 0;
  bool activeInput = false;
  int activeInputIndex = 0;

  List<String> inputs;

  handleKeyboard(String key) {}

  @override
  Widget build(BuildContext context) {
    final AMatrixState matrixState = Provider.of<MainMatrixState>(context);
    MatrixData data = matrixState.matrixData;
    MatrixInfo info = matrixState.matrixInfo;

    int rows = info.row;
    int columns = info.column;

    num screenWidth = MediaQuery.of(context).size.width;
    num screenHeight = MediaQuery.of(context).size.height;

    int maxSize = max(rows, columns);

    double boxSize = (screenWidth - 20) / maxSize;
    if (boxSize > 100) {
      boxSize = 100;
    }
    double fontSize = (30 - info.bit * 4 + (8 - maxSize) * 2).toDouble();

    if (inputs == null) {
      int count = rows * columns;
      inputs = new List();
      for (int i = 0; i < count; i++) {
        inputs.add('');
      }
    }

    return activeInput
        ? Column(children: <Widget>[
            Container(
              width: screenWidth,
              height: 30,
              child: Center(
                child: Text(
                  'level:${info.level.toString()}, deep: ${info.deep}, complx: ${info.complx}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
              width: screenWidth,
              height: screenWidth + 60,
              child: Center(
                child: Container(
                  width: boxSize * columns,
                  height: boxSize * rows,
                  color: Colors.white24,
                  child: Column(
                    children: List.generate(
                      rows,
                      (i) {
                        return Row(
                          children: List.generate(columns, (ii) {
                            int index = i * columns + ii;

                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    activeInputIndex = index;
                                    if (inputs[index].isNotEmpty) {
                                      inputs[index] = '';
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: activeInputIndex == index
                                          ? Colors.white24
                                          : Colors.transparent,
                                      border: Border.all(
                                        width: 3,
                                      )),
                                  width: boxSize,
                                  height: boxSize,
                                  child: Center(
                                    child: Text(
                                      inputs[index].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: fontSize),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: KeyboardInput(handleKeyboard),
            )
          ])
        : Column(children: <Widget>[
            Container(
              width: screenWidth,
              height: 30,
              child: Center(
                child: Text(
                  'level:${info.level.toString()}, deep: ${info.deep}, complx: ${info.complx}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(
              width: screenWidth,
              height: screenWidth + 60,
              child: Center(
                child: Container(
                  width: boxSize * columns,
                  height: boxSize * rows,
                  decoration: BoxDecoration(color: Colors.white38),
                  child: Column(
                    children: List.generate(
                      rows,
                      (i) {
                        return Row(
                          children: List.generate(columns, (ii) {
                            int index = i * columns + ii;
                            print(
                                '$columns, $ii, $index, ${data.list[activeMapIndex].length}');
                            MatrixDataListItem item =
                                data.list[activeMapIndex][index];
                            return Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 3,
                                )),
                                width: boxSize,
                                height: boxSize,
                                child: Center(
                                  child: Text(
                                    item.value,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fontSize),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: screenHeight - screenWidth - 60,
                width: screenWidth,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: info.deep > 1
                            ? List.generate(info.deep, (i) {
                                return FlatButton(
                                  color: activeMapIndex == i
                                      ? Colors.white54
                                      : Colors.white24,
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    (i + 1).toString(),
                                    style: TextStyle(
                                        color: activeMapIndex == i
                                            ? Colors.white
                                            : Colors.white70,
                                        fontSize: 24),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      activeMapIndex = i;
                                    });
                                  },
                                );
                              })
                            : [Container()],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            color: Colors.white38,
                            padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
                            child: Text(
                              '开始',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            onPressed: () {
                              setState(() {
                                activeInput = true;
                              });
                            },
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )
                  ],
                ),
              ),
            )
          ]);
  }
}
