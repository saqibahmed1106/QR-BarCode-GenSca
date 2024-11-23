import 'package:client_project/qrgenerator/main.dart';
import 'package:client_project/qrscanner/qrscan.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Client App"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 230, 30.0, 230),
          //EdgeInsets.all(30.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QRGeneratorMain()));
                  },
                  child: Text("Generate QR Code"),
                style: ElevatedButton.styleFrom(
                  //change width and height on your need width = 200 and height = 50
                  minimumSize: Size(200, 50),
                ),
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScanQR()));
                },
                child: Text("Scan QR And Bar Code"),
                style: ElevatedButton.styleFrom(
                  //change width and height on your need width = 200 and height = 50
                  minimumSize: Size(200, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
