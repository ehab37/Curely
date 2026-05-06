import 'package:curely/core/constants/app_routes_constant.dart';
import 'package:curely/core/helpers/extensions.dart';
import 'package:curely/core/widgets/custom_cached_image.dart';
import 'package:curely/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'custom_list_view.dart';

class ReadAnalysisWidget extends StatelessWidget {
  const ReadAnalysisWidget({super.key, required this.analysis});

  final AnalysisEntity analysis;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          analysis.imageUrls!.length == 1
              ? Center(
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRoutesConstants.kImageView,
                        extra: analysis.imageUrls![0],
                      );
                    },
                    child: Hero(
                      tag: analysis.imageUrls![0],
                      child: CustomCachedImage(
                        height: 150,
                        url: analysis.imageUrls![0],
                      ),
                    ),
                  ),
                )
              : CustomListView(list: analysis.imageUrls!),
          24.verticalSpacing,
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.userDoctor),
              title: Text(context.tr('doctor_name')),
              subtitle: Text(analysis.doctorName),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.flaskVial),
              title: Text(context.tr('analysis_type')),
              subtitle: Text(context.tr(analysis.analysisType)),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.houseMedicalCircleCheck),
              title: Text(context.tr('lab_name')),
              subtitle: Text(analysis.lab ?? context.tr('not_added')),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.notes),
              title: Text(context.tr('diagnosis')),
              subtitle: Text(analysis.diagnosis ?? context.tr('no_diagnosis')),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.calendar_month),
              title: Text(context.tr('examination_date')),
              subtitle: Text(
                DateFormat(
                  "dd/MM/yyyy",
                ).format(DateTime.parse(analysis.examinationDate)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
