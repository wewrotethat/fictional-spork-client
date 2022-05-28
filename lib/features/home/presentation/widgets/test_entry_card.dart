import 'package:fictional_spork/core/core.dart';
import 'package:fictional_spork/features/test_entry_detail/presentation/pages/pages.dart';
import 'package:flutter/material.dart';

import 'package:fictional_spork/features/home/domain/domain.dart';

class TestEntryCard extends StatelessWidget {
  const TestEntryCard({
    Key? key,
    required this.testStatus,
  }) : super(key: key);
  final TestStatus testStatus;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: _getBackgroundColor(context),
      padding: const EdgeInsets.all(20),
      onTap: () {
        Navigator.of(context).pushNamed(
          TestEntryDetailPage.routeName,
          arguments: testStatus,
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
                label: 'Patient Name',
                value: 'John Doe',
              ),
              _buildProperty(
                context,
                label: 'Submitted on',
                value: 'Jan 12',
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
                value: '...ef23a',
              ),
              _buildProperty(
                context,
                label: 'Status',
                value: getTestStatusName(testStatus),
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
    switch (testStatus) {
      case TestStatus.resultReady:
        return Theme.of(context).primaryColorLight;
      case TestStatus.queued:
      case TestStatus.pending:
        return Theme.of(context).backgroundColor;
    }
  }
}
