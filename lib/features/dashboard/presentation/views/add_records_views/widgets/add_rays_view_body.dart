import 'package:curely/constants.dart';
import 'package:curely/core/helper_functions/validation_functions.dart';
import 'package:curely/core/utils/styles.dart';
import 'package:curely/core/widgets/custom_back_bar.dart';
import 'package:curely/core/widgets/custom_button.dart';
import 'package:curely/core/widgets/custom_dropdown_menu.dart';
import 'package:curely/core/widgets/custom_text_fom_field.dart';
import 'package:curely/core/widgets/image_input/global_image_input.dart';
import 'package:curely/features/dashboard/entities/rays_entity.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/widgets/custom_icon_button_row.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddRaysViewBody extends StatefulWidget {
  const AddRaysViewBody({super.key});

  @override
  State<AddRaysViewBody> createState() => _AddRaysViewBodyState();
}

class _AddRaysViewBodyState extends State<AddRaysViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController radiologyCenterController = TextEditingController();
  final TextEditingController diagnosisController = TextEditingController();
  late final RaysTypes? raysType;
  DateTime? examinationDate;

  @override
  void dispose() {
    doctorNameController.dispose();
    radiologyCenterController.dispose();
    diagnosisController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: 8),
          Row(
            children: [
              CustomBackBar(),
              Text("Add Rays", style: Styles.style33),
            ],
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(height: 8),
                CustomTextFormField(
                  controller: doctorNameController,
                  label: "Doctor Name",
                  hint: "Enter Doctor Name",
                  validation: (value) => nameValidator(value, context),
                ),
                CustomTextFormField(
                  controller: radiologyCenterController,
                  label: "Radiology Center",
                  hint: "Enter Radiology Center Name",
                  validation: (value) => nameValidator(value, context),
                ),
                CustomTextFormField(
                  controller: diagnosisController,
                  label: "Diagnosis",
                  maxLines: 3,
                  validation: (value) => nameValidator(value, context),
                ),
                CustomDropdownMenu(
                  hint: 'Rays Type',
                  list: RaysTypes.values.map((e) {
                    return DropdownMenuItem(
                      value: e.name,
                      child: Text(e.name.toUpperCase(), style: Styles.style16),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      raysType = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(25),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CustomIconButtonRow(
                    text1: 'Examination date: ',
                    text2: examinationDate != null
                        ? DateFormat("dd/MM/yyyy").format(examinationDate!)
                        : 'Pick a Date',
                    icon: Icons.date_range_outlined,
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2016),
                        lastDate: DateTime.now(),
                      ).then((value) {
                        setState(() {
                          examinationDate = value;
                        });
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),
                GlobalImageInput(onSelectedImage: (image) {}),
                SizedBox(height: 32),
                CustomButton(
                  onPressed: () {},
                  backgroundColor: kNavyColor,
                  child: Text("Add Rays", style: Styles.styleWhite20),
                ),
                SizedBox(height: kBottomPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
