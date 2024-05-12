import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/menus/controllers/company_controller.dart';
import 'package:visualarch_v1/src/features/menus/controllers/profile_controller.dart';
import 'package:visualarch_v1/src/features/menus/models/building_company_model.dart';

import '../../authentication/models/user_model.dart';

class MainMenuController extends GetxController {
  MainMenuController get instance => Get.find();

  final companyController = Get.put(CompanyController());
  final profileController = Get.put(ProfileController());

  @override
  void onInit() {
    super.onInit();
    getProfilePhoto();
    updateName();
  }

  var userName = "".obs;

  loadResources() async {
    await getAllCompanies();
    await updateName();
    await getProfilePhoto();
  }

  updateName() async {
    UserModel user = await profileController.getUserData();
    final name = user.name.split(" ");
    userName.value = name[0];
  }

  getProfilePhoto() {
    profileController.getUserPhoto();
  }

  Future<List<BuildingCompanyModel>> getAllCompanies() async {
    var companies=await companyController.getAllCompanies();
    return companies;
  }
}
