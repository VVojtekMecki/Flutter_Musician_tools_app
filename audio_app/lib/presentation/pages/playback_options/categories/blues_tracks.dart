import 'package:audio_app/presentation/controllers/audio_library_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../audio_player/audio_player_controller.dart';

class Blues extends StatelessWidget {
  const Blues({super.key});

  @override
  Widget build(BuildContext context) {
    final audioController = Get.find<AudioPlayerController>();
    final audioLibrary = Get.find<AudioLibraryController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blues'),
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
              "Blues tracks:",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40), // Add space below the text
            ElevatedButton(
              onPressed: () {
                audioController.setPath(audioLibrary.tracks["Blues"]!["Shuffle G7"]!);
                Navigator.pushNamed(context, '/audioPlayer');
                audioController.playAudio();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                elevation: 4,
              ),
              child: const Text(
                "Shuffle G7",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                audioController.setPath(audioLibrary.tracks["Blues"]!["Thrill is gone"]!);
                Navigator.pushNamed(context, '/audioPlayer');
                audioController.playAudio();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                elevation: 4,
              ),
              child: const Text(
                "Thrill is gone",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                audioController.setPath(audioLibrary.tracks["Blues"]!["Smooth D minor blues"]!);
                Navigator.pushNamed(context, '/audioPlayer');
                audioController.playAudio();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                elevation: 4,
              ),
              child: const Text(
                "Smooth D minor blues",
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