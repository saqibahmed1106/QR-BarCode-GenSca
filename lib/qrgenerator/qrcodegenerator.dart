import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class QrCodeGenerator extends StatelessWidget {
  QrCodeGenerator({super.key, required this.id, required this.item, required this.price});
  final String id;
  final String item;
  final String price;

  final ScreenshotController screenshotController = ScreenshotController();

  String generateQRData(){
    return "Id : $id\nItem : $item\nPrice : $price";
  }

  Future<void> captureAndSaveImage() async{
    final Uint8List? uint8list = await screenshotController.capture();
    if(uint8list != null){
      final PermissionStatus status = await Permission.storage.request();
      if(status.isGranted){
        final result = await ImageGallerySaver.saveImage(uint8list);
        if(result["isSuccess"]){
          print("Image Saved to Gallery");
        }
        else{
          print("Failed to save image: ${result['error']}");
        }
      }
      else{
        print("Permission to access storage denied");
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    String id = generateQRData();

    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Generator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Screenshot(
              controller: screenshotController,
              child: QrImageView(
                data: id,
                version: QrVersions.auto,
                gapless: false,
                size: 320,
              ),
            ),
            SizedBox(height: 20.0,),
            Text("Scan this QR code"),
            // ElevatedButton(
            //     onPressed: () async {
            //       await captureAndSaveImage();
            //     },
            //     child: Text("Capture and Save as Image"),
            // )
          ],
        ),
      ),
    );
  }
}
