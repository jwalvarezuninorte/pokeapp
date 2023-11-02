class Artwork {
  final String? frontDefault;
  final dynamic frontFemale;

  Artwork({
    this.frontDefault,
    this.frontFemale,
  });

  factory Artwork.fromJson(Map<String, dynamic> json) => Artwork(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}
