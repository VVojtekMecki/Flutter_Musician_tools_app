import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import 'text_editing_controller.dart';

class TextEditor extends GetView<TextEditController> {
  // const TextEditor({super.key});
  const TextEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editorController = Get.find<TextEditController>();

    return Scaffold(
      body: Column(
        children: [
          QuillToolbar.basic(
            controller: editorController.quill,
          ),
          Expanded(
              child: Container(
                // color: Colors.red,
                child:
                QuillEditor.basic(
                    controller: editorController.quill,
                    readOnly: false,
                ),
              )
          )
        ],
      )
    );
  }

}