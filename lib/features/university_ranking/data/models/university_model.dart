import 'package:equatable/equatable.dart';


import '../../domain/entities/university_entity.dart';
import 'geoPoint2D_model.dart';
import 'geoShape_model.dart';
import 'geometry_model.dart';


class UniversityModel extends UniversityEntity {

  UniversityModel({
    String? worldRank,
    String? universityName,
    String? nationalRank,
    double? totalScore,
    double? alumni,
    double? award,
    double? hici,
    double? ns,
    double? pub,
    double? pcp,
    String? year,
    int? worldRankInt,
    String? country,
    String? iso2Code,
    String? iso3Code,
    GeoShapeModel? geoShape,
    GeoPoint2DModel? geoPoint2D,
  }) : super(
    worldRank: worldRank,
    universityName: universityName,
    nationalRank: nationalRank,
    totalScore: totalScore,
    alumni: alumni,
    award: award,
    hici: hici,
    ns: ns,
    pub: pub,
    pcp: pcp,
    year: year,
    worldRankInt: worldRankInt,
    country: country,
    iso2Code: iso2Code,
    iso3Code: iso3Code,
    geoShape: geoShape,
    geoPoint2D: geoPoint2D,
  );

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      worldRank: json['world_rank'],
      universityName: json['university_name'],
      nationalRank: json['national_rank'],
      totalScore: json['total_score']?.toDouble(),
      alumni: json['alumni'].toDouble(),
      award: json['award'].toDouble(),
      hici: json['hici'].toDouble(),
      ns: json['ns'].toDouble(),
      pub: json['pub'].toDouble(),
      pcp: json['pcp'].toDouble(),
      year: json['year'],
      worldRankInt: json['world_rank_int'],
      country: json['country'],
      iso2Code: json['iso2_code'],
      iso3Code: json['iso3_code'],
      geoShape: GeoShapeModel.fromJson(json['geo_shape']),
      geoPoint2D: GeoPoint2DModel.fromJson(json['geo_point_2d']),
    );
  }


  factory UniversityModel.fromEntity(UniversityEntity entity) {
    return UniversityModel(
      worldRank: entity.worldRank,
      universityName: entity.universityName,
      nationalRank: entity.nationalRank,
      totalScore: entity.totalScore,
      alumni: entity.alumni,
      award: entity.award,
      hici: entity.hici,
      ns: entity.ns,
      pub: entity.pub,
      pcp: entity.pcp,
      year: entity.year,
      worldRankInt: entity.worldRankInt,
      country: entity.country,
      iso2Code: entity.iso2Code,
      iso3Code: entity.iso3Code,
      geoShape: GeoShapeModel(
        type: entity.geoShape?.type,
        geometry: GeometryModel(
          coordinates: entity.geoShape?.geometry?.coordinates,
          type: entity.geoShape?.geometry?.type,
        ),
        properties: entity.geoShape?.properties,
      ),
      geoPoint2D: GeoPoint2DModel(
        lon: entity.geoPoint2D?.lon,
        lat: entity.geoPoint2D?.lat,
      ),
    );
  }

}
