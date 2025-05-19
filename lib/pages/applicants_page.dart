import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prolink_recruiter/models/job_seeker.dart';
import 'package:prolink_recruiter/pages/applicants_profile_page.dart';
import 'package:provider/provider.dart';
import '../models/SeekerWithApplication.dart';
import '../providers/application_provider.dart';
import '../utils/constants.dart';

class ApplicantsPage extends StatefulWidget {
  static const String routeName = 'applicants';
  final String id;

   ApplicantsPage({required this.id});

  @override
  _ApplicantsPageState createState() => _ApplicantsPageState();
}

class _ApplicantsPageState extends State<ApplicantsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ApplicationProvider>(context, listen: false)
        .getApplicationsByJobId(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applicants for Job'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: Consumer<ApplicationProvider>(
        builder: (context, provider, _) {
          final pairedList = provider.seekerWithApplications;

          if (pairedList.isEmpty) {
            return const Center(child: Text("No applicants found."));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: pairedList.length,
              itemBuilder: (context, index) {
                final pair = pairedList[index];
                final seeker = pair.seeker;
                final application = pair.application;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(ApplicantProfilePage.routeName, extra: SeekerWithApplication(seeker: seeker, application: application),);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  seeker.userName ?? "Unknown",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  application.applicationStatus,
                                  style: TextStyle(
                                    color: getStatusColor(application.applicationStatus),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
