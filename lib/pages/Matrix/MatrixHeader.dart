part of matrix;

class MatrixHeader extends StatefulWidget {
  MatrixHeader({
    Key key,
  }) : super(key: key);
  @override
  _MatrixHeaderState createState() => _MatrixHeaderState();
}

class _MatrixHeaderState extends State<MatrixHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          padding: EdgeInsets.all(10),
          iconSize: 40,
          icon: Icon(
            Icons.more_horiz,
            color: Colors.white30,
          ),
          onPressed: () {},
        )
      ],
    ));
  }
}
