import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/controllers/profile_controller.dart';
import 'package:smart_cv_profile/widgets/smart_id_card.dart';

class SmartIdScreen extends StatelessWidget {
  const SmartIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProfileController>();
    final user = controller.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart ID"),
      ),
      body: SafeArea(
        child: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SmartIdCard(user: user),
                    const SizedBox(height: 24),

                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.share),
                            label: const Text("Share"),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.picture_as_pdf),
                            label: const Text("PDF"),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.image),
                        label: const Text("Save as Image"),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}