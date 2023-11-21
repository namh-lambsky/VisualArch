import 'package:cloud_firestore/cloud_firestore.dart';

class BuildingCompanyModel {
  final String? id;
  final String name;
  String companyPhotoURL;
  List<String>? buildingProjects;

  BuildingCompanyModel({
    this.id,
    required this.name,
    this.companyPhotoURL = "",
    this.buildingProjects,
  });

  toJson() {
    return {
      "id": id,
      "name": name,
      "companyPhotoURL": companyPhotoURL,
      "buildingProjects": buildingProjects,
    };
  }

  factory BuildingCompanyModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final company = document.data()!;
    return BuildingCompanyModel(
      id: document.id,
      name: company['name'],
      companyPhotoURL: company['companyPhotoURL'],
      buildingProjects: company['buildingProjects'],
    );
  }

}
