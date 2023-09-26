import 'package:coin_tracker_app/src/core/network/network_info.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/datasources/coin_list_remote_data_source.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/datasources/coin_list_remote_data_source_impl.dart';
import 'package:coin_tracker_app/src/features/coin_list/data/repositories/coin_list_repository_impl.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/repositories/coin_list_repository.dart';
import 'package:coin_tracker_app/src/features/coin_list/domain/usecases/get_list_of_assets_with_icon.dart';
import 'package:coin_tracker_app/src/features/coin_list/presentation/provider/coin_list_provider.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

void init()  {
  //! Features - CoinList

  //Network
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  sl.registerLazySingleton<http.Client>(() => http.Client());

  //Repository
  sl.registerLazySingleton<GetListOfAssetsWithIcon>(() => GetListOfAssetsWithIcon(sl()));
  //Repository
  sl.registerLazySingleton<CoinListRepository>(() => CoinListRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  //Data Sources
  sl.registerLazySingleton<CoinListRemoteDataSource>(() => CoinListRemoteDataSourceImpl(sl()));

  //Provider
  sl.registerLazySingleton<CoinListProvider>(
    () => CoinListProvider(getListOfAssetsWithIcon: sl()),
  );

  
  //! Core

  

  //! External
}
