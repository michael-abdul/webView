import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MacOS WebView with Chrome"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              const url = 'http://stayvista.uz';
              if (await canLaunch(url)) {
                await launch(
                  url,
                  forceSafariVC: false, // MacOS yoki boshqa tashqi brauzerda ochadi
                  forceWebView: false,  // WebView o'rniga brauzer ishlatiladi
                  enableJavaScript: true, // Chrome'da JS-ni qo'llab-quvvatlash uchun
                );
              } else {
                throw 'Could not launch $url';
              }
            },
            child: const Text('StayVista'),
          ),
        ),
      ),
    );
  }
}
