import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;

import 'package:smart_cv_profile/core/pdf/cv_pdf_sections.dart';
import 'package:smart_cv_profile/core/pdf/cv_pdf_styles.dart';
import 'package:smart_cv_profile/core/pdf/cv_pdf_theme.dart';
import 'package:smart_cv_profile/models/cv/cv_document.dart';

class CvPdfGenerator {
  CvPdfGenerator._();

  static Future<Uint8List> generate(CvDocument cv) async {
    final pdf = pw.Document();
    final user = cv.profile;

    pdf.addPage(
      pw.MultiPage(
        margin: const pw.EdgeInsets.all(CvPdfTheme.pageMargin),
        build: (context) => [
          // =========================
          // Header
          // =========================

          CvPdfSections.header(
            fullName: user.fullName,
            jobTitle: user.jobTitle,
            email: user.email,
            phone: user.phone,
            address: user.city.isEmpty && user.country.isEmpty
                ? "Your Address"
                : "${user.city}, ${user.country}",
          ),

          pw.SizedBox(height: CvPdfTheme.sectionSpacing),

          // =========================
          // Education
          // =========================

          CvPdfSections.heading("Education"),

          if (cv.educations.isEmpty)
            pw.Text(
              "No education added yet.",
              style: CvPdfStyles.body(),
            )
          else
            ...cv.educations.map(
              (e) => _item(
                title: e.university,
                subtitle: "${e.degree} • ${e.fieldOfStudy}",
                date: e.isPresent
                    ? "${e.startDate} - Present"
                    : "${e.startDate} - ${e.endDate}",
                description: e.description,
              ),
            ),

          pw.SizedBox(height: CvPdfTheme.sectionSpacing),
          CvPdfSections.divider(),

          // =========================
          // Experience
          // =========================

          CvPdfSections.heading("Experience"),

          if (cv.experiences.isEmpty)
            pw.Text(
              "No experience added yet.",
              style: CvPdfStyles.body(),
            )
          else
            ...cv.experiences.map(
              (e) => _item(
                title: e.position,
                subtitle: "${e.companyName} • ${e.location}",
                date: e.isCurrent
                    ? "${e.startDate} - Present"
                    : "${e.startDate} - ${e.endDate}",
                description: e.description,
              ),
            ),

          pw.SizedBox(height: CvPdfTheme.sectionSpacing),
          CvPdfSections.divider(),

          // =========================
          // Skills
          // =========================

          CvPdfSections.heading("Skills"),

          if (cv.skills.isEmpty)
            pw.Text(
              "No skills added yet.",
              style: CvPdfStyles.body(),
            )
          else
            pw.Wrap(
              spacing: 8,
              runSpacing: 8,
              children: cv.skills.map((skill) {
                return pw.Container(
                  padding: const pw.EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(),
                    borderRadius: pw.BorderRadius.circular(8),
                  ),
                  child: pw.Text(
                    "${skill.name} ${skill.level}%",
                    style: CvPdfStyles.body(),
                  ),
                );
              }).toList(),
            ),

          pw.SizedBox(height: CvPdfTheme.sectionSpacing),

          // =========================
          // Footer
          // =========================

          CvPdfSections.footer(),
        ],
      ),
    );

    return pdf.save();
  }

  static pw.Widget _item({
    required String title,
    required String subtitle,
    required String date,
    required String description,
  }) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(
        bottom: CvPdfTheme.itemSpacing,
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            title.isEmpty ? "Untitled" : title,
            style: CvPdfStyles.heading(),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            subtitle,
            style: CvPdfStyles.subtitle(),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            date,
            style: CvPdfStyles.body(),
          ),
          if (description.isNotEmpty) ...[
            pw.SizedBox(height: 4),
            pw.Text(
              description,
              style: CvPdfStyles.body(),
            ),
          ],
        ],
      ),
    );
  }
}