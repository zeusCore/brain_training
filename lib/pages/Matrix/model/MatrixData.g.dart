class MatrixDataListItem {
  String value;
  int index;

  MatrixDataListItem({
    this.value,
    this.index,
  });
  MatrixDataListItem.fromJson(Map<String, dynamic> json) {
    value = json["value"]?.toString();
    index = json["index"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["value"] = value;
    data["index"] = index;
    return data;
  }
}

class MatrixData {
  int row;
  int column;
  int deep;
  int bit;
  String type;
  List<List<MatrixDataListItem>> list;

  MatrixData({
    this.row,
    this.column,
    this.deep,
    this.bit,
    this.type,
    this.list,
  });
  MatrixData.fromJson(Map<String, dynamic> json) {
    row = json["row"]?.toInt();
    column = json["column"]?.toInt();
    deep = json["deep"]?.toInt();
    bit = json["bit"]?.toInt();
    type = json["type"]?.toString();
  if (json["list"] != null) {
  var v = json["list"];
  var arr0 = List<List<MatrixDataListItem>>();
      v.forEach((v) {
        var arr1 = List<MatrixDataListItem>();
        v.forEach((v) {
          arr1.add(MatrixDataListItem.fromJson(v));
        });
        arr0.add(arr1);
      });
    list = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["row"] = row;
    data["column"] = column;
    data["deep"] = deep;
    data["bit"] = bit;
    data["type"] = type;
    if (list != null) {
      var v = list;
      var arr0 = List();
      v.forEach((v) {
        var arr1 = List();
        v.forEach((v) {
          arr1.add(v.toJson());
        });
        arr0.add(arr1);
      });
      data["list"] = arr0;
    }
    return data;
  }
}
