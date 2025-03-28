import 'package:flutter/material.dart';
import 'view/tela_cad_view.dart';
import 'view/tela_conf_view.dart';
import 'view/tela_ini_view.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: { //3 tela de navegação do App
      "/": (context)=> TelaInicialView(),
      "/cadastro":(context)=>TelaCadastroView(),
      "/confirmacao":(context) => TelaConfirmacaoView()
    },
  ));
}

//quando era uma unica tema -> continuava na Class