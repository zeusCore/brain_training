part of matrix;

class KeyboardInput extends StatelessWidget {
  KeyboardInput(this.clickHandler);
  final Function clickHandler;
  final List<List<String>> keys = [
    ['1', '2', '3', '<'],
    ['4', '5', '6', 'C'],
    ['7', '8', '9', '0'],
  ];

  Widget renderKeyBtn(String k) {
    switch (k) {
      case '<':
        return Icon(
          Icons.backspace,
          color: Colors.white,
        );
      case 'C':
        return Icon(
          Icons.clear,
          color: Colors.white,
        );
      default:
        return Text(
          k,
          style: TextStyle(color: Colors.white, fontSize: 26),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    int rows = keys.length;
    int columns = keys[0].length;
    num boxWidth = MediaQuery.of(context).size.width / columns - 4;
    num boxHeight = (MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.width -
                80) /
            rows -
        4;

    return Container(
      color: Colors.white10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          rows,
          (i) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(columns, (ii) {
                return SizedBox(
                  width: boxWidth,
                  height: boxHeight,
                  child: FlatButton(
                    shape: Border.all(width: 1),
                    color: Colors.white38,
                    child: renderKeyBtn(keys[i][ii]),
                    onPressed: () {
                      clickHandler(keys[i][ii]);
                    },
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
