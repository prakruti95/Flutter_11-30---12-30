import 'dart:io';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/bill_model.dart';

class PdfService
{
  static Future<void> generateAndSavePdf(Bill bill) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Header(
            level: 0,
            child: pw.Text('INVOICE', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
          ),
          pw.SizedBox(height: 20),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Customer Details:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text(bill.customerName),
                  pw.Text(bill.customerAddress),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text('Date: ${DateFormat('yyyy-MM-dd').format(bill.date)}'),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 20),
          pw.TableHelper.fromTextArray(
            headers: ['Description', 'Qty', 'Unit Price', 'Total'],
            data: bill.items.map((item) => [
              item.description,
              item.quantity.toString(),
              item.unitPrice.toStringAsFixed(2),
              item.total.toStringAsFixed(2),
            ]).toList(),
          ),
          pw.Divider(),
          pw.Container(
            alignment: pw.Alignment.centerRight,
            child: pw.Text(
              'Total Amount: \$${bill.totalAmount.toStringAsFixed(2)}',
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
          ),
        ],
      ),
    );

    // This will open a dialog to save or print the PDF
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name: 'Bill_${bill.customerName}.pdf',
    );
  }
}
