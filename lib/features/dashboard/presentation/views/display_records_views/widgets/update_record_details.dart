import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

class UpdateRecordDetails extends StatefulWidget {
  const UpdateRecordDetails({super.key, this.diagnosis, required this.onSave});

  final String? diagnosis;
  final void Function(String?) onSave;

  @override
  State<UpdateRecordDetails> createState() => _UpdateRecordDetailsState();
}

class _UpdateRecordDetailsState extends State<UpdateRecordDetails> {
  late final TextEditingController diagnosisController;

  @override
  void initState() {
    super.initState();
    diagnosisController = TextEditingController(text: widget.diagnosis);
  }

  @override
  void dispose() {
    diagnosisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Edit Your Details', style: Styles.styleBlue20),
            20.verticalSpacing,
            TextFormField(
              controller: diagnosisController,
              decoration: const InputDecoration(
                labelText: 'Diagnosis',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            20.verticalSpacing,
            CustomButton(
              backgroundColor: AppColors.buttonAccent,
              onPressed: () {
                widget.onSave(diagnosisController.text);
              },
              child: Text('Save', style: Styles.styleWhite20),
            ),
            20.verticalSpacing,
          ],
        ),
      ),
    );
  }
}
