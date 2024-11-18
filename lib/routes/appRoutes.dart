import 'package:flutter/material.dart';
import '../models/bookModels.dart';

import '../screens/default.dart';

class AppRoutes {
  static const Default = '/default';

    static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Default:
      return MaterialPageRoute(builder: (_) => const DefaultScreen(title: "nyoba duls")
      );

      default:
      return MaterialPageRoute(builder: (_) => const Scaffold(
        body: Center(child: Text('No Route defined'),),
      ));
    }
  }

}