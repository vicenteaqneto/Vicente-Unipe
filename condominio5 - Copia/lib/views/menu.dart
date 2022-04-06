

import 'package:condominio5/views/cadastro.dart';
import 'package:condominio5/views/cadastropage1.dart';
import 'package:condominio5/views/cctv2.dart';
import 'package:condominio5/views/financeiro.dart';
import 'package:condominio5/views/login.dart';
import 'package:condominio5/views/regras.dart';
import 'package:condominio5/views/visitaspageinicial.dart';
import 'package:condominio5/whatsapp.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
int index = 0;

  Widget mudarTela() {

    switch(index) {
      case 0:
        return CctvWidget();
      case 1:
        return CadastroPage1();
      case 2:
        return Regras();
      case 3:
        return Login();
      case 4:
        return Login();
      case 5:
        return Login();
        case 6:
        return Login();
       
    }

    return Login();

  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          iconTheme: IconThemeData(color: Colors.white),
          automaticallyImplyLeading: true,
          flexibleSpace: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             
              Text(
                'Bem vindo, FULANO',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.white,
                 fontWeight: FontWeight.bold),
              ),
              
            ],
          ),
         
          elevation: 4,
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Divider(
      
            height: 35,
            thickness: 5,
            indent: 10,
            endIndent: 10,
            color: Colors.black,
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0, -0.05),
                child: ListView(
                  padding: EdgeInsets.all(20),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Text(
                      
                      'Comunicados Gerais:',
                      style: TextStyle(fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        
                      ),
                      
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: AlignmentDirectional(0.05, 0.05),
                      
                      child: Text(
                        '- Lavagem da caixa d\'água no dia 20.01.2022 - Faltará água das 8h às 14h.',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                     SizedBox(height: 15),
                    Align(
                      alignment: AlignmentDirectional(0.05, 0.05),
                      child: Text(
                        '- Dedetização das áreas comuns no dia 30.01.2022. ',
                        style: TextStyle(fontSize: 15,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                   SizedBox(height: 15),
                    Align(
                      alignment: AlignmentDirectional(0.05, 0.05),
                      child: Text(
                        '- Deposite o lixo residencial nos containers centrais até às 14 horas.', textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 15,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                
              ),
              
            ),
            const Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 10,
            color: Colors.black,
            ),
            Align(
              alignment: AlignmentDirectional(-0.25, -0.15),
              child: GridView(
                padding: EdgeInsets.all(60),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.2,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  
                 RaisedButton( child: Text("Documentos",
                  style: TextStyle(fontSize: 10, 
                  color: Colors.white, fontWeight: FontWeight.bold)) ,
                    color: Colors.blue,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Regras(),
                         ),
                        );
                        },
                     ),
                  RaisedButton( child: Text("Visitas",
                   style: TextStyle(fontSize: 10, 
                   color: Colors.white, fontWeight: FontWeight.bold)) ,
                    color:Colors.blue,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VisitasInicial(),
                         ),
                        );
                        },
                     ),
                     RaisedButton( child: Text("CCTV", 
                     style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold)) ,
                    color: Colors.blue,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  CctvWidget(),
                         ),
                        );
                        },
                     ),
                     RaisedButton( child: Text("Cadastro", 
                     style: TextStyle(fontSize: 10, 
                     color: Colors.white, fontWeight: FontWeight.bold )) ,
                    color:Colors.blue,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  CadastroPage1(),
                         ),
                        );
                        },
                     ),
                     RaisedButton( child: Text("Portaria", 
                     style: TextStyle(fontSize: 9, 
                     color: Colors.white, fontWeight: FontWeight.bold)) ,
                    color: Colors.blue,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Whatsapp(),
                         ),
                        );
                        },
                     ),
                     RaisedButton( child: Text("Financeiro",
                      style: TextStyle(fontSize: 10, 
                      color: Colors.white, fontWeight: FontWeight.bold)) ,
                    color: Colors.blue,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Financeiro(),
                         ),
                        );
                        },
                     ),
                     RaisedButton( child: Text("Sair", 
                     style: TextStyle(fontSize: 10, 
                     color: Colors.white, fontWeight: FontWeight.bold)) ,
                    color: Colors.lightBlue,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Login(),
                         ),
                        );
                        },
                     ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        
    child: ListView(
      padding: EdgeInsets.zero,
      
      children:  <Widget>[
        DrawerHeader(
          
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.camera),
          title: Text('CCTV'),
          onTap: (){
            setState(() {
              index = 0;
            });
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CctvWidget() ));
          },
        ),
        ListTile(
          leading: Icon(Icons.account_box),
          title: Text('Cadastro'),
          onTap: (){
            setState(() {
              index = 1;
            });
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CadastroPage1() ));
          },
        ),
        ListTile(
          leading: Icon(Icons.rule),
          title: Text('Documentos'),
          onTap: (){
            setState(() {
              index = 2;
            });
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Regras() ));
          },
        ),
         ListTile(
          leading: Icon(Icons.money),
          title: Text('Financeiro'),
          onTap: (){
            setState(() {
              index = 3;
            });
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Financeiro() ));
          },
        ),
         ListTile(
          leading: Icon(Icons.home),
          title: Text('Portaria'),
          onTap: (){
            setState(() {
              index = 4;
            });
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Whatsapp() ));
          },
        ),
         ListTile(
          leading: Icon(Icons.person),
          title: Text('Visitas'),
          onTap: (){
            setState(() {
              index = 5;
            });
            Navigator.push(context, MaterialPageRoute(builder: (context)=>VisitasInicial() ));
          },
        ),
         ListTile(
          leading: Icon(Icons.outbond),
          title: Text('Sair'),
         onTap: (){
            setState(() {
              index = 6;
            });
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Login() ));
          },
      
        ),
      ],
    ),
  ),
      
);
  }
}

 
