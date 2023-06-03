import 'package:audioplayers/audioplayers.dart';

import '../core/assets/assets.dart';

splashAudio() async {
  final player = AudioPlayer();
  await player.play(AssetSource(Assets.mainAudioSplash));
}

homeAudio() async {
  final player = AudioPlayer();
  await player.play(AssetSource(Assets.homeAudio));
}
