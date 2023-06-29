import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/note.dart';
import 'notes_controller.dart';
import '../text_editing/text_editing_controller.dart';

class Notes extends StatelessWidget {
  // const Notes() : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notesController = Get.find<NotesController>();
    final editingController = Get.find<TextEditController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes main page'),
        actions: [
          IconButton(
              onPressed: ()
              {Navigator.pushNamed(context, '/');},
              icon: const Icon(Icons.home)
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Notes",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    editingController.editorSetup(Note(id: notesController.notesList.length, text: ""), true);
                    Navigator.pushNamed(context, '/notes/text_editing');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Create new note', style: TextStyle(fontSize: 20)),
                  ),
                ),
                SizedBox(width: 34),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Back', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                    () => ListView.builder(
                  itemCount: notesController.notesList.length,
                  itemBuilder: (context, index) {
                    final Note note = notesController.notesList[index];

                    return ListTile(
                      title: Text(note.text, style: const TextStyle(fontSize: 20)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              editingController.editorSetup(note, false);
                              editingController.loadExistingNote();
                              Navigator.pushNamed(context, '/notes/text_editing');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              notesController.deleteNote(note, notesController.notesList);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}