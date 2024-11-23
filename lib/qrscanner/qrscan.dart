import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {

  String scannedResult = "";

  startScan() async {
    var result;
    try{
      result = await FlutterBarcodeScanner.scanBarcode(
          "#FFFFFF",
          "Cancel",
          true,
          ScanMode.QR
      );
    } on PlatformException catch(e){
      result = "Failed to get platform version.";
      Get.snackbar("Error Occured", e.code);
    } catch(e){
      Get.snackbar("Error Occured", e.toString());
    }
    if (!mounted) return;

    setState(() {
      scannedResult = result;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 200, 30.0, 100),
          child: Column(
            children: [
              Text("Scanned Value : \n\n$scannedResult", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
              // SizedBox(height: 300.0,),

                 ElevatedButton(
                    onPressed: (){
                      startScan();
                    },
                    child: Text("Start Scan", style: TextStyle(fontSize: 20),),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
