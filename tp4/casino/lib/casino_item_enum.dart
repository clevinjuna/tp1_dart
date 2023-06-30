enum CasinoItemEnum {
  bar(path: "images/bar.png"),
  cerise(path: "images/cerise.png"),
  cloche(path: "images/cloche.png"),
  diamant(path: "images/diamant.png"),
  ferACheval(path: "images/fer-a-cheval.png"),
  pasteque(path: "images/pasteque.png"),
  sept(path: "images/sept.png");

  const CasinoItemEnum({
    required this.path,
  });

  final String path;

  static CasinoItemEnum? getByValue(int value) {
    for (CasinoItemEnum elem in CasinoItemEnum.values) {
      if (elem.index == value) {
        return elem;
      }
    }
    return null;
  }
}