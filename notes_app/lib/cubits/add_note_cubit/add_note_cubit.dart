import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  AddNote(Note note)async {
    emit(AddNoteLoading());
    try {
      var notesbox = Hive.box<Note>('notes');
      await notesbox.add(note);
      emit(AddNoteSucces());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
