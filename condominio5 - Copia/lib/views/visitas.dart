
import 'dart:convert';
import 'visitaspageinicial.dart';

import 'package:flutter/material.dart';

var jsonTexto = '[{"nome": "Nome", "rg": 0, "data": 0}]';

class Visitas extends StatefulWidget {
  const Visitas({ Key key }) : super(key: key);

  @override
  _VisitasState createState() => _VisitasState();
}

class _VisitasState extends State<Visitas> {

  final controladorNome = TextEditingController();
  final controladorRg = TextEditingController();
  final controladorData = TextEditingController();
  
  
  final _formKey = GlobalKey<FormState>();

  void cadastroVisita() async {
    setState(() {
      String nome = controladorNome.text;
      String rg =controladorRg.text;
      String data = controladorData.text;
      
      
      var cadastroVisitas = json.decode(jsonTexto);
      cadastroVisitas.add({ "nome": nome, "rg": rg,  "data": data, });
      jsonTexto = json.encode(cadastroVisitas);
      print(jsonTexto);
     } );
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cadastro de Visitas", style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold,
      )
      ),
      actions: [
        IconButton( icon:  Icon(Icons.save),
          onPressed: (){
             cadastroVisita();
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => VisitasInicial()),
          );
          }
       ) 
       ],
       backgroundColor: Colors.blue,
      ),
      
     body: Form(
       key:_formKey,
         child: Column(
           children: [
             TextFormField(
              controller: controladorNome,
              decoration: const InputDecoration(
                icon: const Icon(Icons.assignment_ind),
                hintText: 'Digite o Nome da Visita',
                labelText: 'Visita',
                ),
               // validator não foi implementado.
                validator:(value) {
                  if (value == null || value.trim().isEmpty){
                        return 'Nome inválido';
                      }
                      if (value.trim().length < 3){
                        return "Nome tem que ter mais de 3 letras";
                }
                return null;
                },
            ),
            TextFormField(
              controller: controladorRg,
              decoration: const InputDecoration(
                icon: const Icon(Icons.assignment_ind),
                hintText: 'Digite o Rg da Visita',
                labelText: 'Rg'
              )
            ),
            TextFormField(
              controller: controladorData,
              decoration: const InputDecoration(
                icon: const Icon(Icons.assignment_ind),
                hintText: 'Digite a data da Visita',
                labelText: 'Data'
              )
            ),
              ]
     
         ),
       
     ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cadastroVisita();
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => VisitasInicial()),);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.save),
      )
      
    );
  }
}