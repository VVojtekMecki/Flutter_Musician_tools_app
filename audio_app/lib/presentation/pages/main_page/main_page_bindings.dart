import 'package:get/get.dart';

import '../../../data/repositories/note_data_implementation.dart';
import '../../controllers/audio_library_controller.dart';
import '../audio_player/audio_player_controller.dart';
import '../notes/notes_controller.dart';
import '../settings_page/settings_controller.dart';
import '../text_editing/text_editing_controller.dart';

class MainPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AudioPlayerController>(AudioPlayerController());
    Get.put<AudioLibraryController>(AudioLibraryController());
    Get.put<NotesController>(NotesController(Get.find<NoteDataImplementation>()));
    Get.put<TextEditController>(TextEditController());
    Get.put<SettingsController>(SettingsController());
  }
}
