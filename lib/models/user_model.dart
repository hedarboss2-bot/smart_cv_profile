class UserModel {
  final String fullName;
  final String nickName;
  final String phone;
  final String email;
  final String address;
  final String birthDate;
  final String gender;
  final String country;
  final String city;
  final String jobTitle;
  final String website;
  final String about;
  final String imagePath;

  const UserModel({
    this.fullName = '',
    this.nickName = '',
    this.phone = '',
    this.email = '',
    this.address = '',
    this.birthDate = '',
    this.gender = '',
    this.country = '',
    this.city = '',
    this.jobTitle = '',
    this.website = '',
    this.about = '',
    this.imagePath = '',
  });

  UserModel copyWith({
    String? fullName,
    String? nickName,
    String? phone,
    String? email,
    String? address,
    String? birthDate,
    String? gender,
    String? country,
    String? city,
    String? jobTitle,
    String? website,
    String? about,
    String? imagePath,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      nickName: nickName ?? this.nickName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      city: city ?? this.city,
      jobTitle: jobTitle ?? this.jobTitle,
      website: website ?? this.website,
      about: about ?? this.about,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'nickName': nickName,
      'phone': phone,
      'email': email,
      'address': address,
      'birthDate': birthDate,
      'gender': gender,
      'country': country,
      'city': city,
      'jobTitle': jobTitle,
      'website': website,
      'about': about,
      'imagePath': imagePath,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map['fullName'] ?? '',
      nickName: map['nickName'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      birthDate: map['birthDate'] ?? '',
      gender: map['gender'] ?? '',
      country: map['country'] ?? '',
      city: map['city'] ?? '',
      jobTitle: map['jobTitle'] ?? '',
      website: map['website'] ?? '',
      about: map['about'] ?? '',
      imagePath: map['imagePath'] ?? '',
    );
  }
}