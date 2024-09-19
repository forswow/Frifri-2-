import 'package:flutter/material.dart';

/// {@template more_item_entity}
/// MoreItemEntity.
/// {@endtemplate}
base class MoreItemEntity extends SettingsEntity {
  /// {@macro more_item_entity}
  MoreItemEntity({
    required super.name,
    required super.assetPath,
    required super.onPressed,
  });
}

abstract class SettingsEntity {
  final String name;
  final String assetPath;
  final VoidCallback onPressed;

  SettingsEntity({
    required this.name,
    required this.assetPath,
    required this.onPressed,
  });
}
