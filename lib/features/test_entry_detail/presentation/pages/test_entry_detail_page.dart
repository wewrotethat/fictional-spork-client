import 'package:fictional_spork/features/test_entry_detail/presentation/presentation.dart';
import 'package:flutter/material.dart';

import 'package:fictional_spork/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TestEntryDetailPage extends StatefulWidget {
  const TestEntryDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  static const routeName = '/test-entry-detail';

  final String id;

  @override
  State<TestEntryDetailPage> createState() => _TestEntryDetailPageState();
}

class _TestEntryDetailPageState extends State<TestEntryDetailPage> {
  final _getTestEntryCubit = GetLabTestEntryCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return BlocBuilder<GetLabTestEntryCubit, GetLabTestEntryState>(
      bloc: _getTestEntryCubit..getLabTestEntry(widget.id),
      builder: (context, state) {
        if (state is GetLabTestEntrySuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildPatientInfoCard(context, state.labTestEntry.patientInfo),
                _buildSpacer(context, height: 20),
                _buildSpecimenInfo(context, state.labTestEntry),
                _buildSpacer(context, height: 20),
                if (state.labTestEntry.bloodSmearImageUrl != null)
                  _buildSpecimenData(
                      context,
                      state.labTestEntry.bloodSmearImageUrl!,
                      state.labTestEntry.status),
                if (state.labTestEntry.status == 'pending' &&
                    state.labTestEntry.bloodSmearImageUrl == null)
                  _buildUploadCard(context),
                if (state.labTestEntry.status == 'ready')
                  _buildResultCard(context, state.labTestEntry),
              ],
            ),
          );
        } else if (state is GetLabTestEntryFailure) {
          return CustomErrorWidget(
            onRetryPressed: () {
              _getTestEntryCubit.getLabTestEntry(widget.id);
            },
          );
        }
        return const Center(
          child: CustomLoadingIndicator(),
        );
      },
    );
  }

  Widget _buildPatientInfoCard(BuildContext context, ProfileInfo? patientInfo) {
    if (patientInfo == null) {
      return CustomCard(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Text(
              'No patient info found',
              style: GoogleFonts.abel(
                color: Theme.of(context).colorScheme.secondary,
                textStyle: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        ),
      );
    }
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

  Widget _buildSpecimenInfo(BuildContext context, LabTestEntry labTestEntry) {
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
            value: labTestEntry.id,
          ),
          _buildSpacer(context),
          _buildPropertyField(
            context,
            label: 'Created on',
            value: DateFormat.yMMMMd().format(labTestEntry.createdAt),
          ),
          _buildSpacer(context),
          _buildPropertyField(
            context,
            label: 'Created at',
            value: DateFormat.Hms().format(labTestEntry.createdAt),
          ),
          _buildSpacer(context),
          _buildPropertyField(
            context,
            label: 'Status',
            value: labTestEntry.status.capitalize(),
          ),
          if (labTestEntry.bloodSmearImageUrl != null)
            TextButton(
              onPressed: () {},
              child: const Text('Start diagnosis'),
            )
        ],
      ),
    );
  }

  Widget _buildSpecimenData(
      BuildContext context, String bloodSmearImageUrl, String status) {
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
          _buildViewSpecimenButton(context, bloodSmearImageUrl),
          if (status != 'ready') _buildReUploadButton(context),
        ],
      ),
    );
  }

  Widget _buildReUploadButton(BuildContext context) {
    return ElevatedButton(
      onPressed: uploadImage,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.secondary),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 40),
        ),
      ),
      child: const Text('Change Specimen Image'),
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

  Widget _buildResultCard(BuildContext context, LabTestEntry labTestEntry) {
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
            value: labTestEntry.result?.status ?? 'N/A',
          ),
          _buildSpacer(context),
          _buildPropertyField(
            context,
            label: 'Stage',
            value: labTestEntry.result!.stage ?? 'N/A',
          ),
          _buildSpacer(context),
        ],
      ),
    );
  }

  Widget _buildUploadButton(BuildContext context) {
    return ElevatedButton(
      onPressed: uploadImage,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 40),
        ),
      ),
      child: const Text('Upload Specimen Image'),
    );
  }

  void uploadImage() async {
    showModalBottomSheet(
      context: context,
      builder: (context) => ImageSourcePicker(
          id: widget.id,
          onUpload: () => _getTestEntryCubit.getLabTestEntry(widget.id)),
    );
  }

  Widget _buildViewSpecimenButton(
      BuildContext context, String bloodSmearImageUrl) {
    return TextButton(
      onPressed: () => _showImageSheet(context, bloodSmearImageUrl),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 40),
        ),
      ),
      child: const Text('View Specimen Image'),
    );
  }

  Future<void> _showImageSheet(BuildContext context, String imageUrl) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return ImagePreview(
          imageUrl: imageUrl,
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
