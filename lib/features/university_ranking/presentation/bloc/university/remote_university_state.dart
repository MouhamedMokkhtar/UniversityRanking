part of 'remote_university_bloc.dart';

@immutable
abstract class RemoteUniversityState extends Equatable {
  const RemoteUniversityState();

  @override
  List<Object?> get props => [];
}

class RemoteUniversityLoading extends RemoteUniversityState {
  const RemoteUniversityLoading();
}

class RemoteUniversityDone extends RemoteUniversityState {
  final List<UniversityEntity> universities;
  final List<UniversityEntity>? universitiesSearchedList;
  final bool hasReachedMax;
  final int page ;

  const RemoteUniversityDone({
    required this.universities,
  this.universitiesSearchedList,
    required this.hasReachedMax,
    required this.page,
  });

  @override
  List<Object?> get props => [universities, hasReachedMax];

  RemoteUniversityDone copyWith({
    List<UniversityEntity>? universities,
    bool? hasReachedMax,
    int? page,
  }) {
    return RemoteUniversityDone(
      universities: universities ?? this.universities,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }
}

class RemoteUniversityError extends RemoteUniversityState {
  final DioException error;

  const RemoteUniversityError(this.error);

  @override
  List<Object?> get props => [error];
}
