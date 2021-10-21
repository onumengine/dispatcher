import 'dart:convert';

import 'package:dispatcher/features/location/data/models/location_model.dart';
import 'package:dispatcher/features/location/domain/entities/location_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/location_reader.dart';

void main() {
  LocationModel tLocationModel = LocationModel(latitude: 0.0, longitude: 0.0);
  final String rawJsonString = readLocation('location.json');

  test('is a subclass of the Location entity', () {
    expect(tLocationModel, isA<LocationEntity>());
  });

  group('JSON INITIALIZERS:', () {
    test('fromJsonString returns a valid model', () {
      final tLocationFromString = LocationModel.fromJsonString(rawJsonString);
      expect(tLocationFromString, tLocationModel);
    });

    test('fromJsonMap returns a valid model', () {
      final Map<String, dynamic> jsonMap = jsonDecode(rawJsonString);
      final tLocationFromMap = LocationModel.fromJsonMap(jsonMap);

      expect(tLocationFromMap, tLocationModel);
    });
  });

  group('JSON ENCODERS', () {
    test('toJsonString returns a valid json string', () {
      expect(tLocationModel.toJsonString(), rawJsonString);
    });

    test('toJsonMap returns a valid map', () {
      expect(tLocationModel.toJsonMap(), jsonDecode(rawJsonString));
    });
  });
}
