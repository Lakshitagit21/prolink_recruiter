import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prolink_recruiter/pages/view_jobs_page.dart';

import '../pages/add_job_page.dart';
import '../pages/applications_page.dart';
import '../pages/company_page.dart';


class DashboardModel {
  final String title;
  final IconData iconData;
  final String routeName;

  const DashboardModel({
    required this.title,
    required this.iconData,
    required this.routeName,
  });
}

const List<DashboardModel> dashboardModelList = [
  DashboardModel(
      title: 'Add Job',
      iconData: Icons.add,
      routeName: AddJobPage.routeName
  ),
  DashboardModel(
      title: 'View Jobs',
      iconData: Icons.work,
      routeName: ViewJobsPage.routeName),
  DashboardModel(
      title: 'Companies',
      iconData: Icons.apartment,
      routeName: CompanyPage.routeName),
  DashboardModel(
    title: 'Applications',
    iconData: Icons.assignment_outlined,
    routeName: ApplicationsPage.routeName,
  ),
];
