import 'package:university_ranking/features/university_ranking/domain/entities/university_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class UniversityRepository {

  // API methods
  Future<DataState<List<UniversityEntity>>> getUniversity(int offset);


}