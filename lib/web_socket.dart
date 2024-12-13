import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
/*
  Future<void> printSample() async {
    try {
      final profile = await CapabilityProfile.load();
      final printer = NetworkPrinter(PaperSize.mm80, profile);

      // Attempt to connect to the printer
      final PosPrintResult res =
          await printer.connect("192.168.123.100", port: 9100);

      if (res == PosPrintResult.success) {
        print('Connection successful, starting print...');
        printer.text('Nova Team',
            styles: const PosStyles(
                height: PosTextSize.size2,
                width: PosTextSize.size2,
                align: PosAlign.left,
                bold: true,
                underline: true));
        await Future.delayed(const Duration(milliseconds: 100));
        // Print content
        printer.text('*** MuhammadYusuf ***',
            styles: const PosStyles(
                height: PosTextSize.size2,
                width: PosTextSize.size2,
                align: PosAlign.center,
                bold: true,
                underline: true));
        await Future.delayed(const Duration(milliseconds: 100));

        // printer.text('Date: ${DateTime.now().toString().split(" ")[0]}',
        //     styles: const PosStyles(align: PosAlign.left));
        // printer.text(
        //     'Time: ${DateTime.now().toString().split(" ")[1].split(".")[0]}',
        //     styles: const PosStyles(align: PosAlign.left));
        // await Future.delayed(const Duration(milliseconds: 100));

        // printer.text('--- N1 Beton ---',
        //     styles: const PosStyles(align: PosAlign.center, bold: true));
        // await Future.delayed(const Duration(milliseconds: 100));

        // // Adjusted column widths to ensure total width is 12
        // printer.row([
        //   PosColumn(text: 'Xodim', width: 6),
        //   PosColumn(text: 'Abdushukur Tursunov', width: 6),
        // ]);
        // await Future.delayed(const Duration(milliseconds: 100));

        // printer.row([
        //   PosColumn(text: 'Mijoz', width: 6),
        //   PosColumn(text: 'SSS', width: 6),
        // ]);
        // printer.row([
        //   PosColumn(text: 'Avtomabil', width: 6),
        //   PosColumn(text: '60008KAA', width: 6),
        // ]);
        // await Future.delayed(const Duration(milliseconds: 100));

        // printer.text('Miqdori: 8 Kub',
        //     styles: const PosStyles(align: PosAlign.right, bold: true));
        // await Future.delayed(const Duration(milliseconds: 100));
        // printer.row([
        //   PosColumn(text: 'Manzil', width: 6),
        //   PosColumn(text: 'Semashka', width: 6),
        // ]);
        // await Future.delayed(const Duration(milliseconds: 100));
        // printer.row([
        //   PosColumn(text: 'Telefon raqam', width: 6),
        //   PosColumn(text: '+998906936594', width: 6),
        // ]);
        // await Future.delayed(const Duration(milliseconds: 100));
        // printer.text('Thank you for shopping with us!',
        //     styles: const PosStyles(align: PosAlign.center, bold: true));
        // printer.text('Visit Again!',
        //     styles: const PosStyles(align: PosAlign.center, bold: true));
        // await Future.delayed(const Duration(milliseconds: 100));

        printer.cut();
        printer.disconnect();

        print('Print successful');
      } else {
        print('Print failed: ${res.msg}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Future<void> testConnection() async {
    try {
      final profile = await CapabilityProfile.load();
      final printer = NetworkPrinter(PaperSize.mm80, profile);

      // Test connection
      final PosPrintResult res =
          await printer.connect("192.168.123.100", port: 9100);

      if (res == PosPrintResult.success) {
        print('Connection test successful');
        printer.disconnect();
      } else {
        print('Connection test failed: ${res.msg}');
      }
    } catch (e) {
      print('Connection test error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    testConnection(); // Test connection on app startup
  }

*/

import 'package:flutter/material.dart';

class WebSocketScreen extends StatefulWidget {
  final WebSocketChannel channel;

  const WebSocketScreen({super.key, required this.channel});

  @override
  State<WebSocketScreen> createState() => _WebSocketScreenState();
}

