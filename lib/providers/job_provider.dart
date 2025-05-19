import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:prolink_recruiter/models/company.dart';
import 'package:prolink_recruiter/models/job.dart';

import '../auth/auth_service.dart';
import '../db/db_helper.dart';
import '../models/image_model.dart';
import '../utils/constants.dart';


class JobProvider with ChangeNotifier {
  List<Company> companyList = [];
  List<Job> jobList = [];

  Future<void> addCompany(String name, ImageModel logo ) {
    final company = Company(name: name, logo: logo);
    return DbHelper.addCompany(company);
  }

  getAllCompanies() {
    DbHelper.getAllCompanies().listen((snapshot) {
      companyList = List.generate(snapshot.docs.length,
              (index) => Company.fromJson(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

  getAllJobs() async {
    final recruiter = AuthService.currentUser;
    if (recruiter == null) return;

    DbHelper.getAllJobs().listen((snapshot) {
      jobList = snapshot.docs
          .map((doc) => Job.fromJson(doc.data()))
          .where((job) => job.recruiterId == recruiter.uid)
          .toList();

      notifyListeners();
    });
  }

  Job findJobById(String id) =>
      jobList.firstWhere((element) => element.jobId == id);

  Future<ImageModel> uploadCompanyImage(String imageLocalPath) async {
    final String imageName = 'image_${DateTime.now().millisecondsSinceEpoch}';

    final photoRef = FirebaseStorage.instance
        .ref()
        .child('$CompanyImageDirectory$imageName');

    final uploadTask = photoRef.putFile(File(imageLocalPath));
    final snapshot = await uploadTask.whenComplete(() => null);
    final url = await snapshot.ref.getDownloadURL();
    return ImageModel(
      imageName: imageName,
      directoryName: CompanyImageDirectory,
      downloadUrl: url,
    );
  }

  Future<void> addJob(Job job) {
    return DbHelper.addJob(job);
  }

  Future<void> updateJobField(String id, String field, dynamic value) {
    return DbHelper.updateJobField(id, {field: value});
  }

  Future<void> deleteImage(String id, ImageModel image) async {
    final photoRef = FirebaseStorage.instance
        .ref()
        .child('${image.directoryName}${image.imageName}');
    return photoRef.delete();
  }
}
