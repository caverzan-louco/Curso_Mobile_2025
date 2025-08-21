class BookModel {
  //atributos
  final String? id; // pode ser nulo inicialmente
  final String title;
  final String author;
  final bool avaliable;
  //construtor
  BookModel({
    this.id,
    required this.title,
    required this.author,
    required this.avaliable,
  });

  //métodos
  //toJson
  Map<String,dynamic> toJson() => {
    "id":id,
    "title":title,
    "author":author,
    "avaliable":avaliable
    };

  //fromJson
  factory BookModel.fromJson(Map<String,dynamic> json) => BookModel(
    id: json["id"].toString(),
    title: json["title"].toString(), 
    author: json["author"].toString(),
    avaliable: json["avaliable"]);
}