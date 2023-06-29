import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/audio_library_controller.dart';
import '../../audio_player/audio_player_controller.dart';

class UserTracks extends StatelessWidget {
  const UserTracks({super.key});

  @override
  Widget build(BuildContext context) {
    final audioController = Get.find<AudioPlayerController>();
    final audioLibrary = Get.find<AudioLibraryController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Play along your songs'),
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
              "My tracks:",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                audioController.setPath(audioLibrary.tracks["Play along songs"]!["Moon River"]!);
                Navigator.pushNamed(context, '/audioPlayer');
                audioController.playAudio();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                elevation: 4,
              ),
              child: const Text(
                "Moon River",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                audioController.setPath(audioLibrary.tracks["Play along songs"]!["Easy"]!);
                Navigator.pushNamed(context, '/audioPlayer');
                audioController.playAudio();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                elevation: 4,
              ),
              child: const Text(
                "Easy",
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