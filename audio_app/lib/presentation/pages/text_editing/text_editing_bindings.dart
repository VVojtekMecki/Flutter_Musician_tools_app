import 'package:audio_app/data/repositories/note_data_implementation.dart';
import 'package:audio_app/presentation/pages/notes/notes_controller.dart';
import 'package:get/get.dart';
import 'text_editing_controller.dart';

class TextEditingBindings extends Bindings {
  @override
  void dependencies() {
    Get.find<TextEditController>();
    Get.find<NotesController>();
  }
}