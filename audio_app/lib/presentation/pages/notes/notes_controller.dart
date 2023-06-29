import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/note.dart';
import '../../../data/repositories/note_data_implementation.dart';

class NotesController extends GetxController {
  final NoteDataImplementation _noteData;

  final RxList<Note> notesList = RxList<Note>();

  NotesController(this._noteData);

  @override
  void onInit() {
    super.onInit();
    _noteData.syncLocalNotes(notesList);
  }

  Future<List<Note>> getAllNotes(){
    return _noteData.getAllNotes();
  }

  void addNewNote(Note aNote, List<Note> aList){
    _noteData.addNewNote(aNote, aList);
  }

  void updateNote(Note aNote, String aText, List<Note> allNotes){
    _noteData.updateNote(aNote, aText, allNotes);
  }

  void deleteNote(Note aNote, List<Note> aList){
    _noteData.deleteNote(aNote, aList);
  }


}