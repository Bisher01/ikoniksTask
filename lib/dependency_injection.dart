import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'core/data_sources/http_client.dart';
import 'features/devices/data/data_sources/device_data_source.dart';
import 'features/devices/data/repositories/device_repository_impl.dart';
import 'features/devices/domain/repositories/device_repository.dart';
import 'features/devices/domain/usecases/fetch_devices.dart';
import 'features/devices/presentation/blocs/device_bloc.dart';
import 'features/splash/presentation/blocs/splash_bloc.dart';

final di = GetIt.instance;

Future<void> inject() async {
  di.registerLazySingleton(() => Client());
  di.registerLazySingleton(
      () => HttpService(client: di(), unauthorizedRoutes: []));
  //==========Devices==========  //
  di.registerLazySingleton<DeviceDataSource>(
      () => DeviceDataSourceImpl(client: di()));
  di.registerLazySingleton<DeviceRepository>(
      () => DeviceRepositoryImpl(deviceDataSource: di()));
  di.registerLazySingleton<FetchDevices>(
      () => FetchDevices(deviceRepository: di()));
  di.registerFactory<DeviceBloc>(() => DeviceBloc(fetchDevicesUseCase: di()));
  //==========Splash==========//
  di.registerFactory<SplashBloc>(() => SplashBloc());
}
