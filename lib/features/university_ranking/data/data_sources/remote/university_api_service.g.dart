// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _UniversityApiService implements UniversityApiService {
  _UniversityApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??=
        'https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/shanghai-world-university-ranking/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<UniversityModel>>> getUniversity({
    int? limit,
    int? offset,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'limit': limit,
      r'offset': offset,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String,dynamic>>(
        _setStreamType<HttpResponse<List<UniversityModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/records',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    List<UniversityModel> value = (_result.data!['results'] as List<dynamic>)
        .map((dynamic item) => UniversityModel.fromJson(item as Map<String, dynamic>))
        .toList();

    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
