import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:websocket_app/web_socket.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PrinterPage(),
    );
  }
}

class PrinterPage extends StatefulWidget {
  const PrinterPage({super.key});

  @override
  State<PrinterPage> createState() => _PrinterPageState();
}

class _PrinterPageState extends State<PrinterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Printer Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return WebSocketPrinter(
                    channel: IOWebSocketChannel.connect(
                  Uri.parse(
                      "wss://n1-beton.novacode.uz/ws/?token=6ea392d2b1e9021f3873e2c9bd0140386a01263f"),
                ));
              },
            ));
          },
          child: const Text('Print Sample'),
        ),
      ),
    );
  }
}
