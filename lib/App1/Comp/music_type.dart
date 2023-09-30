
import "package:assets_audio_player/assets_audio_player.dart";
import "package:audioplayers/audioplayers.dart";
import "package:flutter/material.dart";

//https://healingtreemusic.bandcamp.com/album/ambient-space-album-30-min
//https://soundcloud.com/user-23705108-488714399/30-minute-deep-sleep-music-calming-music-relaxing-music-soothing-music-calmi
//https://soundcloud.com/lofi_girl/compilation
//https://soundcloud.com/maifors/relaxing-with-chinese-bamboo-flute-guzheng-erhu-instrumental-music-collection
class MusicType extends StatefulWidget {
  MusicType({super.key, this.name, required this.onMusic});
  Function(String) onMusic;
  String? name;

  @override
  State<MusicType> createState() => _MusicTypeState();
}

class _MusicTypeState extends State<MusicType> {
  AudioPlayer audioPlayer = AudioPlayer();
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  String? currentSong;
  Future playMusic(String url) async {
      print("playMusic called with URL: $url, isPlaying: $isPlaying");

    if (isPlaying &&currentSong!=null) {
      print(url);
      await assetsAudioPlayer.stop();
      setState(() {
        currentSong = null;
        
        isPlaying = false;
      });
    } else {
      print(url);
      await assetsAudioPlayer.open(Audio(url), autoStart: true);
      
      setState(() {
        currentSong = url;
        isPlaying = true;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    assetsAudioPlayer.dispose();
  }

  bool isPlaying = true;
  bool isLoaded = false;
  String ok = "SoothingBreeze.mp3";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: PopupMenuButton(
        offset: Offset(50, 0),
        icon: Icon(
          Icons.queue_music_rounded,
          size: 30,
        ),
        onSelected: (value) async {
          if (value == "music1") {
            widget.onMusic("image5.jpg");
            await playMusic("Assets/SoothingBreeze.mp3");
          } else if (value == "music2") {
           await playMusic("Assets/deep.mp3");

            widget.onMusic("image2.jpg");
          } else if (value == "music3") {
           await playMusic("Assets/lofi.mp3");

            widget.onMusic("image3.jpg");
          } else if (value == "music4") {
           await playMusic("Assets/relax.mp3");
            widget.onMusic("image1.jpg");
          }
          else if(value == "music5"){

           await assetsAudioPlayer.stop();
          }
        },
        itemBuilder: (context) => <PopupMenuEntry<String>>[
          PopupMenuItem(
              value: "music1",
              child: Row(
                children: [Icon(Icons.music_note), Text("Ambient Music")],
              )),
          PopupMenuItem(
              value: "music2",
              child: Row(
                children: [
                  Icon(Icons.music_note),
                  Text("Deep Music"),
                ],
              )),
          PopupMenuItem(
              value: "music3",
              child: Row(children: [
                Icon(Icons.music_note),
                Text("Lofi Music"),
              ])),
          PopupMenuItem(
              value: "music4",
              child: Row(children: [
                Icon(Icons.music_note),
                Text("Relax Music"),
              ])),
              PopupMenuItem(
              value: "music5",
              child: Center(child: Text("NONE")))
        ],
      ),
    );
  }
}
