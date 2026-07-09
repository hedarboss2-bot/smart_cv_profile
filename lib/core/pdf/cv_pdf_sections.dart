import 'package:pdf/widgets.dart' as pw;

import 'cv_pdf_styles.dart';

class CvPdfSections {
  CvPdfSections._();

  static pw.Widget heading(String title) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 8),
      child: pw.Text(
        title,
        style: CvPdfStyles.heading(),
      ),
    );
  }

  static pw.Widget divider() {
    return pw.Divider(thickness: 0.7);
  }
}