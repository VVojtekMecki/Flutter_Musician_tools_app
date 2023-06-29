import 'package:audio_app/presentation/pages/audio_player/audio_player_controller.dart';
import 'package:audio_app/presentation/pages/main_page/main_page.dart';
import 'package:audio_app/presentation/pages/main_page/main_page_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'playback_options_bindings.dart';

class PlaybackOptions extends StatelessWidget {
  const PlaybackOptions({super.key});

  @override
  Widget build(BuildContext context) {
    // final settingsController = Get.find<SettingsController>();
    final audioPlayer = Get.find<AudioPlayerController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Playback main page'),
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
              "Currently playing:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => ElevatedButton(
              onPressed: audioPlayer.isPlaying.value
                  ? () {
                Navigator.pushNamed(context, '/audioPlayer');
              }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                elevation: 4,
              ),
              child: Text(
                audioPlayer.isPlaying.value ? 'Currently playing' : 'No audio available',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            )),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/playback/jazz');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                elevation: 4,
              ),
              child: const Text(
                "Jazz",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/playback/rock');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                elevation: 4,
              ),
              child: const Text(
                "Rock",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 16), // Add space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/playback/blues');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                elevation: 4,
              ),
              child: const Text(
                "Blues",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/playback/reggae');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                elevation: 4, // Add a shadow to the button
                // Add any other custom styles you prefer
              ),
              child: const Text(
                "Reggae",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Add your own tracks to the player!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16), // Add space between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/playback/user_tracks');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                elevation: 4,
              ),
              child: const Text(
                "My own tracks",
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
