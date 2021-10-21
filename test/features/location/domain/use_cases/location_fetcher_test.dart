import 'package:dartz/dartz.dart';
import 'package:dispatcher/features/location/domain/entities/location_entity.dart';
import 'package:dispatcher/features/location/domain/repositories/location_repository.dart';
import 'package:dispatcher/features/location/domain/use_cases/location_fetcher.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPositionRepository extends Mock implements LocationRepository {}

void main() {
  late MockPositionRepository mockRepository;
  late LocationFetcher useCase;
  LocationEntity tPosition = LocationEntity(latitude: 1, longitude: 1);

  setUp(() {
    mockRepository = MockPositionRepository();
    useCase = LocationFetcher(repository: mockRepository);
  });

  test('Should fetch position data', () async {
    // arrange
    when(mockRepository.getLocation())
        .thenAnswer((_) async => Right(tPosition));

    final position = await useCase();

    // assert
    expect(position, Right(tPosition));
  });
}
