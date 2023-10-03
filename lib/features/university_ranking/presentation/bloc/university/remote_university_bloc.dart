import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/university_entity.dart';
import '../../../domain/usecases/get_university.dart';

part 'remote_university_event.dart';

part 'remote_university_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return events.throttleTime(duration).flatMap(mapper);
  };
}

class RemoteUniversityBloc
    extends Bloc<RemoteUniversityEvent, RemoteUniversityState> {
  final GetUniversityUseCase _getUniversityUseCase;

  RemoteUniversityBloc(this._getUniversityUseCase)
      : super(RemoteUniversityLoading()) {
    on<GetUniversitiesFetch>(
      _onGetUniversities,
      transformer: throttleDroppable(throttleDuration),
    );
    on<GetUniversitiesFetchRefresh>(
      _onGetUniversitiesRefresh,
      transformer: throttleDroppable(throttleDuration),
    );
    on<UniversitySearchEvent>(_onPickingSearchEvent);
  }

  void _onGetUniversities(
      GetUniversitiesFetch event, Emitter<RemoteUniversityState> emit) async {
    if (state is RemoteUniversityLoading) {
      final dataState = await _getUniversityUseCase(params: 0);
      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data!.isNotEmpty) {
        emit(RemoteUniversityDone(
            universities: dataState.data!, hasReachedMax: false, page: 0));
      }

      if (dataState is DataFailed && dataState.error != null) {
        emit(RemoteUniversityError(dataState.error!));
      }
    }
    if (state is RemoteUniversityDone) {
      final remoteUniversityDoneState = state as RemoteUniversityDone;
      final universityList = remoteUniversityDoneState.universities;
      if (remoteUniversityDoneState.hasReachedMax) return;

      final dataState =
          await _getUniversityUseCase(params: universityList.length ~/ 10);
      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        final updatedList = List.of(remoteUniversityDoneState.universities)
          ..addAll(dataState.data!);
        emit(RemoteUniversityDone(
            universities: updatedList,
            hasReachedMax: false,
            page: remoteUniversityDoneState.page + 1));
      }

      if (dataState is DataFailed && dataState.error != null) {
        emit(RemoteUniversityError(dataState.error!));
      }
    }
  }

  void _onGetUniversitiesRefresh(GetUniversitiesFetchRefresh event,
      Emitter<RemoteUniversityState> emit) async {
    emit(RemoteUniversityLoading());
    if (state is RemoteUniversityLoading) {
      final dataState = await _getUniversityUseCase(params: 0);
      if (dataState is DataSuccess &&
          dataState.data != null &&
          dataState.data!.isNotEmpty) {
        emit(RemoteUniversityDone(
            universities: dataState.data!, hasReachedMax: false, page: 0));
      }

      if (dataState is DataFailed && dataState.error != null) {
        emit(RemoteUniversityError(dataState.error!));
      }
    }
  }

  Future<void> _onPickingSearchEvent(
    UniversitySearchEvent event,
    Emitter<RemoteUniversityState> emit,
  ) async {
    final state = this.state;
    if (state is RemoteUniversityDone) {
      try {
        final universityList = state.universities;

        final searchQuery = event.query.toLowerCase();
        final searchedList = universityList.where((university) {
          final country = university.country.toString().toLowerCase();
          final queryLength = searchQuery.length;
          if (queryLength > country.length) {
            return false;
          }
          for (var i = 0; i < queryLength; i++) {
            if (country[i] != searchQuery[i]) {
              return false;
            }
          }
          return true;
        }).toList();

        emit(RemoteUniversityDone(
            universities: searchedList,
            universitiesSearchedList: searchedList,
            hasReachedMax: false,
            page: state.page));
      } catch (e) {
        emit(RemoteUniversityError(
            DioException(requestOptions: RequestOptions(path: ''))));
        print(e.toString());
      }
    }
  }
}
