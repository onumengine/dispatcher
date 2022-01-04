import 'package:dartz/dartz.dart';
import 'package:dispatcher/core/error/failure.dart';
import 'package:dispatcher/core/network/network_info.dart';
import 'package:dispatcher/core/platform/location_permission_info.dart';
import 'package:dispatcher/core/platform/location_service_info.dart';
import 'package:dispatcher/features/location/data/data_sources/location_sensor_data_source.dart';
import 'package:dispatcher/features/location/domain/entities/location_entity.dart';
import 'package:dispatcher/features/location/domain/repositories/location_repository.dart';

class DeviceLocationRepository implements LocationRepository {
  final LocationSensorDataSource locationDataSource;
  final LocationPermissionInfo locationPermissionInfo;
  final LocationServiceInfo locationServiceInfo;
  final NetworkInfo networkInfo;

  DeviceLocationRepository({
    required this.locationDataSource,
    required this.locationPermissionInfo,
    required this.locationServiceInfo,
    required this.networkInfo,
  });

  // @override
  // Future<Either<Failure, LocationEntity>> getLocation() async {
  //   if (await networkInfo.deviceIsConnected) {
  //     if (await locationPermissionInfo.locationPermissionIsGranted) {
  //       if (await locationServiceInfo.locationServiceIsEnabled) {
  //         try {
  //           LocationEntity location =
  //               await this.locationDataSource.getLocation();
  //           return Right(location);
  //         } catch (e) {
  //           return Left(LocationFetchingFailure());
  //         }
  //       } else {
  //         return Left(LocationServiceDisabledFailure());
  //       }
  //     } else {
  //       return Left(LocationPermissionFailure());
  //     }
  //   } else {
  //     return Left(NetworkConnectionFailure());
  //   }
  // }

  @override
  Future<Either<Failure, LocationEntity>> getLocation() async {
    if (!await networkInfo.deviceIsConnected) {
      return left(NetworkConnectionFailure());
    }
    if (!await locationPermissionInfo.locationPermissionIsGranted) {
      await locationPermissionInfo.getLocationPermission();
      if (!await locationServiceInfo.locationServiceIsEnabled) {
        return Left(LocationPermissionFailure());
      }
    }
    if (!await locationServiceInfo.locationServiceIsEnabled) {
      return Left(LocationServiceDisabledFailure());
    }
    try {
      LocationEntity location = await this.locationDataSource.getLocation();
      return Right(location);
    } catch (e) {
      return Left(LocationFetchingFailure());
    }
  }
}
