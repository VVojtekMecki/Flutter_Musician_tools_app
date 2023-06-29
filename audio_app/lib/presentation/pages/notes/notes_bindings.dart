import 'package:audio_app/data/repositories/note_data_implementation.dart';
import 'package:get/get.dart';

import '../text_editing/text_editing_controller.dart';
import 'notes_controller.dart';

class NotesBindings extends Bindings {
  @override
  void dependencies() {
    Get.find<NotesController>();
    Get.find<NoteDataImplementation>();
    Get.find<TextEditController>();
  }
}