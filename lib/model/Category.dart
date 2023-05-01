class Category {
  final String Category; // Category name
  final int Sort; // Sort number
  final String Reg_Date; // Date of Register

  Category({
    this.Category,
    this.Sort,
    this.Reg_Date
});

  Map<String, dynamic> toMap() => {
    'Category' : this.Category,
    'Sort' : this.Sort,
    'Reg_Date' : this.Reg_Date
  };
}