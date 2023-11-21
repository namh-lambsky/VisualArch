import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visualarch_v1/src/features/menus/models/building_company_model.dart';

class CompanyRepository extends GetxController{
  static CompanyRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<String> uploadImageToStorage(String childName, XFile file) async {
    Reference ref = _storage.ref().child(childName);

    final Uint8List image = await file.readAsBytes();

    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<BuildingCompanyModel>getCompanyDetails(String name) async {
    final snapshot=await _db.collection("building_companies").where("name",isEqualTo: name).get();
    final companyData=snapshot.docs.map((e) => BuildingCompanyModel.fromSnapshot(e)).single;
    return companyData;
  }

  Future<List<BuildingCompanyModel>> getAllCompanies() async {
    final snapshot=await _db.collection("building_companies").get();
    final companiesData=snapshot.docs.map((e) => BuildingCompanyModel.fromSnapshot(e)).toList();
    return companiesData;
  }


}