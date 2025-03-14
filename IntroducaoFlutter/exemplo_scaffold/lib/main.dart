//void main
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //estudo do Scaffold
      home: Scaffold(
        //barra de navegação superior
        appBar: AppBar(
          title: Text("Exemplo AppBar"),
          backgroundColor: Colors.blue,
        ),
        //corpo do aplicativo
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(                      
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.red
                        ),
                      ),
                      Icon(Icons.person)
                    ],
                  ), 
                  Text("Coluna 2"), 
                  Text("Coluna 3")],
              ),
              Text("Linha 2"),
              Text("Linha 3"),
            ],
          ),
        ),
        //barra lateral (menu hamburger)
        drawer: Drawer(
          child: ListView(
            children: [Text("Início"), Text("Conteúdo"), Text("Contato")],
          ),
        ),
        //barra de navegação inferior
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Pesquisa",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Usuário"),
          ],
        ),
        //botão flutuante
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Botão Clicado");
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
