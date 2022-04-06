

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'menu.dart';

class CctvWidget extends StatefulWidget {
  const CctvWidget({Key key}) : super(key: key);

  @override
  _CctvWidgetState createState() => _CctvWidgetState();
}

class _CctvWidgetState extends State<CctvWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

@override
   void initState() {
     super.initState();
     // Enable virtual display.
      WebView.platform = AndroidWebView();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Menu(),
              ),
            );
          },
          child: Column(
            
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, -0.95),
                child: Text(
                  'CCTV',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                   width: 400,
                  height: 80,
                  decoration: BoxDecoration(color: Colors.yellow),
                  
                  child: WebView(
                 
                    initialUrl: 'https://flutter.dev',
                    
                  ),
                ),
              ),
             
               SizedBox(height: 30),
               Expanded(
                child: Container(
                   width: 400,
                  height: 80,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: WebView(
                    initialUrl: 'https://google.com',
                    
                  ),
                ),
              ),
              IconButton(
                
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
                  size: 40,
                ),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Menu(),
                    ),
                  );
                },
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}