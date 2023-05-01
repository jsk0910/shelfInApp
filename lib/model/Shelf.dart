class Shelf {
  final String Shelf; // Shelf name
  final int Sort;
  final String Reg_Date;

  Shelf({
    this.Shelf,
    this.Sort,
    this.Reg_Date
});

  Map<String, dynamic> toMap() => {
    'Shelf' : this.Shelf,
    'Sort' : this.Sort,
    'Reg_Date' : this.Reg_Date
  };
}