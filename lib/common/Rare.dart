import 'dart:math';

enum RareDegree { n, r, sr, ssr, xr, xxr }
Map<RareDegree, String> rareLabel = {
  RareDegree.n: 'N',
  RareDegree.r: 'R',
  RareDegree.sr: 'SR',
  RareDegree.ssr: 'SSR',
  RareDegree.xr: 'XR',
  RareDegree.xxr: 'XXR'
};

const List RareSpace = const [
  [1001, 2000],
  [501, 1000],
  [251, 500],
  [101, 250],
  [26, 100],
  [0, 25],
];

/// 稀有度计算类
class Rare {
  Rare() {
    genRare();
  }

  Rare.noLessThan(this.min) {
    genRare();
  }

  Rare.noGreaterThan(this.max) {
    genRare();
  }

  Rare.between(this.min, this.max) {
    genRare();
  }

  bool operator >(RareDegree other) {
    return value.index > other.index;
  }

  bool operator <(RareDegree other) {
    return value.index < other.index;
  }

  bool operator >=(RareDegree other) {
    return value.index >= other.index;
  }

  bool operator <=(RareDegree other) {
    return value.index <= other.index;
  }

  RareDegree value = RareDegree.n;
  RareDegree max = RareDegree.xxr;
  RareDegree min = RareDegree.n;

  /// 与稀有度相关的随机数值
  int randomNumber = 0;

  genRare() {
    int minNum = RareSpace[max.index][0];
    int maxNum = RareSpace[min.index][1];
    Random rdm = new Random();
    randomNumber =
        (rdm.nextInt(maxNum) + new DateTime.now().millisecondsSinceEpoch) %
                maxNum +
            minNum;
    if (randomNumber > maxNum) {
      randomNumber = maxNum;
    }

    for (int i = 0, mi = min.index, ma = max.index; i >= mi && i <= ma; i++) {
      List<int> space = RareSpace[i];
      if (randomNumber >= space[0] && randomNumber <= space[1]) {
        value = RareDegree.values[i];
        break;
      }
    }
  }
}
