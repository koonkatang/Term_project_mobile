class Detail {
  final String? name;
  final String? type;
  final String? banner;

  Detail({required this.name, required this.type, required this.banner});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      name: json['name'],
      type: json['type'],
      banner: json['banner'],
    );
  }
}
