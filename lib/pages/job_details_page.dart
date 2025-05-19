import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prolink_recruiter/providers/job_provider.dart';
import 'package:provider/provider.dart';

import '../models/job.dart';
import '../utils/constants.dart';
import '../utils/widget_functions.dart';
import 'description_page.dart';

class JobDetailsPage extends StatefulWidget {
  static const String routeName = 'jobdetails';
  final String id;

  const JobDetailsPage({
    super.key,
    required this.id,
  });

  @override
  State<JobDetailsPage> createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  late Job job;
  late JobProvider provider;

  @override
  void didChangeDependencies() {
    provider = Provider.of<JobProvider>(
      context,
    );
    job = provider.findJobById(widget.id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          job.title,
          style: const TextStyle(overflow: TextOverflow.ellipsis),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            CachedNetworkImage(
              width: double.infinity,
              height: 200,
              imageUrl: job.logo.downloadUrl,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                job.description == null
                    ? context.goNamed(DescriptionPage.routeName,
                        extra: job.jobId)
                    : _showDescriptionDialog();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.surface,
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                elevation: 2,
              ),
              child: Text(job.description == null
                  ? 'Add Description'
                  : 'Show Description', style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface, // Auto-adapts to theme
              ),),
            ),
            ListTile(
              title: Text(job.company.name),
              subtitle: Text(job.title),
            ),
            ListTile(
              title: Text('Salary: $currencySymbol${job.salary}'),
              trailing: IconButton(
                onPressed: () {
                  showSingleTextInputDialog(
                    context: context,
                    title: 'Edit Salary',
                    onSubmit: (value) {
                      EasyLoading.show(status: 'Please Wait');
                      provider
                          .updateJobField(
                              job.jobId!, 'salary', num.parse(value))
                          .then((value) {
                        EasyLoading.dismiss();
                        showMsg(context, 'Salary Updated');
                      });
                    },
                  );
                },
                icon: const Icon(Icons.edit),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Job Type: ${job.jobType}'),
            SizedBox(
              height: 10,
            ),
            Text('Location Type: ${job.locationType}'),
            SizedBox(
              height: 10,
            ),
            Text(job.location == null
                ? 'No Location added'
                : 'Location: ${job.location}'),
            SizedBox(
              height: 10,
            ),
            Text('Experience Level: ${job.experienceLevel}'),

            const SizedBox(height: 20),
            Text(
              job.status == 'closed'
                  ? 'Status: Closed'
                  : 'Status: Active',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: job.status == 'closed'
                    ? Colors.red
                    : Colors.green,
              ),
            ),
            const SizedBox(height: 12),
            if (job.status != 'closed')
              ElevatedButton.icon(
                onPressed: () async {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Close Job'),
                      content: const Text(
                          'Are you sure you want to close this job? It will stop accepting applications.'),
                      actions: [
                        TextButton(
                          onPressed: () => context.pop(false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => context.pop(true),
                          child: const Text('Close Job'),
                        ),
                      ],
                    ),
                  );

                  if (confirm ?? false) {
                    EasyLoading.show(status: 'Updating...');
                    await provider.updateJobField(job.jobId!, 'status', 'closed');
                    EasyLoading.dismiss();
                    showMsg(context, 'Job closed successfully');
                    setState(() {
                      job = provider.findJobById(widget.id); // Refresh the local job instance
                    });
                  }
                },
                icon: const Icon(Icons.lock_outline,color: Colors.white,),
                label: const Text('Close Job'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade900,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),

          ],
        ),
      ),
    );
  }

  _showDescriptionDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(job.title),
              content: SingleChildScrollView(
                child: Text(job.description!),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                    context.goNamed(DescriptionPage.routeName,
                        extra: job.jobId);
                  },
                  child: const Text('Edit'),
                ),
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Close'),
                )
              ],
            ));
  }
}
