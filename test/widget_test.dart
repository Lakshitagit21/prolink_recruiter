// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prolink_recruiter/customwidgets/dashboard_item_view.dart';
import 'package:prolink_recruiter/models/dashboard_model.dart';


void main() {
  testWidgets('DashboardItemView shows title and responds to tap', (WidgetTester tester) async {
    const model = DashboardModel(
      title: 'Add Job',
      iconData: Icons.add,
      routeName: 'addjob',
    );

    String? tappedRoute;


    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: DashboardItemView(
          model: model,
          onPress: (route) {
            tappedRoute = route;
          },
        ),
      ),
    ));

    // Check if title is shown
    expect(find.text('Add Job'), findsOneWidget);

    // Check if icon is shown
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Tap the card
    await tester.tap(find.byType(DashboardItemView));
    await tester.pump();

    // Check if callback was triggered with correct route
    expect(tappedRoute, 'addjob');
  });
}
