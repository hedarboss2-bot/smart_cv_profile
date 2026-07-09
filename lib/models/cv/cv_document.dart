import 'package:smart_cv_profile/models/education_model.dart';
import 'package:smart_cv_profile/models/experience_model.dart';
import 'package:smart_cv_profile/models/skill_model.dart';
import 'package:smart_cv_profile/models/user_model.dart';

class CvDocument {
  final UserModel profile;

  final List<EducationModel> educations;

  final List<ExperienceModel> experiences;

  final List<SkillModel> skills;

  const CvDocument({
    required this.profile,
    required this.educations,
    required this.experiences,
    required this.skills,
  });
}