import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class secondpage extends StatefulWidget {
  secondpage({Key? key,
    required this.Name,
    required this.Cr_name,
    required this.song,
    required this.image})
   : super(key: key);
  String Name = "";
  String Cr_name = "";
  String song = "";
  String image = "";

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool isPause = true;
  Duration? currentDuration;
  Duration? totalDuration;

  loadSong() async {
    await assetsAudioPlayer.open(
      Audio(widget.song),
    );

    setState(() {
      totalDuration = assetsAudioPlayer.current.value!.audio.duration;
    });
  }

  @override
  void initState() {
    super.initState();
    loadSong();
    currentDuration = const Duration(seconds: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      appBar: AppBar(
        title: Text("Playing"),
        backgroundColor: CupertinoColors.darkBackgroundGray,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
                opacity: 0.2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.image.toString()),
                ),
              ),
            ),
            Text(
              widget.Name,
              style: const TextStyle(
                  wordSpacing: 2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              widget.Cr_name,
              style: const TextStyle(
                  wordSpacing: 2,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    assetsAudioPlayer.stop();
                    setState(() {
                      isPause = false;
                    });
                  },
                  child: const Icon(
                    Icons.stop,
                    color: Colors.white,
                  ),
                ),
                (isPause == false)
                    ? InkWell(
                  onTap: () {
                    assetsAudioPlayer.open(
                      Audio(widget.song),
                    );
                    setState(() {
                      isPause = true;
                      currentDuration =
                          assetsAudioPlayer.currentPosition.value;
                      totalDuration =
                          assetsAudioPlayer.current.value!.audio.duration;
                    });
                  },
                  child: const Icon(
                    Icons.play_arrow,
                    size: 100,
                    color: Colors.white,
                  ),
                )
                    : InkWell(
                  onTap: () {
                    setState(() {
                      isPause = false;
                    });
                    assetsAudioPlayer.pause();
                  },
                  child: const Icon(
                    Icons.pause,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.headphones,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            StreamBuilder(
              stream: assetsAudioPlayer.currentPosition,
              builder: (context, AsyncSnapshot snapshot) {
                currentDuration = snapshot.data;

                return Column(
                  children: [
                    Slider(
                        activeColor: Colors.lightGreen,
                        thumbColor: Colors.lightGreen,
                        inactiveColor: Colors.grey,
                        min: 0,
                        max: totalDuration!.inSeconds.toDouble(),
                        value: currentDuration!.inSeconds.toDouble(),
                        onChanged: (val) {
                          setState(() {
                            currentDuration = Duration(seconds: val.toInt());
                            assetsAudioPlayer
                                .seek(Duration(seconds: val.toInt()));
                          });
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${currentDuration.toString().split(".")[0]}/${totalDuration.toString().split(".")[0]}",
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    assetsAudioPlayer.dispose();
  }
}


