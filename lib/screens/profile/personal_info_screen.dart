import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/profile_controller.dart';
import 'package:smart_cv_profile/models/user_model.dart';
import 'package:smart_cv_profile/widgets/custom_button.dart';
import 'package:smart_cv_profile/widgets/custom_text_field.dart';
import 'package:smart_cv_profile/widgets/profile_avatar.dart';
import 'package:smart_cv_profile/widgets/section_title.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final fullNameController = TextEditingController();
  final nickNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final websiteController = TextEditingController();
  final jobController = TextEditingController();
  final aboutController = TextEditingController();

  bool _loaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_loaded) {
      final user = context.read<ProfileController>().user;

      fullNameController.text = user.fullName;
      nickNameController.text = user.nickName;
      phoneController.text = user.phone;
      emailController.text = user.email;
      addressController.text = user.address;
      countryController.text = user.country;
      cityController.text = user.city;
      websiteController.text = user.website;
      jobController.text = user.jobTitle;
      aboutController.text = user.about;

      _loaded = true;
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    nickNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    countryController.dispose();
    cityController.dispose();
    websiteController.dispose();
    jobController.dispose();
    aboutController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    final controller = context.read<ProfileController>();
    final oldUser = controller.user;

    final user = UserModel(
      fullName: fullNameController.text.trim(),
      nickName: nickNameController.text.trim(),
      phone: phoneController.text.trim(),
      email: emailController.text.trim(),
      address: addressController.text.trim(),
      country: countryController.text.trim(),
      city: cityController.text.trim(),
      website: websiteController.text.trim(),
      jobTitle: jobController.text.trim(),
      about: aboutController.text.trim(),
      imagePath: oldUser.imagePath,
      birthDate: oldUser.birthDate,
      gender: oldUser.gender,
    );

    await controller.saveProfile(user);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile saved successfully."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Information"),
      ),
      body: SafeArea(
        child: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(
                      title: "Personal Information",
                      subtitle: "Complete your digital identity",
                    ),
                    const SizedBox(height: 30),
                    const Center(
                      child: ProfileAvatar(),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      label: "Full Name",
                      icon: Icons.person,
                      controller: fullNameController,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      label: "Nickname",
                      icon: Icons.badge,
                      controller: nickNameController,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      label: "Phone Number",
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      label: "Email",
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      label: "Address",
                      icon: Icons.location_on,
                      maxLines: 2,
                      controller: addressController,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      label: "Country",
                      icon: Icons.flag,
                      controller: countryController,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      label: "City",
                      icon: Icons.location_city,
                      controller: cityController,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      label: "Job Title",
                      icon: Icons.work,
                      controller: jobController,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      label: "Website",
                      icon: Icons.language,
                      keyboardType: TextInputType.url,
                      controller: websiteController,
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      label: "About Me",
                      icon: Icons.info_outline,
                      maxLines: 5,
                      controller: aboutController,
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      title: "Save Profile",
                      icon: Icons.save,
                      onPressed: _saveProfile,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
      ),
    );
  }
}