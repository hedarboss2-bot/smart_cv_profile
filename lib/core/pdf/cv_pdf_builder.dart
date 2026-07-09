import 'package:smart_cv_profile/models/cv/cv_document.dart';
import 'package:smart_cv_profile/models/education_model.dart';
import 'package:smart_cv_profile/models/experience_model.dart';
import 'package:smart_cv_profile/models/skill_model.dart';
import 'package:smart_cv_profile/models/user_model.dart';

class CvPdfBuilder {
  CvPdfBuilder._();

  static CvDocument build({
    required UserModel profile,
    required List<EducationModel> educations,
    required List<ExperienceModel> experiences,
    required List<SkillModel> skills,
  }) {
    return CvDocument(
      profile: profile,
      educations: educations,
      experiences: experiences,
      skills: skills,
    );
  }
}