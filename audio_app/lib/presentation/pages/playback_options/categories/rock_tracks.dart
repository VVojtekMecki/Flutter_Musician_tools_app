import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/audio_library_controller.dart';
import '../../audio_player/audio_player_controller.dart';

class Rock extends StatelessWidget {
  const Rock({super.key});

  @override
  Widget build(BuildContext context) {
    final audioController = Get.find<AudioPlayerController>();
    final audioLibrary = Get.find<AudioLibraryController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rock'),
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
            const Text(
              "Rock tracks:",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40), // Add space below the text
            ElevatedButton(
              onPressed: () {
                audioController.setPath(audioLibrary.tracks["Rock"]!["Back in black"]!);
                Navigator.pushNamed(context, '/audioPlayer');
                audioController.playAudio();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                elevation: 4,
              ),
              child: const Text(
                "Back in black",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                audioController.setPath(audioLibrary.tracks["Rock"]!["Country rock'n'roll"]!);
                Navigator.pushNamed(context, '/audioPlayer');
                audioController.playAudio();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                elevation: 4,
              ),
              child: const Text(
                "Country rock'n'roll",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                audioController.setPath(audioLibrary.tracks["Rock"]!["Rock ballad in E"]!);
                Navigator.pushNamed(context, '/audioPlayer');
                audioController.playAudio();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                elevation: 4,
              ),
              child: const Text(
                "Rock ballad in E",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}