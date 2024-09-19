import 'package:frifri/src/feature/more/domain/entities/more_item_entity.dart';

/// {@template service_entity}
/// ServiceEntity.
/// {@endtemplate}
base class ServiceEntity extends SettingsEntity {
  /// {@macro service_entity}
  ServiceEntity({
    required super.name,
    required super.assetPath,
    required super.onPressed,
  });
}
