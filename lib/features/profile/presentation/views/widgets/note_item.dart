import 'package:curely/core/theme/app_colors.dart';
import 'package:curely/core/theme/styles.dart';
import 'package:curely/features/dashboard/presentation/views/display_records_views/widgets/custom_fav_icon.dart';
import 'package:curely/features/profile/domain/entities/note_entity.dart';
import 'package:curely/features/profile/presentation/cubits/manage_notes_cubit/manage_notes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 20,
              top: 4,
            ),
            title: Text(note.title, style: Styles.styleBlue20),
            subtitle: Text(
              note.description,
              overflow: TextOverflow.ellipsis,
              // maxLines: 3,
              style: Styles.style16,
            ),
            trailing: GestureDetector(
              onTap: () {
                context.read<ManageNotesCubit>().updateNote(
                  note: note..isFavorite = !note.isFavorite,
                );
              },
              child: CustomFavIcon(isFav: note.isFavorite),
            ),
          ),
          Positioned(
            bottom: 6,
            right: 12,
            child: Text(
              note.createdAt ?? '',
              style: Styles.style15.copyWith(
                color: AppColors.darkGray.withAlpha(100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
