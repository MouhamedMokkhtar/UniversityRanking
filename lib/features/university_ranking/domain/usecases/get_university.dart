import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/university_entity.dart';
import '../repository/university_repository.dart';

class GetUniversityUseCase implements UseCase<DataState<List<UniversityEntity>>,int> {
  final UniversityRepository _universityRepository;

  GetUniversityUseCase(this._universityRepository);

  @override
  Future<DataState<List<UniversityEntity>>> call({int? params})  {
    return  _universityRepository.getUniversity(params!);
  }
}