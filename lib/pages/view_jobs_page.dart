import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prolink_recruiter/providers/job_provider.dart';
import 'package:provider/provider.dart';
import 'job_details_page.dart';

class ViewJobsPage extends StatefulWidget {
  static const String routeName = 'viewjob';

  const ViewJobsPage({super.key});

  @override
  State<ViewJobsPage> createState() => _ViewJobPageState();
}

class _ViewJobPageState extends State<ViewJobsPage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs'),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
      backgroundColor: colorScheme.surface,
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

          return  ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: provider.jobList.length,
            itemBuilder: (context, index) {
              final job = provider.jobList[index];
              return InkWell(
                onTap: () {
                  context.goNamed(JobDetailsPage.routeName, extra: job.jobId);
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest.withOpacity(
                        isDark ? 0.2 : 0.6),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: colorScheme.outline),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          imageUrl: job.logo.downloadUrl,
                          placeholder: (context, url) =>
                              Container(
                                color: colorScheme.surface,
                                width: 60,
                                height: 60,
                                child: const Center(
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2)),
                              ),
                          errorWidget: (context, url, error) =>
                              Container(
                                width: 60,
                                height: 60,
                                color: colorScheme.surface,
                                child: Icon(Icons.image_not_supported,
                                    color: colorScheme.onSurface),
                              ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              job.company.name,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              job.title,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                color: colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.remove_red_eye_outlined, size: 16,
                                    color: colorScheme.outline),
                                const SizedBox(width: 4),
                                Text(
                                  'View Details',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                    color: colorScheme.outline,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16,
                          color: colorScheme.outline),
                    ],
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
