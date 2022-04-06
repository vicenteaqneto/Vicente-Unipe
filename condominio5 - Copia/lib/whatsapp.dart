
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_whatsapp/open_whatsapp.dart';
import 'dart:async';


class Whatsapp extends StatefulWidget {
  const Whatsapp({ Key key }) : super(key: key);

  @override
  _WhatsappState createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      appBar: AppBar(title: Text( 'Abrir Whatsapp', ), backgroundColor: Colors.blue,),
      
       body: Center(
         child: RaisedButton(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          color: Colors.green,
          onPressed: () {
            FlutterOpenWhatsapp.sendSingleMessage('+5561982969730', 'Olá! Bom dia!');
          },
          
          child: Container(
            width: 300,
            child: Row(children: [
              Icon(Icons.whatsapp, color: Colors.white),
              SizedBox(width: 10),
              Text('Envie uma mensagem ao Porteiro', style: TextStyle (color: Colors.white)),
              ],
            )
          )
           )
       ) 
      );
    
  }
}