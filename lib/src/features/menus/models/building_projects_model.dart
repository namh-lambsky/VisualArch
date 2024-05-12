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

  final String contactURL;

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
    this.contactURL = "",
    required this.address,
  });

  toJson() {
    return {
      "id": id,
      "projectName": name,
      "city": city,
      "area": area,
      "price": price,
      "companyName": buildingCompany,
      "projectImagesRoute": images,
      "tourURL": tourURL,
      "logoRoute": projectLogoURL,
      "towers": towers,
      "availableUnits": availableUnits,
      "address": address,
      "contactURL": contactURL
    };
  }

  factory BuildingProjectModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final project = document.data()!;
    return BuildingProjectModel(
      id: document.id,
      name: project['projectName'],
      city: project['city'],
      area: int.parse(project['area'].toString()),
      price: double.parse(project['price'].toString()),
      buildingCompany: project['companyName'],
      images: List<String>.from(project['projectImagesRoute']),
      tourURL: project['tourURL'] ?? "",
      projectLogoURL: project['logoRoute'],
      towers: project['towers'] ?? 0,
      availableUnits: project['availableUnits'] ?? 0,
      address: project['address'] ?? "",
      contactURL: project['contactURL'] ?? "",
    );
  }
}
