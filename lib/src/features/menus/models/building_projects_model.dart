import 'package:cloud_firestore/cloud_firestore.dart';

class BuildingProjectModel {
  final String? id;
  final String name;
  final String projectLogoURL;
  List<String> images;
  final String city;
  final double price;
  final int area;
  final String buildingCompany;
  final String tourURL;
  final int towers;
  final int availableUnits;
  final String address;

  BuildingProjectModel({
    this.id,
    required this.name,
    required this.city,
    required this.area,
    required this.price,
    required this.projectLogoURL,
    required this.images,
    this.buildingCompany = "",
    this.tourURL = "",
    this.towers = 0,
    this.availableUnits = 0,
    required this.address,
  });

  toJson() {
    return {
      "id": id,
      "name": name,
      "city": city,
      "area": area,
      "price": price,
      "buildingCompany": buildingCompany,
      "images": images,
      "tourURL": tourURL,
      "projectLogoURL": projectLogoURL,
      "towers": towers,
      "availableUnits": availableUnits,
      "address": address
    };
  }

  factory BuildingProjectModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final project = document.data()!;
    return BuildingProjectModel(
      id: document.id,
      name: project['name'],
      city: project['city'],
      area: int.parse(project['area']),
      price: double.parse(project['price']),
      buildingCompany: project['buildingCompany'],
      images: List<String>.from(project['images']),
      tourURL: project['tourURL'],
      projectLogoURL: project['projectLogoURL'],
      towers: project['towers'] ?? 0,
      availableUnits: project['availableUnits'] ?? 0,
      address: project['address'] ?? "",
    );
  }
}
