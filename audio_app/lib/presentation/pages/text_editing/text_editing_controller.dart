import 'package:audio_app/presentation/pages/notes/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import '../../../data/models/note.dart';

class TextEditController extends GetxController {
  final notesController = Get.find<NotesController>();

  QuillController quill =  QuillController.basic();
  Note note = Note(id: 0, text: "");
  bool isNew = true;

  void editorSetup(Note aNote, bool aIsNew){
    note = aNote;
    isNew = aIsNew;
  }

  void editorReset(){
    note = Note(id: 0, text: "");
    isNew = true;
    quill.clear();
  }

  @override
  void onInit(){
    super.onInit();
    loadExistingNote();
  }

  void loadExistingNote(){
    final doc = Document()..insert(0, note.text);
    quill = QuillController(document: doc, selection: const TextSelection.collapsed(offset: 0));
  }

  void addNewNote(){
    String text = quill.document.toPlainText();
    notesController.addNewNote(Note(id: notesController.notesList.length, text: text), notesController.notesList);
  }

  void updateNote(){
    String text = quill.document.toPlainText();
    notesController.updateNote(note, text, notesController.notesList);
  }

}