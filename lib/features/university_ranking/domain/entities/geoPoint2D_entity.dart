import 'package:equatable/equatable.dart';

class GeoPoint2D extends Equatable{
  const GeoPoint2D({
    this.lon,
    this.lat,
  });

  final double ? lon;
  final double ? lat;

  @override
  List<Object?> get props => [
    lon,
    lat,
  ];
}
