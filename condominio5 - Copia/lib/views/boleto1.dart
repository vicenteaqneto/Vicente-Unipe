
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Boleto1 extends StatefulWidget {
  const Boleto1({ Key key }) : super(key: key);

  @override
  _Boleto1State createState() => _Boleto1State();
}

class _Boleto1State extends State<Boleto1> {

  String url = "http://www.pdf995.com/samples/pdf.pdf";
 String url2 = "https://www.thecampusqdl.com/uploads/files/pdf_sample_2.pdf";
  String pdfasset = "assets/sample2.pdf";
  PDFDocument _doc;
  PDFDocument _doc2;
   bool _loading;
   
    @override
  void initState() { 
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromURL(url2);
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }
  Color textColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Documento"),
      
       actions: <Widget>[
                    
          
        ],
    
      ),
      
      body: _loading ? Center(child: CircularProgressIndicator(),) : PDFViewer(document: _doc, 
      indicatorBackground: Colors.red,
   
         
       
      // showIndicator: false,
      // showPicker: false,
       ),
       
    );
  }
}