class _WebSocketScreenState extends State<WebSocketScreen> {
  Future<void> printSample(String text) async {
    try {
      final profile = await CapabilityProfile.load();
      final printer = NetworkPrinter(PaperSize.mm80, profile);

      // Attempt to connect to the printer
      final PosPrintResult res =
          await printer.connect("192.168.123.100", port: 9100);

      if (res == PosPrintResult.success) {
        print('Connection successful, starting print...');
        await Future.delayed(const Duration(milliseconds: 100));
        // Print content
        printer.text('---NovaCode---',
            styles: const PosStyles(
                height: PosTextSize.size2,
                width: PosTextSize.size2,
                align: PosAlign.center,
                bold: true,
                underline: true));
        await Future.delayed(const Duration(milliseconds: 100));

        printer.text('Date: ${DateTime.now().toString().split(" ")[0]}',
            styles: const PosStyles(
              align: PosAlign.left,
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ));
        printer.text(
            'Time: ${DateTime.now().toString().split(" ")[1].split(".")[0]}',
            styles: const PosStyles(
              align: PosAlign.left,
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ));
        await Future.delayed(const Duration(milliseconds: 100));

        printer.text('--- N1 Beton ---',
            styles: const PosStyles(
              align: PosAlign.center,
              bold: true,
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ));
        await Future.delayed(const Duration(milliseconds: 100));

        // Adjusted column widths to ensure total width is 12
        printer.row([
          PosColumn(
            text: 'Xodim',
            width: 6,
            styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ),
          ),
          PosColumn(
            text: 'Abdushukur Tursunov',
            width: 6,
            styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ),
          ),
        ]);
        await Future.delayed(const Duration(milliseconds: 100));

        printer.row([
          PosColumn(
            text: 'Mijoz',
            width: 6,
            styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ),
          ),
          PosColumn(
            text: 'SSS',
            width: 6,
            styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ),
          ),
        ]);
        printer.row([
          PosColumn(
            text: 'Avtomabil',
            width: 6,
            styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ),
          ),
          PosColumn(
            text: '60008KAA',
            width: 6,
            styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ),
          ),
        ]);
        await Future.delayed(const Duration(milliseconds: 100));

        printer.text('Miqdori: 8 Kub',
            styles: const PosStyles(align: PosAlign.right, bold: true));
        await Future.delayed(const Duration(milliseconds: 100));
        printer.row([
          PosColumn(
            text: 'Manzil',
            width: 6,
            styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ),
          ),
          PosColumn(
            text: 'Semashka',
            width: 6,
            styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ),
          ),
        ]);
        await Future.delayed(const Duration(milliseconds: 100));
        printer.row([
          PosColumn(
            text: 'Telefon raqam',
            width: 6,
            styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ),
          ),
          PosColumn(
            text: '+998906936594',
            width: 6,
            styles: const PosStyles(
              height: PosTextSize.size2,
              width: PosTextSize.size2,
            ),
          ),
        ]);
        await Future.delayed(const Duration(milliseconds: 100));
        printer.text('');
        await Future.delayed(const Duration(milliseconds: 100));
        printer.text('');
        await Future.delayed(const Duration(milliseconds: 100));
        printer.cut();
        printer.disconnect();
        print('Print successful');
      } else {
        print('Print failed: ${res.msg}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Future<void> testConnection() async {
    try {
      final profile = await CapabilityProfile.load();
      final printer = NetworkPrinter(PaperSize.mm80, profile);

      // Test connection
      final PosPrintResult res =
          await printer.connect("192.168.123.100", port: 9100);

      if (res == PosPrintResult.success) {
        print('Connection test successful');
        printer.disconnect();
      } else {
        print('Connection test failed: ${res.msg}');
      }
    } catch (e) {
      print('Connection test error: $e');
    }
  }

  @override
  void initState() {
    testConnection();
    super.initState();
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        widget.channel.sink.add("data121212");
      }),
      appBar: AppBar(
        title: const Text('WebSocket Stream'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: widget.channel.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    printSample(snapshot.error.toString());
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    printSample(snapshot.data.toString());
                    return Center(
                      child: Text(
                        'Data: ${snapshot.data}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  } else {
                    printSample("No data received yet.");
                    return const Center(child: Text('No data received yet.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
