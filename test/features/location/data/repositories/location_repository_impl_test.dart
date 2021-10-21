import 'package:dispatcher/core/network/network_info.dart';
import 'package:dispatcher/features/location/data/data_sources/location_remote_data_source.dart';
import 'package:dispatcher/features/location/data/models/location_model.dart';
import 'package:dispatcher/features/location/data/repositories/location_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLocationRemoteDataSource extends Mock
    implements LocationRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockLocationRemoteDataSource dataSource;
  late MockNetworkInfo networkInfo;
  late LocationRepositoryImplementation locationRepositoryImplementation;
  late Future<LocationModel> tLocation;

  setUp(() {
    dataSource = MockLocationRemoteDataSource();
    networkInfo = MockNetworkInfo();
    locationRepositoryImplementation = LocationRepositoryImplementation(
      locationDataSource: dataSource,
      networkInfo: networkInfo,
    );
    tLocation = Future.value(LocationModel(latitude: 0.0, longitude: 0.0));
  });

  test('Location Repo Implementation', () {
    when(dataSource.getLocation()).thenAnswer((_) async => tLocation);

    expect(locationRepositoryImplementation.getLocation(), tLocation);
  });
}
