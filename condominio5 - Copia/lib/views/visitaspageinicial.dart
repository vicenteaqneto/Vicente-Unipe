
// ignore_for_file: dead_code

import 'dart:convert';
import 'package:condominio5/views/menu.dart';
import 'package:condominio5/views/visitas.dart';
import 'package:flutter/material.dart';

class VisitasInicial extends StatefulWidget {
  const VisitasInicial({ Key key }) : super(key: key);

  @override
  
  _VisitasInicialState createState() => _VisitasInicialState();
}

class _VisitasInicialState extends State<VisitasInicial> {



  @override
  Widget build(BuildContext context) {
    var cadastroVisitas = json.decode(jsonTexto);
    var lista = " ";

      for (var i=1; i<cadastroVisitas.length; i++) {
     lista += "Nome da Visita: " +cadastroVisitas[i]["nome"] + "\n";
     lista += " Identidade: " + cadastroVisitas[i]["rg"] + "\n" ;
     lista += " Data da Visita: " + cadastroVisitas[i]["data"] + "\n"+ "\n";
     
    }
    return Scaffold(
      appBar: AppBar(title: Text("Visitas", 
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
       actions: [
        IconButton( icon:  Icon(Icons.add),
          onPressed: (){
            
           Navigator.push(context, MaterialPageRoute(builder: (context) => Visitas()),);
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
      
      SingleChildScrollView(child: Center(child:Text(lista)),
      
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

     
    // ignore: avoid_unnecessary_containers
       
  
  
    
  }
}