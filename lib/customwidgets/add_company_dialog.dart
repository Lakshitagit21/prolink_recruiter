
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/job_provider.dart';
import '../utils/widget_functions.dart';
import 'package:go_router/go_router.dart';

class AddCompanyDialog extends StatefulWidget {
  @override
  _AddCompanyDialogState createState() => _AddCompanyDialogState();
}

class _AddCompanyDialogState extends State<AddCompanyDialog> {
  final _nameController = TextEditingController();
  String? imageLocalPath;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Company'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            imageLocalPath == null
                ? const Icon(Icons.image, size: 100)
                : Image.file(
              File(imageLocalPath!),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.camera),
                  label: const Text('Camera'),
                  onPressed: () => _pickImage(ImageSource.camera),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Gallery'),
                  onPressed: () => _pickImage(ImageSource.gallery),
                ),
              ],
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Company Name'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            _resetFields();
            context.pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_nameController.text.isEmpty || imageLocalPath == null) {
              showMsg(context, 'Please provide all fields');
              return;
            }

            EasyLoading.show(status: 'Uploading...');
            try {
              final imageModel = await Provider.of<JobProvider>(context, listen: false)
                  .uploadCompanyImage(imageLocalPath!);
              await Provider.of<JobProvider>(context, listen: false)
                  .addCompany(_nameController.text, imageModel);
              EasyLoading.dismiss();
              _resetFields();
              context.pop();
              showMsg(context, 'Company Added');
            } catch (e) {
              EasyLoading.dismiss();
              context.pop();
              showMsg(context, 'Failed: $e');
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final file = await ImagePicker().pickImage(source: source, imageQuality: 50);
    if (file != null) {
      setState(() {
        imageLocalPath = file.path;
      });
    }
  }
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _resetFields() {
    setState(() {
      _nameController.clear();
      imageLocalPath = null;
    });
  }
}
