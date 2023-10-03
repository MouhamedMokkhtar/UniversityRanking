import 'geometry_entity.dart';

class GeoShape {
  GeoShape({
    this.type,
    this.geometry,
    this.properties,
  });

  final String ? type;
  final Geometry ? geometry;
  final Map<String, dynamic>? properties;

}
