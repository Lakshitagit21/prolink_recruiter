
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prolink_recruiter/models/SeekerWithApplication.dart';
import 'package:prolink_recruiter/models/job_application.dart';
import 'package:prolink_recruiter/models/job_seeker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../providers/application_provider.dart';
import '../utils/constants.dart';
import '../utils/widget_functions.dart';

class ApplicantProfilePage extends StatefulWidget {
  static const String routeName = 'applicantsprofile';
  final SeekerWithApplication pair;


  const ApplicantProfilePage({required this.pair, Key? key}) : super(key: key);

  @override
  _ApplicantProfilePageState createState() => _ApplicantProfilePageState();
}

class _ApplicantProfilePageState extends State<ApplicantProfilePage> {
  late String currentStatus;
  late final JobSeeker seeker;
  late final JobApplication application;

  @override
  void initState() {
     seeker = widget.pair.seeker;
     application =widget.pair.application;
    currentStatus = application.applicationStatus;
    super.initState();
  }
  // Method to update status
  Future<void> _updateStatus(String newStatus) async {
    setState(() {
      currentStatus = newStatus;
    });

    EasyLoading.show(status: 'Updating...');
    await Provider.of<ApplicationProvider>(context,listen: false).updateApplicationField(application.applicationId, 'applicationStatus', newStatus);
    EasyLoading.dismiss();
    showMsg(context, 'Status changed successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: const Text(
          "Applicants Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            // Name
            _buildProfileField('Name', seeker.userName!, Icons.person,Colors.blue),
            const SizedBox(height: 20),

            // Contact Number
            _buildProfileField('Contact Number', seeker.phone!, Icons.phone, Colors.green, onTap: () async {
              final url= 'tel:${seeker.phone!}';
              if(await canLaunchUrlString(url)){
                await launchUrlString(url);
              }
              else{
                showMsg(context, 'Cannot perform this task');
              }
            }),
            const SizedBox(height: 20),
            // Email
            _buildProfileField('Email', seeker.email, Icons.email,Colors.blueGrey,onTap: () async {
                final url= 'mailto:${seeker.email}';
                if(await canLaunchUrlString(url)){
                await launchUrlString(url);
                }
                else{
                showMsg(context, 'Cannot perform this task');
                }
            }),
            const SizedBox(height: 20),
            // Resume URL
            _buildProfileField('Resume URL', seeker.resumeUrl!, Icons.link, Colors.blue, onTap: () async {
              final url= '${seeker.resumeUrl}';
              if(await canLaunchUrlString(url)){
                await launchUrlString(url);
              }
              else{
                showMsg(context, 'Cannot perform this task');
              }
            }),
            const SizedBox(height: 20),
            // Status
            Row(
              children: [
                Text('Current Status:'),
                SizedBox(width: 10,),
                Text(currentStatus,
                  style:  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: getStatusColor(currentStatus),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Status Change Dropdown
            Row(
              children: [
                Text('Change Status:'),
                SizedBox(width: 10,),
                DropdownButton<String>(
                  value: currentStatus,
                  onChanged: (String? newStatus) {
                    if (newStatus != null) {
                      _updateStatus(newStatus);
                    }
                  },
                  items: <String>[ApplicationStatus.pending, ApplicationStatus.accepted, ApplicationStatus.rejected]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: getStatusColor(value))),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value, IconData icon,Color color,{VoidCallback? onTap} ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade100,
            ),
            child: Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
