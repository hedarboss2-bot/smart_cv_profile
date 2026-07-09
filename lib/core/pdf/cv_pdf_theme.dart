import 'package:pdf/pdf.dart';

class CvPdfTheme {
  CvPdfTheme._();

  static const PdfColor primary = PdfColor.fromInt(0xFF4F46E5);
  static const PdfColor secondary = PdfColor.fromInt(0xFF6B7280);
  static const PdfColor text = PdfColor.fromInt(0xFF111827);
  static const PdfColor divider = PdfColor.fromInt(0xFFE5E7EB);

  static const double pageMargin = 32;
  static const double sectionSpacing = 20;
  static const double itemSpacing = 8;
}