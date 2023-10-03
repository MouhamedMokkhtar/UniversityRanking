

import 'dart:io';
import 'package:university_ranking/core/resources/data_state.dart';
import 'package:university_ranking/features/university_ranking/data/models/university_model.dart';
import '../../domain/repository/university_repository.dart';
import '../data_sources/remote/university_api_service.dart';
import 'package:dio/dio.dart';

class UniversityRepositoryImpl implements UniversityRepository {

  final UniversityApiService _universityApiService;

  UniversityRepositoryImpl(this._universityApiService);

  @override
  Future<DataState<List<UniversityModel>>> getUniversity(int offset) async {

    try {
      final httpResponse = await  _universityApiService.getUniversity(
        limit: 20,
        offset: offset,
      );

      if( httpResponse.response.statusCode == HttpStatus.ok ){

        return DataSuccess(httpResponse.data);

      }
      else{
        return DataFailed(
            DioException(
              error : httpResponse.response.statusMessage,
              response: httpResponse.response,
              type : DioExceptionType.badResponse ,
              requestOptions: httpResponse.response.requestOptions,
            )
        );
      }

    } on DioException catch(e){
      return DataFailed(e);
    }





  }

}