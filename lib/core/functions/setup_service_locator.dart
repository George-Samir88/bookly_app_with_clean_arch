import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_sources/home_local_data_source/home_local_data_source.dart';
import '../../features/home/data/data_sources/home_remote_data_source/home_remote_data_source.dart';
import '../utils/api_service.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  locator.registerSingleton<HomeRepoImp>(HomeRepoImp(
    homeLocalDataSource: HomeLocalDataSourceImp(),
    homeRemoteDataSource: HomeRemoteDataSourceImp(
      locator.get<ApiService>(),
    ),
  ));
}
