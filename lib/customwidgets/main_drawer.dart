import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prolink_recruiter/pages/recruiter_profile_page.dart';
import 'package:provider/provider.dart';

import '../auth/auth_service.dart';
import '../pages/login_page.dart';
import '../pages/settings_page.dart';
import '../theme/theme_provider.dart';


class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: Icon(
              Icons.search_outlined,
              size: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                'P R O F I L E',
                style: TextStyle(
                  color: Color.fromARGB(255, 117, 117, 117),
                ),
              ),
              onTap: () {
                context.pop();
                context.goNamed(RecruiterProfilePage.routeName);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                'S E T T I N G S',
                style: TextStyle(
                  color: Color.fromARGB(255, 117, 117, 117),
                ),
              ),
              onTap: () {
                context.pop();
                context.goNamed(SettingsPage.routeName);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'L O G O U T',
                style: TextStyle(
                  color: Color.fromARGB(255, 117, 117, 117),
                ),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('Logout'),
                        content:
                        const Text('Are you sure you want to logout?'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            child: const Text('Cancel',style: TextStyle(color: CupertinoColors.activeBlue),),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            child: const Text('Logout'),
                            onPressed: () async {
                              Navigator.of(context).pop(); // Close the alert dialog
                              AuthService.logout().then((value) =>
                                  context.goNamed(LoginPage.routeName));
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}