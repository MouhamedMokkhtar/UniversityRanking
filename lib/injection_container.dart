import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:university_ranking/features/university_ranking/data/data_sources/remote/university_api_service.dart';
import 'package:university_ranking/features/university_ranking/domain/usecases/get_university.dart';

import 'features/university_ranking/data/repository/university_repository.dart';
import 'features/university_ranking/domain/repository/university_repository.dart';
import 'features/university_ranking/presentation/bloc/university/remote_university_bloc.dart';



final sl = GetIt.instance;

Future<void> initializeDependencies() async {


  //Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<UniversityApiService>(UniversityApiService(sl()));

  // Repositories
  sl.registerSingleton<UniversityRepository>(UniversityRepositoryImpl(sl() ));

  // UseCases
  sl.registerSingleton<GetUniversityUseCase>(GetUniversityUseCase(sl()));


  // Blocs rq : the bloc will return the new instance when the state was changed
  sl.registerFactory<RemoteUniversityBloc>(() => RemoteUniversityBloc(sl()));



}