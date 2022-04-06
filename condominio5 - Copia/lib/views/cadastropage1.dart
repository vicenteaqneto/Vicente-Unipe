
// ignore_for_file: dead_code

import 'dart:convert';
import 'package:condominio5/views/cadastro.dart';
import 'package:condominio5/views/menu.dart';
import 'package:flutter/material.dart';

class CadastroPage1 extends StatefulWidget {
  const CadastroPage1({ Key key }) : super(key: key);

  @override
  
  _CadastroPage1State createState() => _CadastroPage1State();
}

class _CadastroPage1State extends State<CadastroPage1> {



  @override
  Widget build(BuildContext context) {
    var cadastroUsuario = json.decode(jTexto);
    var lista2 = " ";

      for (var i=1; i<cadastroUsuario.length; i++) {
     lista2 += "Nome: " +cadastroUsuario[i]["nome"] + " | ";
     lista2 += " Apartamento:  " + cadastroUsuario[i]["apartamento"] + " | "+ "\n" ;
     lista2 += " E-mail:  " + cadastroUsuario[i]["email"] + " | "+ "\n";
     lista2 += " Telefone: " + cadastroUsuario[i]["telefone"] + " | "+ "\n";
    lista2 += "  Senha: " + cadastroUsuario[i]["senha"] + "\n"+ "\n";
    }
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro", 
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
       actions: [
        IconButton( icon:  Icon(Icons.add),
          onPressed: (){
            
           Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()),);
          }
       ) 
       ],
      backgroundColor: Colors.blue,
      ),
     
      body:  Container(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
    children: [
      
      SingleChildScrollView(child: Center(child:Text(lista2)),
      
      ),
      
        
    ]),
    
      ),
    floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()),);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.arrow_back, size:30),
      )
       
    
      
      );

  }
}