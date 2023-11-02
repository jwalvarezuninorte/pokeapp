class CommonType {
  final String name;
  final String url;
  bool isSelected = false;

  CommonType({
    required this.name,
    required this.url,
  });

  factory CommonType.fromJson(Map<String, dynamic> json) => CommonType(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
