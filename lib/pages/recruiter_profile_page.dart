import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/recruiter_provider.dart';
import '../utils/widget_functions.dart';

class RecruiterProfilePage extends StatelessWidget {
  static const String routeName = 'profile';

  const RecruiterProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recruiterProvider = Provider.of<RecruiterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('My Profile'),
      ),
      body: ListView(
        children: [
          _headerSection(context, recruiterProvider),
          ListTile(
            leading: const Icon(Icons.call),
            title: Text(recruiterProvider.recruiter?.contactNumber ?? 'Not set yet'),
            trailing: IconButton(
              onPressed: () {
                showSingleTextInputDialog(
                  context: context,
                  title: 'Update Mobile No',
                  onSubmit: (input) async {
                    await recruiterProvider.updateRecruiterProfile(field: 'contactNumber', value: input);
                  },
                );
              },
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.apartment),
            title: Text(recruiterProvider.recruiter?.companyName ??
                'Not set yet'),
            subtitle: const Text('Company Name'),
            trailing: IconButton(
              onPressed: () {
                showSingleTextInputDialog(
                  context: context,
                  title: 'Update Company Name',
                  onSubmit: (input) async {
                    await recruiterProvider.updateRecruiterProfile(field: 'companyName', value: input);
                  },
                );
              },
              icon: const Icon(Icons.edit),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.local_post_office),
            title: Text(
                recruiterProvider.recruiter?.userName ?? 'Not set yet'),
            subtitle: const Text('User Name'),
            trailing: IconButton(
              onPressed: () {
                showSingleTextInputDialog(
                  context: context,
                  title: 'Update User Name',
                  onSubmit: (input) async {
                    await recruiterProvider.updateRecruiterProfile(field: 'userName', value: input);
                  },
                );
              },
              icon: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }

  Padding _headerSection(BuildContext context, RecruiterProvider recruiterProvider) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Card(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
              elevation: 5,
              child: Icon(
                Icons.person,
                size: 90,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recruiterProvider.recruiter?.userName ?? 'No Display Name',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  recruiterProvider.recruiter!.email,
                  style: TextStyle(color: Colors.white60),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}