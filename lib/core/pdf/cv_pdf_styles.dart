import 'package:pdf/widgets.dart' as pw;

class CvPdfStyles {
  CvPdfStyles._();

  static pw.TextStyle title() => pw.TextStyle(
        fontSize: 26,
        fontWeight: pw.FontWeight.bold,
      );

  static pw.TextStyle heading() => pw.TextStyle(
        fontSize: 16,
        fontWeight: pw.FontWeight.bold,
      );

  static pw.TextStyle subtitle() => const pw.TextStyle(
        fontSize: 12,
      );

  static pw.TextStyle body() => const pw.TextStyle(
        fontSize: 11,
      );
}