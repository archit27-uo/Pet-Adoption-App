class PetModel {
  final String? name;
  final String? age;
  final String? image;
  final String? gender;

  PetModel({
    required this.name,
    required this.age,
    required this.image,
    required this.gender,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      name: json['name'],
      age: json['age'],
      image: _getImage(json['photos'] ?? []),
      gender: json['gender'],
    );
  }

  static String? _getImage(List imageList) {
    if (imageList.isEmpty) return null;
    return imageList.first['large'];
  }
}
