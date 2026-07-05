import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv_profile/controllers/profile_controller.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  void _showImagePicker(BuildContext context) {
    final controller = context.read<ProfileController>();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  title: Text(
                    "Choose Profile Photo",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text("Gallery"),
                  onTap: () {
                    Navigator.pop(context);
                    controller.pickImageFromGallery();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text("Camera"),
                  onTap: () {
                    Navigator.pop(context);
                    controller.pickImageFromCamera();
                  },
                ),
                if (controller.user.imagePath.isNotEmpty)
                  ListTile(
                    leading: const Icon(Icons.delete, color: Colors.red),
                    title: const Text("Remove Photo"),
                    onTap: () {
                      Navigator.pop(context);
                      controller.removeImage();
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final imagePath = context.watch<ProfileController>().user.imagePath;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.blue.shade700,
          backgroundImage:
              imagePath.isNotEmpty ? FileImage(File(imagePath)) : null,
          child: imagePath.isEmpty
              ? const Icon(Icons.person, size: 60, color: Colors.white)
              : null,
        ),
        FloatingActionButton.small(
          heroTag: "profile_avatar_button",
          onPressed: () => _showImagePicker(context),
          child: const Icon(Icons.camera_alt),
        ),
      ],
    );
  }
}