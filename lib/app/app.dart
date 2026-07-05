import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv_profile/app/routes.dart';
import 'package:smart_cv_profile/app/theme.dart';

import 'package:smart_cv_profile/controllers/profile_controller.dart';
import 'package:smart_cv_profile/controllers/education_controller.dart';
import 'package:smart_cv_profile/controllers/experience_controller.dart';

import 'package:smart_cv_profile/screens/splash/splash_screen.dart';
import 'package:smart_cv_profile/screens/home/home_screen.dart';
import 'package:smart_cv_profile/screens/profile/personal_info_screen.dart';
import 'package:smart_cv_profile/screens/smart_id/smart_id_screen.dart';
import 'package:smart_cv_profile/screens/education/education_screen.dart';
import 'package:smart_cv_profile/screens/experience/experience_screen.dart';

class SmartCVApp extends StatelessWidget {
  const SmartCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProfileController()..loadProfile(),
        ),

        ChangeNotifierProvider(
          create: (_) => EducationController()..loadEducations(),
        ),

        ChangeNotifierProvider(
          create: (_) => ExperienceController()..loadExperiences(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart CV',

        theme: AppTheme.darkTheme,

        initialRoute: AppRoutes.splash,

        routes: {
          AppRoutes.splash: (_) => const SplashScreen(),

          AppRoutes.home: (_) => const HomeScreen(),

          AppRoutes.personalInfo: (_) => const PersonalInfoScreen(),

          AppRoutes.smartId: (_) => const SmartIdScreen(),

          AppRoutes.education: (_) => const EducationScreen(),

          AppRoutes.experience: (_) => const ExperienceScreen(),
        },
      ),
    );
  }
}