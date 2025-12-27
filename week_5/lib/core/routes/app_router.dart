import 'package:flutter/material.dart';

import '../../features/community/presentation/pages/community_page.dart';
import '../../features/personal_data/presentation/pages/personal_data_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';

class AppRouter {
  static const String profile = '/';
  static const String personalData = '/personal-data';
  static const String community = '/community';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case personalData:
        return MaterialPageRoute(builder: (_) => const PersonalDataPage());
      case community:
        return MaterialPageRoute(builder: (_) => const CommunityPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
