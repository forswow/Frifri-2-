/// {@template service_entity}
/// ServiceEntity.
/// {@endtemplate}
base class ServiceEntity {
  /// {@macro service_entity}
  ServiceEntity(
      {required this.name, required this.assetPath, required this.link});

  final String name;
  final String assetPath;
  final String link;
}
