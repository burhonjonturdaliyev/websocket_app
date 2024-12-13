import 'package:flutter/material.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';

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
  final String printerIp = '192.168.123.100'; // Replace with your printer's IP
  final int printerPort = 9100; // Default port for many receipt printers

  Future<void> printSample() async {
    try {
      final profile = await CapabilityProfile.load();
      final printer = NetworkPrinter(PaperSize.mm80, profile);

      // Attempt to connect to the printer
      final PosPrintResult res =
          await printer.connect(printerIp, port: printerPort);

      if (res == PosPrintResult.success) {
        print('Connection successful, starting print...');

        // Print content
        printer.text('*** Welcome to NovaCode ***',
            styles: const PosStyles(
                align: PosAlign.center, bold: true, underline: true));
        await Future.delayed(const Duration(milliseconds: 100));

        printer.text('Date: ${DateTime.now().toString().split(" ")[0]}',
            styles: const PosStyles(align: PosAlign.left));
        printer.text(
            'Time: ${DateTime.now().toString().split(" ")[1].split(".")[0]}',
            styles: const PosStyles(align: PosAlign.left));
        await Future.delayed(const Duration(milliseconds: 100));

        printer.text('--- N1 Beton ---',
            styles: const PosStyles(align: PosAlign.center, bold: true));
        await Future.delayed(const Duration(milliseconds: 100));

        // Adjusted column widths to ensure total width is 12
        printer.row([
          PosColumn(text: 'Xodim', width: 6),
          PosColumn(text: 'Abdushukur Tursunov', width: 6),
        ]);
        await Future.delayed(const Duration(milliseconds: 100));

        printer.row([
          PosColumn(text: 'Mijoz', width: 6),
          PosColumn(text: 'SSS', width: 6),
        ]);
        printer.row([
          PosColumn(text: 'Avtomabil', width: 6),
          PosColumn(text: '60008KAA', width: 6),
        ]);
        await Future.delayed(const Duration(milliseconds: 100));

        printer.text('Miqdori: 8 Kub',
            styles: const PosStyles(align: PosAlign.right, bold: true));
        await Future.delayed(const Duration(milliseconds: 100));
        printer.row([
          PosColumn(text: 'Manzil', width: 6),
          PosColumn(text: 'Semashka', width: 6),
        ]);
        await Future.delayed(const Duration(milliseconds: 100));
        printer.row([
          PosColumn(text: 'Telefon raqam', width: 6),
          PosColumn(text: '+998906936594', width: 6),
        ]);
        await Future.delayed(const Duration(milliseconds: 100));
        printer.text('Thank you for shopping with us!',
            styles: const PosStyles(align: PosAlign.center, bold: true));
        printer.text('Visit Again!',
            styles: const PosStyles(align: PosAlign.center, bold: true));
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
          await printer.connect(printerIp, port: printerPort);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Printer Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: printSample,
          child: const Text('Print Sample'),
        ),
      ),
    );
  }
}
