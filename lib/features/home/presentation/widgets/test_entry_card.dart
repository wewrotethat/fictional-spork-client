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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {},
        child: Ink(
          decoration: BoxDecoration(
            color: _getBackgroundColor(context),
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(color: Theme.of(context).shadowColor, blurRadius: 10)
            ],
          ),
          padding: const EdgeInsets.all(10),
          child: _buildContent(context),
        ),
      ),
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
                value: _getTestStatusName(testStatus),
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
      padding: const EdgeInsets.symmetric(vertical: 2.5),
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

  String _getTestStatusName(TestStatus testStatus) {
    switch (testStatus) {
      case TestStatus.pending:
        return 'Pending';
      case TestStatus.queued:
        return 'Queued';
      case TestStatus.resultReady:
        return 'Result Ready';
      default:
        return 'Unknown';
    }
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
