import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../views/web_view.dart';
import '../widgets/button_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QRPage extends StatefulWidget {
  const QRPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  String qrCode = 'UNKNOWN';

  @override
  void initState() {
    if (qrCode.contains('http') || qrCode.contains('https')) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => WebScreen(url: qrCode)));
    }
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('QR SCANNER'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Scan Result   \n◙◙◙◙◙◙◙◙\n           ↓',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  qrCode,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 72),
                ButtonWidget(
                  text: 'Start QR scan',
                  onClicked: () => scanQRCode(),
                ),
              ],
            ),
          ),
        ),
      );

  Future<void> scanQRCode() async {
    String qrCodes;
    try {
      qrCodes = await FlutterBarcodeScanner.scanBarcode(
        '#D72F1D',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;
      setState(() {
        qrCode = qrCodes;
      });
      if (qrCode.contains('http') || qrCode.contains('https')) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WebScreen(url: qrCode)));
      }
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}
