import 'package:flutter/material.dart';
import 'package:client_project/qrgenerator/qrcodegenerator.dart';

class QRGeneratorMain extends StatefulWidget {
  const QRGeneratorMain({super.key});

  @override
  State<QRGeneratorMain> createState() => _QRGeneratorMainState();
}

class _QRGeneratorMainState extends State<QRGeneratorMain> {

  final _idController = TextEditingController();
  final _itemController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generator"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(hintText: "Enter Id"),
              ),
              TextFormField(
                controller: _itemController,
                decoration: InputDecoration(hintText: "Item Name"),
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(hintText: "Item Price"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QrCodeGenerator(id: _idController.text, item: _itemController.text, price: _priceController.text,),
                    ),
                  );
                },
                child: const Text("Generate QR Code"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
