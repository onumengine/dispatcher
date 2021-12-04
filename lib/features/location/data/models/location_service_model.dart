import 'package:dispatcher/features/location/domain/entities/location_service_entity.dart';

class LocationServiceModel extends LocationServiceEntity {
  final bool isEnabled;

  LocationServiceModel({required this.isEnabled}) : super(isEnabled: isEnabled);
}
