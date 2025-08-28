import 'package:biblioteca_app/models/book_model.dart';
import 'package:biblioteca_app/services/api_service.dart';

class BookController {
  //obs: não precisa instanciar obj da ApiService (métodos static)

  //métodos
  //GET dos Usuários
  Future<List<BookModel>> fetchAll() async{
    final list = await ApiService.getList("books?_sort=name"); //?_sort=name -> flag para organizar em ordem alfabetica
    //retorna a lista de usuários convertida para book Model List<dynamic> => List<OBJ>
    return list.map<BookModel>((item)=>BookModel.fromMap(item)).toList();
  }

  //POST -> Criar novo usuário
  Future<BookModel> create(BookModel u) async{
    final created = await ApiService.post("books", u.toMap());
    //adiciona um usuárioe retorna o usuário criado -> ID
    return BookModel.fromMap(created);
  }

  //GET -> Buscar um Usuário
  Future<BookModel> fetchOne(String id) async{
    final book = await ApiService.getOne("books", id);
    //retorna o usuário encontrado no banco de dados
    return BookModel.fromMap(book);
  }

  //PUT -> Atualizar Usuário
  Future<BookModel> update(BookModel u) async{
    final updated = await ApiService.put("books", u.toMap(), u.id!);
    //retornma o usuário atualizado
    return BookModel.fromMap(updated);
  }

  Future<void> delete(String id) async{
    await ApiService.delete("books", id);
    //não há retorno, usuário deletado com sucesso
  }

}