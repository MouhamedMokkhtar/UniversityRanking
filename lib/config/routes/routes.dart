import 'package:flutter/material.dart';
import 'package:university_ranking/features/university_ranking/domain/entities/university_entity.dart';

import '../../features/university_ranking/presentation/pages/home/universities.dart';
import '../../features/university_ranking/presentation/pages/university_detail/univesity_detail.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const Universities());

      case '/UniversityDetails':
        return _materialRoute(UniversityDetail(university: settings.arguments as UniversityEntity));

      default:
        return _materialRoute(const Universities());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}