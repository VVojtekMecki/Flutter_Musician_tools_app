import 'package:audio_app/app/util/dependency_creator.dart';
import 'package:audio_app/presentation/pages/main_page/main_page.dart';
import 'package:audio_app/presentation/pages/main_page/main_page_bindings.dart';
import 'package:audio_app/presentation/pages/settings_page/settings_page.dart';
import 'package:audio_app/presentation/pages/settings_page/settings_page_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repositories/note_data_implementation.dart';
import 'presentation/pages/audio_player/audio_player_bindings.dart';
import 'presentation/pages/audio_player/audio_player_page.dart';
import 'presentation/pages/notes/notes_controller.dart';
import 'presentation/pages/notes/notes_page.dart';
import 'presentation/pages/notes/notes_bindings.dart';
import 'presentation/pages/playback_options/categories/blues_tracks.dart';
import 'presentation/pages/playback_options/categories/jazz_tracks.dart';
import 'presentation/pages/playback_options/categories/reggae_tracks.dart';
import 'presentation/pages/playback_options/categories/rock_tracks.dart';
import 'presentation/pages/playback_options/categories/user_tracks.dart';
import 'presentation/pages/playback_options/playback_options.dart';
import 'presentation/pages/playback_options/playback_options_bindings.dart';
import 'presentation/pages/text_editing/text_editing_bindings.dart';
import 'presentation/pages/text_editing/text_editing_page.dart';

void main() async {
  await GetStorage.init();

  DependencyCreator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal.shade200),
        // useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const MainScreen(),
          transition: Transition.fadeIn,
          binding: MainPageBindings(),
        ),
        GetPage(
          name: '/settings',
          page: () => const SettingsPage(),
          transition: Transition.fadeIn,
          binding: SettingsPageBindings(),
        ),
        GetPage(
          name: '/playback',
          page: () => const PlaybackOptions(),
          transition: Transition.fadeIn,
          binding: PlaybackOptionsBindings(),
        ),
        GetPage(
          name: '/playback/jazz',
          page: () => const Jazz(),
          transition: Transition.fadeIn,
          binding: PlaybackOptionsBindings(),
        ),
        GetPage(
          name: '/playback/rock',
          page: () => const Rock(),
          transition: Transition.fadeIn,
          binding: PlaybackOptionsBindings(),
        ),
        GetPage(
          name: '/playback/blues',
          page: () => const Blues(),
          transition: Transition.fadeIn,
          binding: PlaybackOptionsBindings(),
        ),
        GetPage(
          name: '/playback/reggae',
          page: () => const Reggae(),
          transition: Transition.fadeIn,
          binding: PlaybackOptionsBindings(),
        ),
        GetPage(
          name: '/playback/user_tracks',
          page: () => const UserTracks(),
          transition: Transition.fadeIn,
          binding: PlaybackOptionsBindings(),
        ),
        GetPage(
          name: '/notes',
          page: () => Notes(),
          transition: Transition.fadeIn,
          binding: NotesBindings(),
        ),
        GetPage(
          name: '/notes/text_editing',
          page: () => const TextEditingPage(),
          transition: Transition.fadeIn,
          binding: TextEditingBindings(),
        ),
        GetPage(
          name: '/audioPlayer',
          page: () => const AudioPlayerPage(),
          transition: Transition.fadeIn,
          binding: AudioPlayerBindings(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
