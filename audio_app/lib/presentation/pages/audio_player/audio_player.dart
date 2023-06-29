import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/audio_library_controller.dart';
import 'audio_player_controller.dart';

class AudioPlayerWidget extends GetView<AudioPlayerController> {
  const AudioPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final audioLibrary = Get.find<AudioLibraryController>();
    final audioPlayer = Get.find<AudioPlayerController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            audioLibrary.getTitle(audioPlayer.path.value),
            style: const TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => ElevatedButton(
                onPressed: () {
                  if (controller.isPlaying.value) {
                    controller.pauseAudio();
                  } else {
                    if (controller.aRuntime != null) {
                      controller.resumeAudio();
                    } else {
                      controller.playAudio();
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadowColor: Colors.black.withOpacity(0.2),
                ),
                child: Text(
                  controller.isPlaying.value ? 'Pause' : 'Play',
                  style: const TextStyle(fontSize: 16),
                ),
              )),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: (){
                  controller.playAudio();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadowColor: Colors.black.withOpacity(0.2),
                ),
                child: const Text(
                  'Restart',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 100),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("My notes", style: TextStyle(fontSize: 20, color: Colors.grey),),
        ),
        ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, '/notes');
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(16),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            shadowColor: Colors.black.withOpacity(0.2),
          ),
          child: const Text(
            'Notes',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
