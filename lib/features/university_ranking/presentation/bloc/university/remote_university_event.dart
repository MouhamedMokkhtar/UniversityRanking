part of 'remote_university_bloc.dart';

@immutable
abstract class RemoteUniversityEvent {
  const RemoteUniversityEvent();
}

class GetUniversitiesFetch extends RemoteUniversityEvent {
  const GetUniversitiesFetch();
}


class GetUniversitiesFetchRefresh extends RemoteUniversityEvent {
  const GetUniversitiesFetchRefresh();
}

class UniversitySearchEvent extends RemoteUniversityEvent {
  final String query;

  const UniversitySearchEvent(this.query);

}
