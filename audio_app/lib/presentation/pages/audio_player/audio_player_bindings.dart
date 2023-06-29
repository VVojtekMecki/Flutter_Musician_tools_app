

import 'package:get/get.dart';

import 'audio_player_controller.dart';

class AudioPlayerBindings extends Bindings {
  @override
  void dependencies() {
    Get.find<AudioPlayerController>();
  }
}