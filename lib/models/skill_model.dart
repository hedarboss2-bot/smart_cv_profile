class SkillModel {
  final String id;
  final String name;
  final String category;
  final int level;
  final String description;

  const SkillModel({
    required this.id,
    required this.name,
    required this.category,
    required this.level,
    required this.description,
  });

  factory SkillModel.empty() {
    return const SkillModel(
      id: '',
      name: '',
      category: '',
      level: 0,
      description: '',
    );
  }

  SkillModel copyWith({
    String? id,
    String? name,
    String? category,
    int? level,
    String? description,
  }) {
    return SkillModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      level: level ?? this.level,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'level': level,
      'description': description,
    };
  }

  factory SkillModel.fromMap(Map<String, dynamic> map) {
    return SkillModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      level: map['level'] ?? 0,
      description: map['description'] ?? '',
    );
  }
}