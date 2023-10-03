

import 'package:university_ranking/features/university_ranking/domain/entities/geometry_entity.dart';

class GeometryModel extends Geometry {


  GeometryModel({
    List<List<List<double>>>? coordinates,
    String? type,
  }) : super(
    coordinates: coordinates,
    type: type,
  );



  factory GeometryModel.fromJson(Map<String, dynamic> json) {
    final geometry = json['geometry'] as Map<String, dynamic>?;

    if (geometry == null) {
      // Handle the case where 'geometry' is null or not present in the JSON.
      return GeometryModel(); // You might want to return an appropriate default value here.
    }

    final List<List<List<double>>>? coordinates = (geometry['coordinates'] as List?)
        ?.cast<List>()
        .map((coords) => coords
        .cast<List>()
        .map((innerCoords) => innerCoords
        .cast<double>()
        .toList())
        .toList())
        .toList();

    return GeometryModel(
      type: geometry['type'] as String?,
      coordinates: coordinates,
    );
  }

}
