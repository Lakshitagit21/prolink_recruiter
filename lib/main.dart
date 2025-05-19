import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:prolink_recruiter/models/SeekerWithApplication.dart';
import 'package:prolink_recruiter/pages/add_job_page.dart';
import 'package:prolink_recruiter/pages/applicants_page.dart';
import 'package:prolink_recruiter/pages/applicants_profile_page.dart';
import 'package:prolink_recruiter/pages/applications_page.dart';
import 'package:prolink_recruiter/pages/company_page.dart';
import 'package:prolink_recruiter/pages/dashboard_page.dart';
import 'package:prolink_recruiter/pages/description_page.dart';
import 'package:prolink_recruiter/pages/job_details_page.dart';
import 'package:prolink_recruiter/pages/login_page.dart';
import 'package:prolink_recruiter/pages/recruiter_profile_page.dart';
import 'package:prolink_recruiter/pages/settings_page.dart';
import 'package:prolink_recruiter/pages/view_jobs_page.dart';
import 'package:prolink_recruiter/providers/application_provider.dart';
import 'package:prolink_recruiter/providers/job_provider.dart';
import 'package:prolink_recruiter/providers/recruiter_provider.dart';
import 'package:prolink_recruiter/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'auth/auth_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context)=> JobProvider()),
      ChangeNotifierProvider(create: (context) => RecruiterProvider()),
      ChangeNotifierProvider(create: (context) => ApplicationProvider()),
    ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
    initialLocation: DashboardPage.routeName,
    redirect: (context, state) {
      if (AuthService.currentUser == null) {
        return LoginPage.routeName;
      }
      return null;
    },
    routes: [
      GoRoute(
        name: DashboardPage.routeName,
        path: DashboardPage.routeName,
        builder: (context, state) => const DashboardPage(),
        routes: [
          GoRoute(
            name: AddJobPage.routeName,
            path: AddJobPage.routeName,
            builder: (context, state) => const AddJobPage(),
          ),
          GoRoute(
            name: ApplicationsPage.routeName,
            path: ApplicationsPage.routeName,
            builder: (context, state) => ApplicationsPage(),
            routes: [
              GoRoute(
                name: ApplicantsPage.routeName,
                path: ApplicantsPage.routeName,
                builder: (context, state) => ApplicantsPage(id: state.extra! as String,),
              ),
            ]
          ),
          GoRoute(
            name: CompanyPage.routeName,
            path: CompanyPage.routeName,
            builder: (context, state) => const CompanyPage(),
          ),
          GoRoute(
            name: ViewJobsPage.routeName,
            path: ViewJobsPage.routeName,
            builder: (context, state) => const ViewJobsPage(),
            routes: [
              GoRoute(
                  name: JobDetailsPage.routeName,
                  path: JobDetailsPage.routeName,
                  builder: (context, state) =>  JobDetailsPage(id: state.extra! as String,),
                  routes: [
                    GoRoute(
                      name: DescriptionPage.routeName,
                      path: DescriptionPage.routeName,
                      builder: (context, state) =>  DescriptionPage(id: state.extra! as String,),
                    ),
                  ]
              ),
            ],
          ),
          GoRoute(
            name: SettingsPage.routeName,
            path: SettingsPage.routeName,
            builder: (context, state) => const SettingsPage(),
          ),
          GoRoute(
            name: RecruiterProfilePage.routeName,
            path: RecruiterProfilePage.routeName,
            builder: (context, state) => const RecruiterProfilePage(),
          ),
          GoRoute(
            name: ApplicantProfilePage.routeName,
            path: ApplicantProfilePage.routeName,
            builder: (context, state) =>  ApplicantProfilePage(pair: state.extra! as SeekerWithApplication,),
          ),
        ],
      ),
      GoRoute(
        name: LoginPage.routeName,
        path: LoginPage.routeName,
        builder: (context, state) => const LoginPage(),
      ),
    ]); //
