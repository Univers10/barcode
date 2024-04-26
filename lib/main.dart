import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barcode Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BarcodePage(),
    );
  }
}

class BarcodePage extends StatefulWidget {
  @override
  BarcodePageState createState() => BarcodePageState();
}

class BarcodePageState extends State<BarcodePage> {
  String _inputData = '';
  String _dataToEncode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Parapluie'),
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) => _inputData = value,
              decoration: InputDecoration(
                labelText: 'Entrer le numéro du décodeur',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _dataToEncode = _inputData;
                });
              },
              child: Text('GENERER LE CODE'),
            ),
            SizedBox(height: 20),
            if (_dataToEncode.isNotEmpty)
              BarcodeWidget(
                barcode: Barcode.code128(),
                data: _dataToEncode,
                width: 200,
                height: 80,
                drawText: true,
              ),
          ],
        ),
      ),
    );
  }
}
