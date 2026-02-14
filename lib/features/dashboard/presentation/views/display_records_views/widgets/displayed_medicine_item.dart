import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helpers/show_alert_dialog.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/utils/info_box.dart';
import 'package:curely/core/widgets/custom_alert_dialog.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_medicine_cubit/manage_medicines_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class DisplayedMedicineItem extends StatelessWidget {
  const DisplayedMedicineItem({super.key, required this.medicineItem});

  final MedicineEntity medicineItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ManageMedicinesCubit cubit = context.read<ManageMedicinesCubit>();
        GoRouter.of(context).push(
          AppRoutesConstants.kMedicineDetailsView,
          extra: [medicineItem, cubit],
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(
            SpacingConstants.borderRadius,
          ),
          side: BorderSide(color: AppColors.borderMedium),
        ),
        color: AppColors.background,
        elevation: 8,
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: GestureDetector(
                onTap: () => medicineItem.isReminderActive
                    ? showAlertDialog(
                        context: context,
                        content: CustomAlertDialog(
                          dialogContext: context,
                          title: 'Stop Reminder?',
                          content:
                              'Are you sure you want to stop the reminder for ${medicineItem.medicineName}?',
                          onDone: () {
                            context
                                .read<ManageMedicinesCubit>()
                                .updateMedicines(
                                  medicine: medicineItem
                                    ..isReminderActive = false,
                                );
                            InfoBox.customSnackBar(
                              context,
                              'Reminder for ${medicineItem.medicineName} stopped.',
                            );
                            GoRouter.of(context).pop();
                          },
                        ),
                      )
                    : null,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: Icon(
                    Icons.access_alarms_outlined,
                    size: 25,
                    color: medicineItem.isReminderActive
                        ? AppColors.primary
                        : AppColors.unActive,
                  ),
                ),
              ),
            ),
            medicineItem.imageUrl == null
                ? Icon(
                    FontAwesomeIcons.pills,
                    size: 50,
                    color: AppColors.primary,
                  )
                : Image.network(medicineItem.imageUrl!, width: 60, height: 60),
            Spacer(),
            Text(medicineItem.medicineName, style: Styles.styleBlue20),
            4.verticalSpacing,
            Text(medicineItem.medicineTypes, style: Styles.style16),
            4.verticalSpacing,
            Text(medicineItem.medicineUsage, style: Styles.style16),
            12.verticalSpacing,
          ],
        ),
      ),
    );
  }
}
