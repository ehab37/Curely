import 'package:flutter/material.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
    required this.itemBuilder,
    required this.notesList,
  });

  final Widget? Function(BuildContext, int) itemBuilder;
  final List notesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notesList.length,
      itemBuilder: itemBuilder,
    );
  }
}
