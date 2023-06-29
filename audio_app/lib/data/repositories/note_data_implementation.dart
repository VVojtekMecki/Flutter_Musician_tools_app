import 'dart:convert';

import 'package:audio_app/data/models/note.dart';
import 'package:audio_app/domain/repositories/note_data.dart';
import 'package:get_storage/get_storage.dart';

class NoteDataImplementation extends NoteData {

  final GetStorage _storage = GetStorage();
  //notes key
  final String userNotes = 'userNotes';


  void printValues(){
    print(_storage.getValues());
  }


  @override
  void addNewNote(Note aNote, List<Note> aList) {
    if (!aList.contains(aNote)){
      aList.add(aNote);
      syncStorage(aList);
    }
  }

  @override
  void deleteNote(Note aNote, List<Note> aList) {
    if (aList.contains(aNote)){
      aList.remove(aNote);
      syncStorage(aList);
    }
  }

  // @override
  // Future<List<Note>> getAllNotes() async {
  //   var values = _storage.read(userNotes) ?? [];
  //   return List<Note>.from(values);
  // }
  @override
  Future<List<Note>> getAllNotes() async {
    final jsonEncodedNotes = _storage.read(userNotes);
    if (jsonEncodedNotes != null) {
      final List<dynamic> decodedNotes = jsonDecode(jsonEncodedNotes);
      return decodedNotes.map((noteMap) => Note(
        id: noteMap['id'],
        text: noteMap['text'],
      )).toList();
    } else {
      return [];
    }
  }

  @override
  void updateNote(Note aNote, String aText, List<Note> allNotes) {
    for (int i=0; i<allNotes.length; i++ ){
      if (allNotes[i].id == aNote.id){
        allNotes[i].text = aText;
      }
    }
    syncStorage(allNotes);
    //testing
    syncLocalNotes(allNotes);
  }

  void syncLocalNotes(List<Note> aList) async {
    List<Note> notes = await getAllNotes();
    aList.clear();
    aList.addAll(notes);
  }

  // void syncStorage(List<Note> aList) async {
  //   await _storage.write(userNotes, aList);
  // }
  void syncStorage(List<Note> aList) async {
    final encodedNotes = aList.map((note) => {
      'id': note.id,
      'text': note.text,
    }).toList();
    final jsonEncodedNotes = jsonEncode(encodedNotes);
    print(jsonEncodedNotes);
    await _storage.write(userNotes, jsonEncodedNotes);
    print(_storage.hasData(userNotes));
  }
}