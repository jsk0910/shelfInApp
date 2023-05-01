class Book {
  final int Seq; // Number
  final String? Title; // Title of this book
  final String? Contents; // Contents of this book
  final String? isbn;
  final String? Pub_Date; // When this book was published
  final String? Author; // Who wrote this book
  final String? Publisher; // Who or What company published this book
  final String? Translator; // Who did translate this book
  final String? Price; // Price of this book
  final String? Category; // Category Class
  final String? Buy_Date; // Date of bought this book
  final String? Poster; // Poster of book
  final String? Memo; // Memo (User writing)
  final String? Shelf; // Shelf Class
  final String? Rating; // Rating value, default is 0
  final String? Reg_Date; // Date of Register

  // initialize
  Book({
    this.Seq,
    this.Title,
    this.Contents,
    this.isbn,
    this.Pub_Date,
    this.Author,
    this.Publisher,
    this.Translator,
    this.Price,
    this.Category,
    this.Buy_Date,
    this.Poster,
    this.Memo,
    this.Shelf,
    this.Rating,
    this.Reg_Date
});
  // change to Map
  Map<String, dynamic> toMap() => {
    'SEQ' : this.Seq,
    'Title' : this.Title,
    'Contents' : this.Contents,
    'ISBN' : this.isbn,
    'Pub_Date' :this.Pub_Date,
    'Author' : this.Author,
    'Publisher' : this.Publisher,
    'Translator' : this.Translator,
    'Price' : this.Price,
    'Category' : this.Category,
    'Buy_Date' : this.Buy_Date,
    'Poster' : this.Poster,
    'Memo' : this.Memo,
    'Shelf' : this.Shelf,
    'Rating' : this.Rating,
    'Reg_Date' : this.Reg_Date
  };

  // change from Map to Class Book
  Book.fromMap(Map<String, dynamic> map) {
    Seq = map['SEQ'];
    Title = map['TITLE'];
    Contents = map['CONTENTS'];
    isbn = map['ISBN'];
    Pub_Date = map['PUB_DATE'];
    Author = map['AUTHOR'];
    Publisher = map['PUBLISHER'];
    Translator = map['TRANSLATOR'];
    Price = map['PRICE'];
    Category = map['CATEGORY'];
    Buy_Date = map['BUY_DATE'];
    Poster = map['POSTER'];
    Memo = map['MEMO'];
    Shelf = map['SHELF'];
    Rating = map['RATING'];
    Reg_Date = map['REG_DATE'];
  }
}