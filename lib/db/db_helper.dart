import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/company.dart';
import '../models/job.dart';
import '../models/recruiter.dart';


class DbHelper {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String collectionRecruiter = 'Recruiters';
  static const String collectionJob = 'Jobs';
  static const String collectionCompany = 'Companies';
  static const String collectionJobSeeker = 'JobSeekers';
  static const String collectionApplication = 'Applications';


  static Future<bool> isRecruiter(String uid) async {
    final snapshot = await _db.collection(collectionRecruiter).doc(uid).get();
    return snapshot.exists;
  }

  static Future<void> addRecruiter(Recruiter recruiter) async {
    await _db.collection(collectionRecruiter)
        .doc(recruiter.recruiterId)
        .set(recruiter.toJson());
  }

  static Future<void> addCompany(Company company) {
    final doc = _db.collection(collectionCompany).doc();
    company.id = doc.id;
    return doc.set(company.toJson());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllCompanies() =>
      _db.collection(collectionCompany).snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllJobs() =>
      _db.collection(collectionJob).snapshots();

  static Future<void> addJob(Job job) {
    final doc = _db.collection(collectionJob).doc();
    job.jobId = doc.id;
    return doc.set(job.toJson());
  }
  static Future<void> updateJobField(String id, Map<String, dynamic> map) {
    return _db.collection(collectionJob).doc(id)
        .update(map);
  }
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllApplications() =>
      _db.collection(collectionApplication)
          .orderBy('applicationDate', descending: true,)
          .snapshots();

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getJobSeekerInfo(String uid) =>
      _db.collection(collectionJobSeeker).doc(uid).snapshots();

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getRecruiterInfo(String uid) =>
      _db.collection(collectionRecruiter).doc(uid).snapshots();

  static Future<bool> doesRecruiterExist(String uid) async {
    final snapshot = await _db.collection(collectionRecruiter).doc(uid).get();
    return snapshot.exists;
  }
  static Future<void> updateRecruiterProfile(String uid, Map<String, String> map) {
    return _db.collection(collectionRecruiter)
        .doc(uid)
        .update(map);
  }
  static Stream<QuerySnapshot<Map<String, dynamic>>> getApplicationsByJobId(String jobId) =>
      _db
          .collection(collectionApplication)
          .where('jobId', isEqualTo: jobId)
          .orderBy('applicationDate', descending: true)
          .snapshots();


  static Future<void> updateApplicationField(String id, Map<String, dynamic> map) {
    return _db.collection(collectionApplication).doc(id).update(map);
  }

}

