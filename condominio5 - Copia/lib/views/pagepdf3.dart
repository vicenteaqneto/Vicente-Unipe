
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class PagePdf3 extends StatefulWidget {
  const PagePdf3({ Key key }) : super(key: key);

  @override
  _PagePdf3State createState() => _PagePdf3State();
}

class _PagePdf3State extends State<PagePdf3> {
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
    final doc = await PDFDocument.fromAsset(pdfasset);
    final doc2 = await PDFDocument.fromURL(url2);
    setState(() {
      _doc=doc;
      _doc2 = doc2;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Regimento das Piscinas"),
      
       actions: <Widget>[
                    
          
        ],
    
      ),
      
      body: _loading 
      ? Center(child: CircularProgressIndicator(),) 
      : PDFViewer(document: _doc, 
      indicatorBackground: Colors.red,
   
         
       
      // showIndicator: false,
      // showPicker: false,
       ),
       
    );
  }
}
