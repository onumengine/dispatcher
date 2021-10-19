import 'package:dispatcher/features/location/data/models/location_model.dart';
import 'package:dispatcher/features/location/domain/entities/location.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/location_reader.dart';

void main() {
  LocationModel tLocationModel = LocationModel(latitude: 0.0, longitude: 0.0);

  test('is a subclass of the Location entity', () {
    expect(tLocationModel, isA<Location>());
  });

  group('fromJson- initiaizers', () {
    test('fromJsonString returns an original object', () {
      final String rawJsonString = readLocation('location.json');
      final tLocationFromString = LocationModel.fromJsonString(rawJsonString);
      expect(tLocationFromString, tLocationModel);
    });
  });
}
