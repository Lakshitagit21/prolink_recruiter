import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:prolink_recruiter/providers/recruiter_provider.dart';
import 'package:provider/provider.dart';

import '../auth/auth_service.dart';
import '../utils/colors.dart';

class RegistrationSection extends StatefulWidget {
  final VoidCallback onSuccess;
  final Function(String) onFailure;
  const RegistrationSection({super.key, required this.onSuccess, required this.onFailure,});

  @override
  State<RegistrationSection> createState() => _RegistrationSectionState();
}

class _RegistrationSectionState extends State<RegistrationSection> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _companyController = TextEditingController();

  @override
  void initState() {
    _emailController.text = 'recruiter1@gmail.com';
    _passwordController.text = '123456';
    _nameController.text = 'ABC';
    _companyController.text ='Google';
    _phoneController.text = '01711112233';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Your Name (optional)',
              ),
              validator: (value) {
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.call),
                labelText: 'Mobile Number (optional)',
              ),
              validator: (value) {
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              controller: _companyController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.category),
                labelText: 'Your Company Name (optional)',
              ),
              validator: (value) {
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email Address',
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'Provide a valid email address';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
              ),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return 'Provide a valid email address';
                }
                return null;
              },
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: kShrineBrown900,
                foregroundColor: kShrineSurfaceWhite,
              ),
              child: const Text('SIGN UP'),
            ),
          ),
        ],
      ),
    );
  }

  void _register() async {
    if(_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please wait');
      final name = _nameController.text;
      final phone = _phoneController.text;
      final email = _emailController.text;
      final password = _passwordController.text;
      final company = _companyController.text;

      try {
        final user = await AuthService.register(email, password);
        await Provider.of<RecruiterProvider>(context, listen: false)
            .addRecruiter(user: user, name: name, phone: phone, company: company);
        EasyLoading.dismiss();
        widget.onSuccess();
      } on FirebaseAuthException catch(error) {
        EasyLoading.dismiss();
        widget.onFailure(error.message!);
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _companyController.dispose();
    super.dispose();
  }
}