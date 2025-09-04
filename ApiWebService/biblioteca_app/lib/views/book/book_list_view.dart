import 'package:biblioteca_app/controllers/book_controller.dart';
import 'package:biblioteca_app/models/book_model.dart';
import 'package:biblioteca_app/views/book/book_from_view.dart';
import 'package:flutter/material.dart';



class BookListView extends StatefulWidget {
  @override
  _BookListViewState createState() => _BookListViewState();
}

class _BookListViewState extends State<BookListView> {
  final _controller = BookController(); // Controlador para interagir com a API
  late Future<List<BookModel>> _bookList; // Lista futura de livros

  @override
  void initState() {
    super.initState();
    _bookList = _controller.fetchAll(); // Obtendo todos os livros ao carregar a tela
  }

  // Função para excluir um livro
  void _deleteBook(String id) async {
    try {
      await _controller.delete(id); // Deleta o livro pelo ID
      setState(() {
        _bookList = _controller.fetchAll(); // Atualiza a lista de livros
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Livro excluído com sucesso')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao excluir livro')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Livros'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Navega para a tela de adicionar novo livro
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookFormView()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<BookModel>>(
        future: _bookList, // Chama a função que busca todos os livros
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Exibe um carregando
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar livros')); // Exibe erro
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum livro encontrado')); // Se não houver livros
          }

          // Lista de livros
          final books = snapshot.data!;

          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];

              return ListTile(
                title: Text(book.title), // Exibe o título do livro
                subtitle: Text('Autor: ${book.author}'), // Exibe o autor
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteBook(book.id!), // Deleta o livro
                ),
                onTap: () {
                  // Navega para a tela de edição, passando o livro selecionado
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookFormView(book: book),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
