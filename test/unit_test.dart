import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prolink_recruiter/models/dashboard_model.dart';

void main() {
  group('DashboardModel', () {
    test('should create an object with correct values', () {
      const model = DashboardModel(
        title: 'Jobs',
        iconData: Icons.work,
        routeName: '/jobs',
      );

      expect(model.title, 'Jobs');
      expect(model.iconData, Icons.work);
      expect(model.routeName, '/jobs');
    });

    test('should be equal if all values are the same', () {
      const model1 = DashboardModel(
        title: 'Jobs',
        iconData: Icons.work,
        routeName: '/jobs',
      );

      const model2 = DashboardModel(
        title: 'Jobs',
        iconData: Icons.work,
        routeName: '/jobs',
      );

      expect(model1, model2);
    });
  });
}
