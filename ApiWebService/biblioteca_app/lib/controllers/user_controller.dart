import 'package:biblioteca_app/models/user_model.dart';
import 'package:biblioteca_app/services/api_service.dart';

class UserController {

  //métodos
  //GET dos Usuários
  Future<List<UserModel>> fetchAll() async{
    final list = await ApiService.getList("users?_sort=name");
    //retorna a lista de usuários convertida para User Model
    return list.map<UserModel>((item)=>UserModel.fromJson(item)).toList();
  }

  //POST -> Criar novo usuário
  Future<UserModel> create(UserModel u) async{
    final created = await ApiService.post("users", u.toJson());
    //adiciona um usuárioe retorna o usuário criado -> ID
    return UserModel.fromJson(created);
  }

  //GET -> Buscar um Usuário
  Future<UserModel> fetchOne(String id) async{
    final user = await ApiService.getOne("users", id);
    //retorna o usuário encontrado no banco de dados
    return UserModel.fromJson(user);
  }

  //PUT -> Atualizar Usuário
  Future<UserModel> update(UserModel u) async{
    final updated = await ApiService.put("users", u.toJson(), u.id!);
    //retornma o usuário atualizado
    return UserModel.fromJson(updated);
  }

  Future<void> delete(String id) async{
    await ApiService.delete("users", id);
    //não há retorno, usuário deletado com sucesso
  }

}