import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_cached_image.dart';
import 'package:curely/features/dashboard/domain/entities/medicine_entity.dart';
import 'package:curely/features/dashboard/presentation/cubits/manage_medicine_cubit/manage_medicines_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'custom_fav_icon.dart';
import 'medicine_reminder_icon.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<ManageMedicinesCubit>().updateMedicines(
                      medicine: medicineItem
                        ..isFavorite = !medicineItem.isFavorite,
                    );
                  },
                  child: CustomFavIcon(isFav: medicineItem.isFavorite),
                ),
                MedicineReminderIcon(medicineItem: medicineItem),
              ],
            ),
            medicineItem.imageUrl == null
                ? Icon(
                    FontAwesomeIcons.pills,
                    size: 50,
                    color: AppColors.primary,
                  )
                : CustomCachedImage(height: 60, url: medicineItem.imageUrl!),
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
