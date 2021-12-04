import 'package:equatable/equatable.dart';

class LocationServiceEntity extends Equatable {
  final bool isEnabled;

  LocationServiceEntity({required this.isEnabled});

  @override
  List<Object?> get props => [isEnabled];
}
