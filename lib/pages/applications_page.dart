import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prolink_recruiter/auth/auth_service.dart';
import 'package:provider/provider.dart';

import '../models/job.dart';
import '../providers/job_provider.dart';
import '../utils/constants.dart';
import 'applicants_page.dart';

class ApplicationsPage extends StatefulWidget {
  static const String routeName = 'applications';

  @override
  State<ApplicationsPage> createState() => _ApplicationsPageState();
}

class _ApplicationsPageState extends State<ApplicationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Job Postings'),
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0,
        ),
        body: Consumer<JobProvider>(
          builder: (context, provider, child) {
            if (provider.jobList.isEmpty) {
              return Center(
                child: Text(
                  'No jobs posted by you yet.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              );
            }
            return  Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount:  provider.jobList.length,
              itemBuilder: (context, index) {
                final job = provider.jobList[index];
                return GestureDetector(
                  onTap: (){ context.goNamed(ApplicantsPage.routeName, extra: job.jobId);},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: job.logo.downloadUrl,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 200,
                                    child: Text(
                                      job.title, // Job Title
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                   job.company.name, // Company Name
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.inversePrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                         const Icon(
                              Icons.people, // Icon to view applicants
                              color: Colors.blue,

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
