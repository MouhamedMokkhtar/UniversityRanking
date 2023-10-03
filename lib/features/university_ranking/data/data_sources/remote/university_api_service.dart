import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../../../core/constants/constants.dart';
import '../../models/university_model.dart';

part 'university_api_service.g.dart';

@RestApi(baseUrl: universityAPIBaseURL)
abstract class UniversityApiService {
  factory UniversityApiService(Dio dio, {String baseUrl}) =
      _UniversityApiService;

  @GET('/records')
  Future<HttpResponse<List<UniversityModel>>> getUniversity({
    @Query("limit") int? limit,
    @Query("offset") int? offset,
  });
}
