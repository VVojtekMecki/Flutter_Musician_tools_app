
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioPlayerController extends GetxController {
  final RxString path = "".obs;

  // final DeviceFileSource audioPath;
  final AudioPlayer audioPlayer = AudioPlayer();
  final RxBool isPlaying = false.obs;
  Duration? aRuntime;

  // @override
  // void onInit() {
  //   super.onInit();
  //   this.audioPath.path = path;
  // }

  @override
  void onInit() {
    super.onInit();
    path.value = "";
  }

  @override
  void onClose() {
    audioPlayer.stop();
    audioPlayer.release();
    super.onClose();
  }

  void setPath(String aPath) {
    path.value = aPath;
  }

  Future<void> playAudio() async {
    stopAudio();
    DeviceFileSource audioSource = DeviceFileSource(path.value);
    await audioPlayer.play(audioSource);
    aRuntime = await audioPlayer.getCurrentPosition();
    isPlaying.value = true;
    print("play");
    print(aRuntime);
  }

  Future<void> pauseAudio() async {
    aRuntime = await audioPlayer.getCurrentPosition();
    await audioPlayer.pause();
    isPlaying.value = false;
    print("pause");
    print(aRuntime);
  }

  Future<void> resumeAudio() async {
    // if (aRuntime != null) {
    // }
    if (isPlaying.value == false){
      // print("resume debug start");
      aRuntime = await audioPlayer.getCurrentPosition();
      // print(aRuntime);
      await audioPlayer.seek(aRuntime!);
      // print(aRuntime);
      await audioPlayer.resume();
      isPlaying.value = true;
      print("resume");
      print(aRuntime);
    }
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
    isPlaying.value = false;
    // aRuntime = await audioPlayer.getCurrentPosition();
    print("stop");
    print(aRuntime);
  }
}
