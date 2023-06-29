import 'package:get/get.dart';

import '../../controllers/audio_library_controller.dart';
import '../audio_player/audio_player_controller.dart';

class PlaybackOptionsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AudioLibraryController>(() => AudioLibraryController());
    Get.lazyPut<AudioPlayerController>(() => AudioPlayerController());
  }
}