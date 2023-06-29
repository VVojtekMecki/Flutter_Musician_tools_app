import 'dart:collection';
import 'package:get/get.dart';

class AudioLibraryController extends GetxController {
  final Map<String, Map<String, String>> tracks = {
    "Jazz" : {
      "All of me": "assets/sounds/All_of_Me_180_bpm.mp3",
      "Autumn leaves": "assets/sounds/Autumn_leaves_120_bpm.mp3",
      "Summertime": "assets/sounds/Summertime_Jazz_Ballad_feel_70_bpm.mp3"
    },
    "Rock" : {
      "Back in black": "assets/sounds/Back_in_Black_ACDC.mp3",
      "Country rock'n'roll": "assets/sounds/Country_Rock_in_A.mp3",
      "Rock ballad in E": "assets/sounds/Rock_ballad_E.mp3"
    },
    "Blues" : {
      "Shuffle G7": "assets/sounds/Blues_Shuffle_in_G.mp3",
      "Thrill is gone": "assets/sounds/Thrill_is_Gone_BB_King.mp3",
      "Smooth D minor blues": "assets/sounds/Smooth_D_Minor_Blues.mp3"
    },
    "Reggae" : {
      "Reggae in D minor": "assets/sounds/Reggae_in_Dm.mp3"
    },
    "Play along songs": {
      "Moon River" : "assets/sounds/Audrey_Hepburn_Moon_River.mp3",
      "Easy" : "assets/sounds/The_Commodores_Easy.mp3"
    }
  };

  String getTitle(String path){
    for (var mapEntry in tracks.entries) {
      var childMap = mapEntry.value;
      for (var childEntry in childMap.entries) {
        if (childEntry.value == path) {
          return childEntry.key;
        }
      }
    }
    return "Unknown song name";
  }
}