import 'package:flutter/material.dart';

import 'package:fictional_spork/core/core.dart';
import 'package:fictional_spork/features/test_entry_detail/presentation/pages/pages.dart';
import 'package:intl/intl.dart';

class TestEntryCard extends StatelessWidget {
  const TestEntryCard({
    Key? key,
    required this.labTestEntry,
  }) : super(key: key);
  final LabTestEntry labTestEntry;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: _getBackgroundColor(context),
      padding: const EdgeInsets.all(20),
      onTap: () {
        Navigator.of(context).pushNamed(
          TestEntryDetailPage.routeName,
          arguments: labTestEntry.id,
        );
      },
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProperty(
                context,
                label: 'Patient ',
                value: _getName(),
              ),
              _buildProperty(
                context,
                label: 'Submitted on',
                value: DateFormat.yMMMM().format(labTestEntry.createdAt),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildProperty(
                context,
                label: 'Sample ID',
                value: labTestEntry.id.substring(0, 8),
              ),
              _buildProperty(
                context,
                label: 'Status',
                value: labTestEntry.status.capitalize(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProperty(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyText1,
          children: [
            TextSpan(text: '$label '),
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color? _getBackgroundColor(BuildContext context) {
    switch (labTestEntry.status.toLowerCase()) {
      case 'ready':
        return Theme.of(context).primaryColorLight;
      case 'queued':
      case 'pending':
      default:
        return Theme.of(context).backgroundColor;
    }
  }

  String _getName() {
    if (labTestEntry.patientInfo != null) {
      return '${labTestEntry.patientInfo!.firstName} '
          '${labTestEntry.patientInfo!.lastName}';
    } else {
      return 'Unknown';
    }
  }
}
