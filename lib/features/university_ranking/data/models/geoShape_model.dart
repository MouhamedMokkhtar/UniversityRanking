
import '../../domain/entities/geoShape_entity.dart';
import 'geometry_model.dart';

class GeoShapeModel extends GeoShape {

  GeoShapeModel({
    String? type,
    GeometryModel? geometry,
    Map<String, dynamic>? properties,
  }): super(
    type: type,
    geometry: geometry,
    properties: properties,
  );

  factory GeoShapeModel.fromJson(Map<String, dynamic> json) {
    return GeoShapeModel(
      type: json['type'],
      geometry: GeometryModel.fromJson(json['geometry']),
      properties: json['properties'],
    );
  }
}
