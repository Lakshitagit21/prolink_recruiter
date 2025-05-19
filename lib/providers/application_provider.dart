import 'package:flutter/cupertino.dart';

import '../db/db_helper.dart';
import '../models/SeekerWithApplication.dart';
import '../models/job_application.dart';
import '../models/job_seeker.dart';

class ApplicationProvider extends ChangeNotifier {
  List<JobApplication> applicationsList = [];
  List<JobApplication> applicationsListForJob = [];
  JobSeeker? jobSeeker;
  List<SeekerWithApplication> seekerWithApplications = [];


  getAllApplications() {
    DbHelper.getAllApplications().listen((event) {
      applicationsList = List.generate(event.docs.length,
              (index) => JobApplication.fromJson(event.docs[index].data()));
      notifyListeners();
    });
  }

  JobApplication getApplicationById(String id) =>
      applicationsList.firstWhere((element) => element.applicationId == id);

  getApplicationsByJobId(String jobId) {
    applicationsListForJob.clear();
    DbHelper.getApplicationsByJobId(jobId).listen((event) async {
      applicationsListForJob = List.generate(
        event.docs.length,
            (index) => JobApplication.fromJson(event.docs[index].data()),
      );

      seekerWithApplications.clear();

      for (var app in applicationsListForJob) {
        final snapshot = await DbHelper.getJobSeekerInfo(app.jobSeekerId).first;
        if (snapshot.exists) {
          final seeker = JobSeeker.fromJson(snapshot.data()!);
          seekerWithApplications.add(
            SeekerWithApplication(seeker: seeker, application: app),
          );
        }
      }

      notifyListeners();
    });
  }




  getJobSeekerInfo(String id) {
    DbHelper.getJobSeekerInfo(id).listen((event) {
      if(event.exists) {
        jobSeeker = JobSeeker.fromJson(event.data()!);
        notifyListeners();
      }
    });
  }
  Future<void> updateApplicationField(String id, String field, dynamic value) {
    return DbHelper.updateApplicationField(id, {field: value});
  }

}
