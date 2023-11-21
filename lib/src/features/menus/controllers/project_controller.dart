import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/menus/models/building_projects_model.dart';
import 'package:visualarch_v1/src/repository/project_repository/project_repository.dart';

class ProjectController extends GetxController {
  static ProjectController get instance => Get.put(ProjectController());

  final ProjectRepository _projectRepo = Get.put(ProjectRepository());


  loadProject(String name) async {
    await getProjectByName(name);
  }

  Future<List<BuildingProjectModel>> getAllProjectsByCompanyName(
      String name) async {
    return await _projectRepo.getAllProjectsByCompanyName(name);
  }

  Future<BuildingProjectModel> getProjectByName(String name) async {
    return await _projectRepo.getProjectDetails(name);
  }
}
