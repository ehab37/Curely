import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_cached_image.dart';
import 'package:curely/features/dashboard/domain/entities/rays_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'custom_list_view.dart';

class ReadRaysWidget extends StatelessWidget {
  const ReadRaysWidget({super.key, required this.rays});

  final RaysEntity rays;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          rays.imageUrls!.length == 1
              ? Center(
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRoutesConstants.kImageView,
                        extra: rays.imageUrls![0],
                      );
                    },
                    child: Hero(
                      tag: rays.imageUrls![0],
                      child: CustomCachedImage(
                        height: 150,
                        url: rays.imageUrls![0],
                      ),
                    ),
                  ),
                )
              : CustomListView(list: rays.imageUrls!),
          24.verticalSpacing,
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.userDoctor),
              title: const Text('Doctor Name'),
              subtitle: Text(rays.doctorName),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.xRay),
              title: const Text('Rays Type'),
              subtitle: Text(rays.raysType),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.circleRadiation),
              title: const Text('Radiology Center'),
              subtitle: Text(rays.radiologyCenter ?? 'Not Added'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.notes),
              title: const Text('Diagnosis'),
              subtitle: Text(rays.diagnosis ?? 'No Diagnosis'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Examination Date'),
              subtitle: Text(
                DateFormat(
                  "dd/MM/yyyy",
                ).format(DateTime.parse(rays.examinationDate)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
