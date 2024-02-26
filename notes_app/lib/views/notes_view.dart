import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/note_cubit/note_cubit.dart';
import 'package:notes_app/cubits/note_cubit/note_state.dart';
import 'package:notes_app/helpers/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/category_tile.dart';
import 'package:notes_app/widgets/customAppbar.dart';
import 'package:notes_app/widgets/custombottomsheet.dart';
import 'package:notes_app/widgets/note_tile.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomAppBar(
              action: Icons.event_note_rounded,
              title: 'My Notes',
              iconcolor: Colors.grey[600]!,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     category_tile(),
            //     category_tile(),
            //     category_tile(),
            //     category_tile(),
            //     category_tile(),
            //   ],
            // ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<NoteCubit, NoteState>(
                builder: (context, state) {
                  
                  return ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount:
                        state is NoteSucces ? state.noteslist.length : NoteSucces(Hive.box<Note>('notes').values.toList()).noteslist.length,
                    itemBuilder: (context, index) {
                      return noteTile(note: NoteSucces(Hive.box<Note>('notes').values.toList()).noteslist[index]);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return customBottomSheet();
                });
          },
          backgroundColor: bluecolor,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
          elevation: 5,
        ),
      ),
    );
  }
}
