import 'package:curely/core/widgets/custom_date_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'custom_icon_button_row.dart';

class ExaminationDateBox extends StatefulWidget {
  const ExaminationDateBox({super.key, required this.onChanged});

  final ValueChanged<DateTime> onChanged;

  @override
  State<ExaminationDateBox> createState() => _ExaminationDateBoxState();
}

class _ExaminationDateBoxState extends State<ExaminationDateBox> {
  DateTime? examinationDate;

  @override
  Widget build(BuildContext context) {
    return CustomDateBox(
      child: CustomIconButtonRow(
        text1: '${context.tr('examination_date')}: ',
        text2: examinationDate != null
            ? DateFormat("dd/MM/yyyy").format(examinationDate!)
            : context.tr('pick_date'),
        icon: Icons.date_range_outlined,
        onPressed: () {
          showDatePicker(
            context: context,
            initialDate: examinationDate ?? DateTime.now(),
            firstDate: DateTime(2016),
            lastDate: DateTime.now(),
          ).then((value) {
            setState(() {
              examinationDate = value;
              widget.onChanged(examinationDate ?? DateTime.now());
            });
          });
        },
      ),
    );
  }
}
