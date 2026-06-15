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
            title: Text(
              note.title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Text(
              note.description,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
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
          Positioned.directional(
            textDirection: Directionality.of(context),
            bottom: 6,
            end: 12,
            child: Text(
              note.createdAt ?? '',
              textDirection: TextDirection.ltr,
              style: Styles.style15(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
