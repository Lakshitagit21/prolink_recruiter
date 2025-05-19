import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prolink_recruiter/providers/job_provider.dart';
import 'package:provider/provider.dart';
import '../customwidgets/add_company_dialog.dart';
import '../theme/theme_provider.dart';


class CompanyPage extends StatefulWidget {
  static const String routeName = 'company';

  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  String? imageLocalPath;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.themeData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Companies'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddCompanyDialog(),
          );
        },
        backgroundColor: theme.colorScheme.primary,
        child: const Icon(Icons.add),
      ),
      body: Consumer<JobProvider>(
        builder: (context, provider, child) => provider.companyList.isEmpty
            ? Center(
                child: Text('No Company Found', style: theme.textTheme.bodyLarge,),

              )
            : ListView.builder(
                itemCount: provider.companyList.length,
                itemBuilder: (context, index) {
                  final company = provider.companyList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        border: Border.all(color: theme.colorScheme.outline),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                          child: CachedNetworkImage(
                            width: 110,
                            height: 110,
                            fit: BoxFit.contain,
                            imageUrl: company.logo.downloadUrl,
                            placeholder: (context, url) => Container(
                              width: 110,
                              height: 110,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator( color: theme.colorScheme.primary,),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error, color: theme.colorScheme.error,
                                  size: 40,),
                          ),
                        ),
                        title: Text(company.name, style: theme.textTheme.titleMedium,),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
