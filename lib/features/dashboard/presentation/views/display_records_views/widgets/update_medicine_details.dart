import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_medicine_cubit/manage_medicines_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateMedicineDetails extends StatefulWidget {
  const UpdateMedicineDetails({super.key, required this.medicine});

  final MedicineEntity medicine;

  @override
  State<UpdateMedicineDetails> createState() => _UpdateMedicineDetailsState();
}

class _UpdateMedicineDetailsState extends State<UpdateMedicineDetails> {
  late final TextEditingController notesController;
  late bool isReminderActive;

  @override
  void initState() {
    super.initState();
    final medicine = widget.medicine;
    notesController = TextEditingController(text: medicine.medicineNotes);
    isReminderActive = medicine.isReminderActive;
  }

  @override
  void dispose() {
    notesController.dispose();
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
              controller: notesController,
              decoration: const InputDecoration(
                labelText: 'Notes',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            8.verticalSpacing,
            SwitchListTile(
              title: const Text('Reminder'),
              value: isReminderActive,
              onChanged: (value) {
                setState(() {
                  isReminderActive = value;
                });
              },
            ),
            20.verticalSpacing,
            CustomButton(
              backgroundColor: AppColors.buttonAccent,
              child: Text('Save', style: Styles.styleWhite20),
              onPressed: () {
                final updatedMedicine = widget.medicine
                  ..medicineNotes = notesController.text
                  ..isReminderActive = isReminderActive;
                context.read<ManageMedicinesCubit>().updateMedicines(
                  medicine: updatedMedicine,
                );
                Navigator.pop(context);
              },
            ),
            20.verticalSpacing,
          ],
        ),
      ),
    );
  }
}
