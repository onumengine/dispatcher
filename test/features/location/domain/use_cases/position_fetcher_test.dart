import 'package:dispatcher/features/location/domain/repositories/position_repository.dart';
import 'package:dispatcher/features/location/domain/use_cases/position_fetcher.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPositionRepository extends Mock implements PositionRepository {}

void main() {
  MockPositionRepository mockRepository;
  PositionFetcher useCase;

  setUp(() {
    mockRepository = MockPositionRepository();
    useCase = PositionFetcher(repository: mockRepository);
  });

  test('Should fetch the local position data', () async {});
}
