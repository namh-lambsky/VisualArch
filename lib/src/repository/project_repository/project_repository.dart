import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/menus/models/building_projects_model.dart';

class ProjectRepository extends GetxController{
  static ProjectRepository get instance => Get.put(ProjectRepository());

  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<BuildingProjectModel>getProjectDetails(String name) async {
    final snapshot=await _db.collection("building_projects").where("name",isEqualTo: name).get();
    final projectData=snapshot.docs.map((e) => BuildingProjectModel.fromSnapshot(e)).single;
    return projectData;
  }

  Future<List<BuildingProjectModel>> getAllProjectsByCompanyName(String name) async {
    final snapshot=await _db.collection("building_projects").where("buildingCompany",isEqualTo: name).get();
    final projectsData=snapshot.docs.map((e) => BuildingProjectModel.fromSnapshot(e)).toList();
    return projectsData;
  }


}