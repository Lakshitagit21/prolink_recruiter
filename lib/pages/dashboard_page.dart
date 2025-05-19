import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prolink_recruiter/providers/application_provider.dart';
import 'package:prolink_recruiter/providers/recruiter_provider.dart';
import 'package:provider/provider.dart';
import '../customwidgets/dashboard_item_view.dart';
import '../customwidgets/main_drawer.dart';
import '../models/dashboard_model.dart';
import '../providers/job_provider.dart';


class DashboardPage extends StatefulWidget {
  static const String routeName = '/';
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void didChangeDependencies() {
    Provider.of<JobProvider>(context, listen: false).getAllCompanies();
    Provider.of<RecruiterProvider>(context, listen: false).getRecruiterInfo();
    Provider.of<JobProvider>(context, listen: false).getAllJobs();
    Provider.of<ApplicationProvider>(context, listen: false).getAllApplications();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: Text('D A S H B O A R D'),
        backgroundColor:Theme.of(context).colorScheme.surface,
        elevation: 0,
        iconTheme:  IconThemeData(color: Theme.of(context).colorScheme.inversePrimary, size: 35.0),
      ),
      body: GridView.builder(
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dashboardModelList.length,
        itemBuilder: (context, index) {
          final model = dashboardModelList[index];
          return DashboardItemView(
            model: model,
            onPress: (route) {
              context.goNamed(route);
            },
          );
        },
      ),
    );
  }
}
