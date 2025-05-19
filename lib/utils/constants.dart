import 'dart:ui';

import 'package:flutter/material.dart';

abstract final class JobUtils {
  static const String fullTime = 'Full-time';
  static const String partTime = 'Part-time';
  static const String internship = 'Internship';
  static const String contract = 'Contract';
  static const String freelance = 'Freelance';
  static const String temporary = 'Temporary';

  static const String entryLevel = 'Entry';
  static const String midLevel = 'Mid';
  static const String seniorLevel = 'Senior';
  static const String leadLevel = 'Lead';

  static const String locationRemote = 'Remote';
  static const String locationOnSite = 'On-site';
  static const String locationHybrid = 'Hybrid';

  static const jobTypeList = [
    fullTime,
    partTime,
    internship,
    contract,
    freelance,
    temporary,
  ];

  static const experienceLevelList = [
    entryLevel,
    midLevel,
    seniorLevel,
    leadLevel,
  ];

  static const locationTypeList = [
    locationRemote,
    locationOnSite,
    locationHybrid,
  ];
}


const String CompanyImageDirectory = 'Companies/';
const String currencySymbol = '\$';

Color getStatusColor(String status) {
  switch (status) {
    case 'Pending':
      return Colors.orange; // Pending color
    case 'Accepted':
      return Colors.green; // Accepted color
    case 'Rejected':
      return Colors.red; // Rejected color
    default:
      return Colors.black;
  }
}

abstract class ApplicationStatus {
  static const String pending = 'Pending';
  static const String accepted = 'Accepted';
  static const String rejected = 'Rejected';
}