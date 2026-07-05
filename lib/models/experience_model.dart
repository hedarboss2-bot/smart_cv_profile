class ExperienceModel {
  final String id;
  final String companyName;
  final String position;
  final String employmentType;
  final String location;
  final String startDate;
  final String endDate;
  final bool isCurrent;
  final String description;

  const ExperienceModel({
    required this.id,
    required this.companyName,
    required this.position,
    required this.employmentType,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.isCurrent,
    required this.description,
  });

  factory ExperienceModel.empty() {
    return const ExperienceModel(
      id: '',
      companyName: '',
      position: '',
      employmentType: '',
      location: '',
      startDate: '',
      endDate: '',
      isCurrent: false,
      description: '',
    );
  }

  ExperienceModel copyWith({
    String? id,
    String? companyName,
    String? position,
    String? employmentType,
    String? location,
    String? startDate,
    String? endDate,
    bool? isCurrent,
    String? description,
  }) {
    return ExperienceModel(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      position: position ?? this.position,
      employmentType: employmentType ?? this.employmentType,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isCurrent: isCurrent ?? this.isCurrent,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'companyName': companyName,
      'position': position,
      'employmentType': employmentType,
      'location': location,
      'startDate': startDate,
      'endDate': endDate,
      'isCurrent': isCurrent,
      'description': description,
    };
  }

  factory ExperienceModel.fromMap(Map<String, dynamic> map) {
    return ExperienceModel(
      id: map['id'] ?? '',
      companyName: map['companyName'] ?? '',
      position: map['position'] ?? '',
      employmentType: map['employmentType'] ?? '',
      location: map['location'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      isCurrent: map['isCurrent'] ?? false,
      description: map['description'] ?? '',
    );
  }
}