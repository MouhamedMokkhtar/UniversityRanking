
import '../../domain/entities/geoPoint2D_entity.dart';

class GeoPoint2DModel extends GeoPoint2D {


  const GeoPoint2DModel({
    double? lon,
    double? lat,
  }): super (
    lon: lon,
    lat: lat,
  );

  factory GeoPoint2DModel.fromJson(Map<String, dynamic> json) {
    return GeoPoint2DModel(
      lon: json['lon']?.toDouble(),
      lat: json['lat']?.toDouble(),
    );
  }
}
