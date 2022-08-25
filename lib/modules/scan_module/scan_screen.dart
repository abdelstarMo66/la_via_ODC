import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Scan_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

Future<void> Scan() async {
  await FlutterBarcodeScanner.scanBarcode(
    '#ff6666',
    'Cancel',
    true,
    ScanMode.QR,
  ).then((value) {
  }).catchError((e) {
  });
}

