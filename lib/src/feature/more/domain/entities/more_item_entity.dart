import 'package:flutter/material.dart';

/// {@template more_item_entity}
/// MoreItemEntity.
/// {@endtemplate}
base class MoreItemEntity {
  /// {@macro more_item_entity}
  MoreItemEntity(
      {required this.onPreseed, required this.name, required this.assetPath});

  final VoidCallback onPreseed;
  final String name;
  final String assetPath;
}
