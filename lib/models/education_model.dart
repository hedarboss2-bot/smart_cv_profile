class EducationModel {
  final String id;
  final String university;
  final String degree;
  final String fieldOfStudy;
  final String startDate;
  final String endDate;
  final bool isPresent;
  final String grade;
  final String description;
  final String certificatePath;

  const EducationModel({
    required this.id,
    required this.university,
    required this.degree,
    required this.fieldOfStudy,
    required this.startDate,
    required this.endDate,
    required this.isPresent,
    required this.grade,
    required this.description,
    required this.certificatePath,
  });

  factory EducationModel.empty() {
    return const EducationModel(
      id: '',
      university: '',
      degree: '',
      fieldOfStudy: '',
      startDate: '',
      endDate: '',
      isPresent: false,
      grade: '',
      description: '',
      certificatePath: '',
    );
  }

  EducationModel copyWith({
    String? id,
    String? university,
    String? degree,
    String? fieldOfStudy,
    String? startDate,
    String? endDate,
    bool? isPresent,
    String? grade,
    String? description,
    String? certificatePath,
  }) {
    return EducationModel(
      id: id ?? this.id,
      university: university ?? this.university,
      degree: degree ?? this.degree,
      fieldOfStudy: fieldOfStudy ?? this.fieldOfStudy,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isPresent: isPresent ?? this.isPresent,
      grade: grade ?? this.grade,
      description: description ?? this.description,
      certificatePath: certificatePath ?? this.certificatePath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'university': university,
      'degree': degree,
      'fieldOfStudy': fieldOfStudy,
      'startDate': startDate,
      'endDate': endDate,
      'isPresent': isPresent,
      'grade': grade,
      'description': description,
      'certificatePath': certificatePath,
    };
  }

  factory EducationModel.fromMap(Map<String, dynamic> map) {
    return EducationModel(
      id: map['id'] ?? '',
      university: map['university'] ?? '',
      degree: map['degree'] ?? '',
      fieldOfStudy: map['fieldOfStudy'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      isPresent: map['isPresent'] ?? false,
      grade: map['grade'] ?? '',
      description: map['description'] ?? '',
      certificatePath: map['certificatePath'] ?? '',
    );
  }
}