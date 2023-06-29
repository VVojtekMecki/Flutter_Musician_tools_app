import 'package:audio_app/presentation/pages/text_editing/text_editor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text_editing_controller.dart';

class TextEditingPage extends StatelessWidget {
  // const TextEditingPage({super.key});
  const TextEditingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editingController = Get.find<TextEditController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm or cancel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (editingController.isNew == true){
                editingController.addNewNote();
              }
              else {
                editingController.updateNote();
              }
              Get.back();
              editingController.editorReset();
            },
          ),
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              Get.back();
              editingController.editorReset();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: TextEditor()
            ),
          ],
        ),
      ),
    );
  }
}