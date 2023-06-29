
import '../../data/models/note.dart';

abstract class NoteData {

  //get notes
  Future<List<Note>> getAllNotes();

  //add new note
  void addNewNote(Note aNote, List<Note> aList);

  //update
  void updateNote(Note aNote, String aText, List<Note> allNotes);

  //delete
  void deleteNote(Note aNote, List<Note> aList);
}