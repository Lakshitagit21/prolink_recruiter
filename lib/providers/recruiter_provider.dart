import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:prolink_recruiter/models/recruiter.dart';

import '../auth/auth_service.dart';
import '../db/db_helper.dart';


class RecruiterProvider extends ChangeNotifier {
  Recruiter? recruiter;
  Future<void> addRecruiter({required User user, String? name, String? phone, String? company}) {
    final recruiter = Recruiter(
      recruiterId: user.uid,
      email: user.email!,
      companyName: company,
      userName: name,
      contactNumber: phone,
      registrationDate: Timestamp.fromDate(user.metadata.creationTime!,
      ),
    );
    return DbHelper.addRecruiter(recruiter);
  }

  getRecruiterInfo() {
    DbHelper.getRecruiterInfo(AuthService.currentUser!.uid).listen((event) {
      if(event.exists) {
        recruiter = Recruiter.fromJson(event.data()!);
        notifyListeners();
      }
    });
  }

  Future<bool> doesRecruiterExist(String uid) => DbHelper.doesRecruiterExist(uid);

  Future<void> updateRecruiterProfile({required String field, required String value}) {
    return DbHelper.updateRecruiterProfile(AuthService.currentUser!.uid, {field : value});
  }
}