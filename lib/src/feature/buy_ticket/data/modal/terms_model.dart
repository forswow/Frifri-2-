class TermsModel {
  TermsModel({required this.url});

  final int url;

  factory TermsModel.fromJson(Map<String, dynamic> json) {
    final int url = json['url'] as int;
    return TermsModel(
      url: url,
    );
  }
  @override
  String toString() {
    return 'TermsModel{url: $url}';
  }


}
