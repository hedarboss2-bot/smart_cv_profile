import 'package:printing/printing.dart';

class CvPdfExporter {
  CvPdfExporter._();

  static Future<void> preview(
    LayoutCallback onLayout,
  ) async {
    await Printing.layoutPdf(
      onLayout: onLayout,
    );
  }
}