import 'package:biblioteca_app/controllers/book_controller.dart';
import 'package:biblioteca_app/models/book_model.dart';
import 'package:biblioteca_app/views/home_view.dart';

import 'package:flutter/material.dart';

class BookFromView extends StatefulWidget {
  //atributo
  final BookModel? book;

  const BookFromView({super.key}); //pode ser nulo

  const BookFormView({super.key, this.book});

  @override
  State<BookFormView> createState() => _BookFormViewState();
}

class _BookFormViewState extends State<BookFormView> {
  final _formkey = GlobalKey<FormState>();
  final _controller = BookController();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  bool _available = true; // Por padrão, livro disponível

  @override
  void initState() {
    super.initState();
    //se for edição de usuário existente
    if(widget.book !=null){
    _titleController.text = widget.book!.title;
    _authorController.text = widget.book!.author;
    _available = widget.book!.avaliable;
    }
  }

  void _save() async{
    if(_formkey.currentState!.validate()){
      final book = BookModel(
        title: _titleController.text, 
        author: _authorController.text,
        avaliable: _available,
        );
      await _controller.create(book);
      Navigator.pop(context);
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context)=> HomeView()));
    }
  }

  void _update() async{
    if(_formkey.currentState!.validate()){
      final book = BookModel(
        id: widget.book?.id!,
        title: _titleController.text, 
        author: _authorController.text,
        avaliable: _available,
        );
      await _controller.update(book);
      Navigator.pop(context);
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context)=> HomeView()));
    }
  }

  //build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        widget.book == null ? "Novo Livro" : "Editar Livro"
      ),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: "Tiulo"),
                validator: (value) => value!.isEmpty? "Informe o titulo": null,
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: "autor"),
                validator: (value) => value!.isEmpty? "Informe o autor": null,
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: widget.book == null ? _save : _update,
                child: Text(widget.book == null ? "Salvar" : "Atualizar"))
            ],
          )),),
    );
  }
}