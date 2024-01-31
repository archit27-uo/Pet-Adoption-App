

import 'dart:math';

class PetModel {
  final String? name;
  final String? age;
  final String? image;
  final String? gender;
  final int? price;
  String? adoptionStatus;



  PetModel( {
    required this.price,
    required this.name,
    required this.age,
    required this.image,
    required this.gender,
    required this.adoptionStatus,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    Random random = Random();
    return PetModel(
      price:  600 + random.nextInt(1000),
      name: json['name'],
      age: json['age'],
      image: _getImage(json['photos'] ?? []),
      gender: json['gender'],
      adoptionStatus: 'Adoptable',
    );
  }

  static String? _getImage(List imageList) {
    if (imageList.isEmpty) return null;
    return imageList.first['large'];
  }
}
