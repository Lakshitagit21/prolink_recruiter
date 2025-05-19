import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/dashboard_model.dart';


class DashboardItemView extends StatelessWidget {
  final DashboardModel model;

  final Function(String) onPress;

  const DashboardItemView(
      {super.key, required this.model, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () => onPress(model.routeName),
        borderRadius: BorderRadius.circular(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 3,
          color: colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  model.iconData,
                  size: 48,
                  color: colorScheme.inversePrimary,
                ),
                const SizedBox(height: 12),
                Text(
                  model.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.inversePrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
