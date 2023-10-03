import 'package:equatable/equatable.dart';

class Geometry extends Equatable {
  const Geometry({
    this.coordinates,
    this.type,
  });

  final  List<List<List<double>>> ? coordinates;
  final String ? type;

  @override
  // TODO: implement props
  List<Object?> get props => [
    coordinates,
    type,
  ];

}