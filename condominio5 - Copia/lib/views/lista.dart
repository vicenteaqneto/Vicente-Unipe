
import 'dart:convert';
import 'cadastro.dart';
import 'package:flutter/material.dart';


class Lista extends StatefulWidget {
 
  @override
  _ListaState createState() => new _ListaState();
}

class _ListaState extends State<Lista> {

var jsonTexto = '[{"nome": "nome", "apartamento":"apartamento","email": "email", "telefone": "telefone", "senha": 0}]';

  
  @override
  Widget build(BuildContext context) {
    var dicionarios = json.decode(jsonTexto);
    var lista = " ";

    for (var i =1; i<dicionarios.length; i++) {
      lista += "    Nome: " + dicionarios[i]["nome"] + " | ";
      lista += "   Apartamento:  "+ dicionarios[i]["apartamento"].toString() + " | ";
      lista += "    Email: " + dicionarios[i]["email"] + " | ";
       lista += "    Telefone: " + dicionarios[i]["telefone"] + " | ";
      lista += "    Senha: " + dicionarios[i]["senha"].toString() + "\n\n";
    }


  
    return Container(
      
      color: Colors.white,
      child: SingleChildScrollView(
      
      child: Center(child:Text(lista)),
      
      )
      
      
    );
  }
}