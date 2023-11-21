import 'package:get/get.dart';
import 'package:visualarch_v1/src/repository/company_repository/comapany_repository.dart';

import '../models/building_company_model.dart';

class CompanyController extends GetxController{
  static CompanyController get instance=>Get.find();

  final _companyRepo=Get.put(CompanyRepository());

  Future<List<BuildingCompanyModel>> getAllCompanies() async{
    return await _companyRepo.getAllCompanies();
  }



}