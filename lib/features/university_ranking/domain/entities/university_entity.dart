import 'package:equatable/equatable.dart';

import 'geoPoint2D_entity.dart';
import 'geoShape_entity.dart';

class UniversityEntity  extends Equatable{
  final String ? worldRank;
  final String ? universityName;
  final String ? nationalRank;
  final double ? totalScore;
  final double ? alumni;
  final double ? award;
  final double ? hici;
  final double ? ns;
  final double ? pub;
  final double ? pcp;
  final String ? year;
  final int ? worldRankInt;
  final String ? country;
  final String ? iso2Code;
  final String ? iso3Code;
  final GeoShape ? geoShape;
  final GeoPoint2D ? geoPoint2D;


  const UniversityEntity({
    this.worldRank,
    this.universityName,
    this.nationalRank,
    this.totalScore,
    this.alumni,
    this.award,
    this.hici,
    this.ns,
    this.pub,
    this.pcp,
    this.year,
    this.worldRankInt,
    this.country,
    this.iso2Code,
    this.iso3Code,
    this.geoShape,
    this.geoPoint2D,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    worldRank,
    universityName,
    nationalRank,
    totalScore,
    alumni,
    award,
    hici,
    ns,
    pub,
    pcp,
    year,
    worldRankInt,
    country,
    iso2Code,
    iso3Code,
    geoShape,
    geoPoint2D,
  ];
}


