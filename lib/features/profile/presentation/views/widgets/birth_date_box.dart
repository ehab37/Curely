import 'package:curely/core/widgets/custom_date_box.dart';
import 'package:curely/features/dashboard/presentation/views/add_records_views/widgets/custom_icon_button_row.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthDateBox extends StatefulWidget {
  const BirthDateBox({super.key, required this.onChanged});

  final ValueChanged<DateTime> onChanged;

  @override
  State<BirthDateBox> createState() => _BirthDateBoxState();
}

class _BirthDateBoxState extends State<BirthDateBox> {
  DateTime? dateOfBirth;

  @override
  Widget build(BuildContext context) {
    return CustomDateBox(
      child: CustomIconButtonRow(
        text1: 'Date of birth: ',
        text2: dateOfBirth != null
            ? DateFormat("dd/MM/yyyy").format(dateOfBirth!)
            : 'Pick a Date',
        icon: Icons.date_range_outlined,
        onPressed: () async {
          final pickedDate = await showDatePicker(
            context: context,
            initialDate: dateOfBirth ?? DateTime(2000),
            firstDate: DateTime(1960),
            lastDate: DateTime(2010),
          );
          if (pickedDate != null) {
            setState(() {
              dateOfBirth = pickedDate;
              widget.onChanged(dateOfBirth!);
            });
          }
        },
      ),
    );
  }
}
