import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prolink_recruiter/models/company.dart';
import 'package:provider/provider.dart';
import '../auth/auth_service.dart';
import '../customwidgets/radio_group.dart';
import '../models/job.dart';
import '../providers/job_provider.dart';
import '../theme/theme_provider.dart';
import '../utils/constants.dart';
import '../utils/widget_functions.dart';

class AddJobPage extends StatefulWidget {
  static const String routeName = 'addjob';

  const AddJobPage({super.key});

  @override
  State<AddJobPage> createState() => _AddJobPageState();
}

class  _AddJobPageState extends State<AddJobPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _salaryController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();


  Company? company;
  String? imageLocalPath;
  String jobType = JobUtils.jobTypeList.first;
  String experienceLevel = JobUtils.experienceLevelList.first;
  String locationType = JobUtils.locationTypeList.first;



  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.themeData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Job'),
        actions: [
          IconButton(
            onPressed: _saveJob,
            icon: const Icon(Icons.done),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [

            if (company != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: company!.logo.downloadUrl,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          height: 100,
                          width: 100,
                          color: theme.colorScheme.surface,
                          child: const Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.broken_image,
                          size: 80,
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      company!.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            _buildCompanyDropdown(theme),
            _buildTextField(_titleController, 'Job Title', theme),
            _buildTextField(_salaryController, 'Salary', theme, isNumber: true),
            _buildTextField(_descriptionController, 'Description', theme, maxLines: 3),
            RadioGroup(
              label: 'Select Job Type',
              groupValue: jobType,
              items: JobUtils.jobTypeList,
              onItemSelected: (value) => setState(() => jobType = value),
            ),
            RadioGroup(
              label: 'Select Experience Level',
              groupValue: experienceLevel,
              items: JobUtils.experienceLevelList,
              onItemSelected: (value) => setState(() => experienceLevel = value),
            ),
            RadioGroup(
              label: 'Select Location Type',
              groupValue: locationType,
              items: JobUtils.locationTypeList,
              onItemSelected: (value) => setState(() => locationType = value),
            ),
            _buildTextField(_locationController, 'Location (optional)', theme),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyDropdown(ThemeData theme) {
    return Card(
      color: theme.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Consumer<JobProvider>(
          builder: (context, provider, child) => DropdownButtonFormField<Company>(
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Select Company',
              labelStyle: theme.textTheme.bodyMedium,
            ),
            isExpanded: true,
            value: company,
            validator: (value) => value == null ? 'Please select a company' : null,
            items: provider.companyList
                .map((item) => DropdownMenuItem(value: item, child: Text(item.name)))
                .toList(),
            onChanged: (value) => setState(() => company = value),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, ThemeData theme,
      {bool isNumber = false, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: theme.textTheme.bodyMedium,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: theme.inputDecorationTheme.fillColor,
          focusedBorder: theme.inputDecorationTheme.focusedBorder,
          enabledBorder: theme.inputDecorationTheme.border,
        ),
        style: theme.textTheme.bodyMedium,
        validator: (value) {
          if (value == null || value.isEmpty) return 'This field must not be empty';
          if (isNumber && num.tryParse(value) == null) return 'Enter a valid number';
          return null;
        },
      ),
    );
  }

  void _saveJob() async {
    if (_formKey.currentState!.validate()) {
      if (company == null) {
        showMsg(context, 'Please select a company');
        return;
      }
      final user = AuthService.currentUser;
      if (user == null) {
        showMsg(context, 'No recruiter is logged in.');
        return;
      }
      final recruiterId = user.uid;

      if (_formKey.currentState!.validate()) {
        EasyLoading.show(status: 'Saving...');
        try {
          final job = Job(
            title: _titleController.text,
            salary: num.parse(_salaryController.text),
            company: company!,
            recruiterId: recruiterId,
            jobType: jobType,
            locationType: locationType,
            experienceLevel: experienceLevel,
            description: _descriptionController.text,
            logo: company!.logo,
            location: _locationController.text,
          );

          await Provider.of<JobProvider>(context, listen: false).addJob(job);
          EasyLoading.dismiss();
          showMsg(context, 'Job Saved');
          _resetFields();
        } catch (e) {
          EasyLoading.dismiss();
          showMsg(context, 'Error: ${e.toString()}');
        }
      }
    }
  }

  void _resetFields() {
    setState(() {
      _titleController.clear();
      _salaryController.clear();
      _descriptionController.clear();
      _locationController.clear();
      company = null;
      jobType = JobUtils.jobTypeList.first;
      experienceLevel = JobUtils.experienceLevelList.first;
      locationType = JobUtils.locationTypeList.first;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _salaryController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

}
