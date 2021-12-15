import 'package:dispatcher/core/network/network_info.dart';
import 'package:dispatcher/core/platform/location_permission_info.dart';
import 'package:dispatcher/core/platform/location_service_info.dart';
import 'package:dispatcher/features/location/data/data_sources/location_sensor_data_source.dart';
import 'package:dispatcher/features/location/data/repositories/device_location_repository.dart';
import 'package:dispatcher/features/location/domain/repositories/location_repository.dart';
import 'package:dispatcher/features/location/domain/use_cases/FetchLocation.dart';
import 'package:dispatcher/features/location/presentation/view_models/MapViewModel.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

GetIt serviceLocator = GetIt.instance;

void init() {
  initFeatures();
  initCore();
  initExternal();
}

void initFeatures() {
  // VIEW MODELS
  serviceLocator.registerLazySingleton<MapViewModel>(
    () => MapViewModel(
      fetchLocation: serviceLocator(),
    ),
  );

  // USE CASES
  serviceLocator.registerLazySingleton<FetchLocation>(
    () => FetchLocation(
      repository: serviceLocator(),
    ),
  );

  // REPOSITORIES
  serviceLocator.registerLazySingleton<LocationRepository>(
    () => DeviceLocationRepository(
      locationDataSource: serviceLocator(),
      locationPermissionInfo: serviceLocator(),
      locationServiceInfo: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );

  // DATA SOURCES
  serviceLocator.registerLazySingleton<LocationSensorDataSource>(
    () => LocationSensorDataSourceImpl(),
  );
}

void initCore() {
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplementation(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<LocationPermissionInfo>(
    () => LocationPermissionInfoImplementation(),
  );
  serviceLocator.registerLazySingleton<LocationServiceInfo>(
    () => LocationServiceInfoImplementation(),
  );
}

void initExternal() {
  serviceLocator.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );
}
