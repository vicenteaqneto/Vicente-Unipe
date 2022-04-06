
import 'dart:convert';

import 'package:condominio5/views/cadastropage1.dart';

import 'package:flutter/material.dart';

var jTexto = '[{"nome": "nome", "apartamento":0,"email": "email", "telefone": "telefone", "senha": 0}]';

class Cadastro extends StatefulWidget {
  

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

final controladorNome = TextEditingController();
final controladorApartamento = TextEditingController();
final controladorEmail = TextEditingController();
final controladorTelefone = TextEditingController();
final controladorSenha = TextEditingController();

 final _formKey = GlobalKey<FormState>();



void cadastrarPessoas() async { 
  setState(() {
    String nome = controladorNome.text;
    String apartamento =controladorApartamento.text ;
    String email = controladorEmail.text;
    String telefone = controladorTelefone.text;
    String senha = controladorSenha.text;

    
    var dicionarios = json.decode(jTexto);
    dicionarios.add({"nome": nome, "apartamento": apartamento, "email": email,
     "telefone": telefone, "senha": senha});
  jTexto = json.encode(dicionarios);
  print(jTexto);

  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Cadastro de Usuário",
       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
        color: Colors.white),
       
        ),
       backgroundColor: Colors.blue,
       actions: [
        IconButton( icon:  Icon(Icons.save),
          onPressed: (){
             cadastrarPessoas();
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => CadastroPage1()),
          );
          }
       ) 
       ],
        ),
      
      body: Form(
        key: _formKey,
            child: Column(
          children: [
            TextFormField(
              controller: controladorNome,
              decoration: const InputDecoration(
                icon: const Icon(Icons.assignment_ind),
                hintText: 'Digite o Nome',
                labelText: 'Nome'
              )
            ),
            TextFormField(
              controller: controladorApartamento,
              decoration: const InputDecoration(
                icon: const Icon(Icons.assignment_ind),
                hintText: 'Digite o  número do apartamento',
                labelText: 'Apartamento'
              )
            ),
            TextFormField(
              controller: controladorEmail,
              decoration: const InputDecoration(
                icon: const Icon(Icons.assignment_ind),
                hintText: 'Digite o Email',
                labelText: 'E-mail'
              )
            ),
            TextFormField(
              controller: controladorTelefone,
              decoration: const InputDecoration(
                icon: const Icon(Icons.assignment_ind),
                hintText: 'Digite o Telefone',
                labelText: 'Telefone',
              )
            ),
            TextFormField(
              controller: controladorSenha,
              decoration: const InputDecoration(
                icon: const Icon(Icons.assignment_ind),
                hintText: 'Digite o Senha',
                labelText: 'Senha'
              )
            ),
           

           
          ]
        )
          
        
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          cadastrarPessoas();
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => CadastroPage1()),);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.save),
      )

    );
  }
}
