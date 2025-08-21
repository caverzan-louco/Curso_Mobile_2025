class LoansModel {
  //atributos
  final String? id; // pode ser nulo inicialmente
  final String userId;
  final String startDate;
  final String dueDate;
  final bool returned;
  //construtor
  LoansModel({
    this.id,
    required this.userId,
    required this.startDate,
    required this.dueDate,
    required this.returned,
  });

  //métodos
  //toJson
  Map<String,dynamic> toJson() => {
    "id":id,
    "userId":userId,
    "starDate":startDate,
    "dueDate":dueDate,
    "returned":returned
    };

  //fromJson
  factory LoansModel.fromJson(Map<String,dynamic> json) => LoansModel(
    id: json["id"].toString(),
    userId: json["title"].toString(), 
    startDate: json["startDate"].toString(),
    dueDate: json["dueDate"].toString(),
    returned: json["returned"]);
}