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
  //toMap
  Map<String,dynamic> toMap() => {
    "id":id,
    "title":title,
    "author":author,
    "avaliable":avaliable
    };

  //fromMap
  factory BookModel.fromMap(Map<String,dynamic> map) => BookModel(
    id: map["id"].toString(),
    title: map["title"].toString(), 
    author: map["author"].toString(),
    avaliable: map["avaliable"] == true ? true : false);
}