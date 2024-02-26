import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/cubits/note_cubit/note_state.dart';
import 'package:notes_app/models/note_model.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  FetchAll() {

      var notesbox = Hive.box<Note>('notes');
      print(notesbox.values.toList());
      emit(Notesuccess2());


   
  }
}
