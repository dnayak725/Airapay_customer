import 'package:aira_pay/Shop/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  @override
  String qrCode = 'Unknown';
  Widget build(BuildContext context) {
    return Scaffold();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    scanQRCode();
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(false),
                        ));
    } on PlatformException {
      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(false),
                        ));
      qrCode = 'Failed to get platform version.';
    }
  }
}
