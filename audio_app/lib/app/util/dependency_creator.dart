
import 'package:audio_app/data/repositories/note_data_implementation.dart';
import 'package:get/get.dart';

import '../../domain/repositories/note_data.dart';

/// Class to create dependencies for the app.
class DependencyCreator {
  /// Initialize all dependencies
  static init() {
    Get.lazyPut<NoteDataImplementation>(() => NoteDataImplementation());
  }
}
