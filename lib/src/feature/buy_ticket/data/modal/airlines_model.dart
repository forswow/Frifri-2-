class AirlinesModel {
  final String name;

  AirlinesModel({required this.name});

  factory AirlinesModel.fromJson(Map<String, dynamic> json) {
    final String name = json['name'] as String;
    return AirlinesModel(
      name: name,
    );
  }

  @override
  String toString() {
    return 'AirlinesModel{name: $name}';
  }
}
