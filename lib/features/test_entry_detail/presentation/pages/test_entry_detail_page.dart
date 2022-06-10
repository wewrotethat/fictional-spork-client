import 'package:fictional_spork/features/test_entry_detail/presentation/presentation.dart';
import 'package:flutter/material.dart';

import 'package:fictional_spork/core/core.dart';
import 'package:fictional_spork/features/home/domain/domain.dart';

class TestEntryDetailPage extends StatelessWidget {
  const TestEntryDetailPage({
    Key? key,
    required this.testStatus,
  }) : super(key: key);

  static const routeName = '/test-entry-detail';

  final TestStatus testStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          if (testStatus == TestStatus.pending)
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: CustomIconButton(
                icon: Icon(Icons.check),
                backgroundColor: Colors.transparent,
              ),
            )
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        _buildPatientInfoCard(context),
        _buildSpacer(context, height: 20),
        _buildSpecimenInfo(context),
        _buildSpacer(context, height: 20),
        if (testStatus != TestStatus.pending) _buildSpecimenData(context),
        if (testStatus == TestStatus.pending) _buildUploadCard(context),
        if (testStatus == TestStatus.resultReady) _buildResultCard(context)
      ],
    );
  }

  Widget _buildPatientInfoCard(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Patient Info',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const Divider(
            endIndent: 20,
            indent: 20,
            height: 30,
          ),
          _buildPropertyField(
            context,
            label: 'Patient ID/ Card Number',
            value: '12345678',
          ),
          _buildSpacer(context),
          _buildPropertyField(
            context,
            label: 'Name',
            value: 'John Doe',
          ),
          _buildSpacer(context),
          _buildPropertyField(
            context,
            label: 'Gender',
            value: 'Male',
          ),
          _buildSpacer(context),
          _buildPropertyField(
            context,
            label: 'Birthday',
            value: 'Jan. 1, 2001',
          ),
          _buildSpacer(context),
        ],
      ),
    );
  }

  Widget _buildSpecimenInfo(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Specimen Info',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const Divider(
            endIndent: 20,
            indent: 20,
            height: 30,
          ),
          _buildPropertyField(
            context,
            label: 'Specimen ID',
            value: '12345678',
          ),
          _buildSpacer(context),
          _buildPropertyField(
            context,
            label: 'Created on',
            value: 'Jan. 12, 2000',
          ),
          _buildSpacer(context),
          _buildPropertyField(
            context,
            label: 'Created at',
            value: '4:20 AM',
          ),
          _buildSpacer(context),
          _buildPropertyField(
            context,
            label: 'Status',
            value: getTestStatusName(testStatus),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Start diagnosis'),
          )
        ],
      ),
    );
  }

  Widget _buildSpecimenData(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Specimen Image',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const Divider(
            endIndent: 20,
            indent: 20,
            height: 30,
          ),
          _buildPropertyField(
            context,
            label: 'Uploaded on',
            value: 'Jan. 12, 2000',
          ),
          _buildSpacer(context),
          _buildViewSpecimenButton(context),
        ],
      ),
    );
  }

  Widget _buildUploadCard(BuildContext context) {
    return CustomCard(
      borderColor: Theme.of(context).colorScheme.secondary,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Specimen Image',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const Divider(
            endIndent: 20,
            indent: 20,
            height: 30,
          ),
          Text(
            "Specimen image hasn't been uploaded yet",
            style: Theme.of(context).textTheme.caption,
          ),
          _buildSpacer(context),
          _buildUploadButton(context),
        ],
      ),
    );
  }

  Widget _buildResultCard(BuildContext context) {
    return CustomCard(
      borderColor: Theme.of(context).colorScheme.secondary,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Diagnosis',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const Divider(
            endIndent: 20,
            indent: 20,
            height: 30,
          ),
          _buildPropertyField(
            context,
            label: 'Result',
            value: 'Positive',
          ),
          _buildSpacer(context),
          _buildPropertyField(
            context,
            label: 'Stage',
            value: 'V',
          ),
          _buildSpacer(context),
          _buildViewSegmentedSpecimenButton(context),
        ],
      ),
    );
  }

  Widget _buildUploadButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 40),
        ),
      ),
      child: const Text('Upload Specimen Image'),
    );
  }

  Widget _buildViewSpecimenButton(BuildContext context) {
    return TextButton(
      onPressed: () => _showImageSheet(
        context,
        specimenOnly: true,
      ),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 40),
        ),
      ),
      child: const Text('View Specimen Image'),
    );
  }

  Widget _buildViewSegmentedSpecimenButton(BuildContext context) {
    return TextButton(
      onPressed: () => _showImageSheet(context),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 40),
        ),
      ),
      child: const Text('View Segmented Specimen Image'),
    );
  }

  Future<void> _showImageSheet(BuildContext context,
      {bool specimenOnly = false}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return ImagePreview(
          specimenOnly: specimenOnly,
          testStatus: testStatus,
        );
      },
    );
  }

  Widget _buildPropertyField(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }

  Widget _buildSpacer(BuildContext context, {double? height}) {
    return SizedBox(
      height: height ?? 10,
    );
  }
}
