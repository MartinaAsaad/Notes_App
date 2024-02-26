
import 'package:notes_app/models/note_model.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class Notesuccess2 extends NoteState {}


class NoteSucces extends NoteState {
 final List<Note> noteslist;

  NoteSucces(this.noteslist);
  
}

