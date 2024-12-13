import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';

class WebSocketPrinter extends StatefulWidget {
  final WebSocketChannel channel;

  const WebSocketPrinter({super.key, required this.channel});

  @override
  State<WebSocketPrinter> createState() => _WebSocketPrinterState();
}

class _WebSocketPrinterState extends State<WebSocketPrinter> {
  void printSample(
    String text,
  ) async {
    final profile = await CapabilityProfile.load();
    const printerIp = '192.168.123.100'; // Replace with your printer IP
    const port = 9100;

    final printer = NetworkPrinter(PaperSize.mm80, profile);
    final PosPrintResult result = await printer.connect(printerIp, port: port);

    if (result == PosPrintResult.success) {
      printer.text(text,
          styles: const PosStyles(
              align: PosAlign.left,
              bold: true,
              width: PosTextSize.size2,
              height: PosTextSize.size2),
          linesAfter: 2);
      await Future.delayed(const Duration(milliseconds: 100));
      printer.feed(2);
      await Future.delayed(const Duration(milliseconds: 100));
      printer.text('Visit Again!',
          styles: const PosStyles(align: PosAlign.center, bold: true));
      await Future.delayed(const Duration(milliseconds: 100));

      printer.cut();
      printer.disconnect();

      print('Print successful');
    } else {
      debugPrint('Failed to connect to printer: $result');
    }
  }

  String formatData(String jsonData) {
    final Map<String, dynamic> data = jsonDecode(jsonData);
    return '''
ID: ${data['id']}
Quantity: ${data['quantity']}
Author: ${data['author']['first_name']} ${data['author']['last_name']}
Product: ${data['product']['name']}
Client: ${data['client']['name']}
''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebSocket Printer')),
      body: StreamBuilder(
        stream: widget.channel.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            final formattedData = formatData(snapshot.data.toString());
            printSample(formattedData);
            return Center(
              child: Text(
                formattedData,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            );
          } else {
            return const Center(child: Text('No data received yet.'));
          }
        },
      ),
    );
  }
}
