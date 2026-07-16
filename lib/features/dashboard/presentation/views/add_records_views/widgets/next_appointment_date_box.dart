import 'package:curely/core/helpers/notification_permission.dart';
import 'package:curely/core/widgets/custom_date_box.dart';
import 'package:curely/features/dashboard/presentation/cubits/add_prescription_cubit/add_prescription_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_icon_button_row.dart';

class NextAppointmentDateBox extends StatelessWidget {
  const NextAppointmentDateBox({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AddPrescriptionCubit>();
    return CustomDateBox(
      child: CustomIconButtonRow(
        text1: '${context.tr('next_appointment_date')}: ',
        text2: cubit.nextAppointmentDate != null
            ? DateFormat("dd/MM/yyyy").format(cubit.nextAppointmentDate!)
            : context.tr('pick_date'),
        icon: Icons.calendar_month_outlined,
        onPressed: () async {
          await notificationPermission(
            context: context,
            contentText: context.tr('next_appointment_reminder_permission'),
            onPermissionResult: (granted) {
              if (granted) {
                showDatePicker(
                  context: context,
                  initialDate:
                      cubit.nextAppointmentDate ??
                      DateTime.now().add(const Duration(days: 7)),
                  firstDate: DateTime.now().add(const Duration(days: 1)),
                  lastDate: DateTime(2030),
                ).then((value) => cubit.updateNextAppointmentDate(value));
              }
            },
          );
        },
      ),
    );
  }
}
