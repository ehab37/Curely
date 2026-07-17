import 'package:curely/core/constants/spacing_constants.dart';
import 'package:curely/core/helpers/show_custom_bottom_sheet.dart';
import 'package:curely/core/services/get_it.dart';
import 'package:curely/core/widgets/build_custom_app_bar.dart';
import 'package:curely/features/profile/domain/repos/notes_repo.dart';
import 'package:curely/features/profile/presentation/cubits/manage_notes_cubit/manage_notes_cubit.dart';
import 'package:curely/features/profile/presentation/views/widgets/add_note.dart';
import 'package:curely/features/profile/presentation/views/widgets/notes_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key, required this.isFavoriteView});

  final bool isFavoriteView;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ManageNotesCubit(notesRepo: getIt<NotesRepo>())
            ..getNotes(isFavoriteView: isFavoriteView),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: isFavoriteView
                ? buildCustomAppBar(title: context.tr("favorite_health_notes"))
                : buildCustomAppBar(
                    title: context.tr("my_health_notes"),
                    icon: FontAwesomeIcons.fileCirclePlus,
                    isBackable: true,
                    onTap: () {
                      final cubit = context.read<ManageNotesCubit>();
                      showCustomBottomSheet(
                        context,
                        BlocProvider.value(value: cubit, child: AddNote()),
                      );
                    },
                  ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SpacingConstants.horizontalPadding,
                ),
                child: NotesViewBody(isFavoriteView: isFavoriteView),
              ),
            ),
          );
        },
      ),
    );
  }
}
