import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:prolink_recruiter/pages/dashboard_page.dart';
import 'package:prolink_recruiter/providers/recruiter_provider.dart';
import 'package:provider/provider.dart';

import '../auth/auth_service.dart';
import '../customwidgets/login_section.dart';
import '../customwidgets/registration_section.dart';
import '../utils/colors.dart';
import '../utils/widget_functions.dart';



enum AuthChoice { login, register }

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _errMsg = '';
  AuthChoice _authChoice = AuthChoice.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'Welcome, Recruiter',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),
            SegmentedButton<AuthChoice>(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return kShrineBrown900;
                  }
                  return null;
                }),
                foregroundColor: WidgetStateColor.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return kShrineSurfaceWhite;
                  }
                  return kShrineBrown900;
                }),
                shape: WidgetStateProperty.resolveWith((states) {
                  return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0));
                }),
              ),
              showSelectedIcon: false,
              segments: const [
                ButtonSegment<AuthChoice>(
                  value: AuthChoice.login,
                  label: Text('LOGIN'),
                ),
                ButtonSegment<AuthChoice>(
                  value: AuthChoice.register,
                  label: Text('REGISTER'),
                ),
              ],
              selected: {_authChoice},
              onSelectionChanged: (choice) {
                setState(() {
                  _authChoice = choice.first;
                });
              },
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 500),
                  crossFadeState: _authChoice == AuthChoice.login
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: LoginSection(
                    onSuccess: () {
                      showMsg(context, 'Login Successful');
                      context.goNamed(DashboardPage.routeName);
                    },
                    onFailure: (value) {
                      setState(() {
                        _errMsg = value;
                      });
                    },
                  ),
                  secondChild: RegistrationSection(
                    onSuccess: () {
                      showMsg(context, 'Registration Successful');
                       context.goNamed(DashboardPage.routeName);
                    },
                    onFailure: (value) {
                      setState(() {
                        _errMsg = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            if (_errMsg.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _errMsg,
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }

}