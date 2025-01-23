import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MyAudioPlayer extends StatefulWidget {
  @override
  _MyAudioPlayerState createState() => _MyAudioPlayerState();
}

class _MyAudioPlayerState extends State<MyAudioPlayer> {
  Duration? duration;
  Duration? position;

  late AudioPlayer audioPlayer;
  PlayerState playerState = PlayerState.stopped;

  get isPlaying => playerState == PlayerState.playing;
  get isPaused => playerState == PlayerState.paused;

  get durationText =>
      duration != null ? duration.toString().split('.').first : '';

  get positionText =>
      position != null ? position.toString().split('.').first : '';

  bool isMuted = false;
  bool isLoading = true;

  late StreamSubscription _positionSubscription;
  late StreamSubscription _audioPlayerStateSubscription;

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _audioPlayerStateSubscription.cancel();
    audioPlayer.stop();
    super.dispose();
  }
  var maxP;

  void initAudioPlayer() {
    audioPlayer = AudioPlayer();
    _positionSubscription = audioPlayer.onPositionChanged
        .listen((p) => setState(() => position = p));
    maxP = audioPlayer.getDuration();
    _audioPlayerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((s) {
          if (s == PlayerState.playing) {
            audioPlayer.getDuration().then((value) {
              duration = value;
              setState(() {});
              print("Hello change state");
            });
          } else if (s == PlayerState.stopped) {
            onComplete();
            position = duration;
            setState(() {});
          }
          else if (s == PlayerState.completed) {
            Navigator.pop(context);
            onComplete();
          }
        }, onError: (msg) {
          playerState = PlayerState.stopped;
          duration = const Duration(seconds: 0);
          position = const Duration(seconds: 0);
          setState(() {});
        });
  }

  Future play() async {
    isLoading = true;
    setState(() {});
    await audioPlayer.play(UrlSource(
        "https://www.mediacollege.com/downloads/sound-effects/nature/forest/rainforest-ambient.mp3"));
    playerState = PlayerState.playing;
    isLoading = false;
    setState(() {});
    print("Hello play pressed");
  }

  Future pause() async {
    await audioPlayer.pause();
    setState(() => playerState = PlayerState.paused);
  }

  Future stop() async {
    await audioPlayer.stop();
    setState(() {
      playerState = PlayerState.stopped;
      position = const Duration();
    });
  }

  Future mute(bool muted) async {
    if (muted) {
      await audioPlayer.setVolume(0);
    } else {
      await audioPlayer.setVolume(30);
    }
    setState(() {
      isMuted = muted;
    });
  }

  void onComplete() {
    setState(() => playerState = PlayerState.stopped);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: [
          IconButton(
            onPressed: isPlaying ? null : () => play(),
            iconSize: size.width * 0.1,
            icon: const Icon(Icons.play_arrow),
            color: Colors.cyan,
          ),
          IconButton(
            onPressed: isPlaying ? () => pause() : null,
            iconSize: size.width * 0.1,
            icon: Icon(Icons.pause),
            color: Colors.cyan,
          ),
          IconButton(
            onPressed: isPlaying || isPaused ? () => stop() : null,
            iconSize: size.width * 0.1,
            icon: Icon(Icons.stop),
            color: Colors.cyan,
          ),
        ]),
        Slider(
          value: position?.inMilliseconds.toDouble() ?? 0.0,
          onChanged: (double value) {
            audioPlayer.seek(Duration(milliseconds: value ~/ 1000));
          },
          min: 0.0,
          max: duration != null ? duration!.inMilliseconds.toDouble() : 50,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: CircularProgressIndicator(
              value: position != null && position!.inMilliseconds > 0
                  ? (position?.inMilliseconds.toDouble() ?? 0.0) /
                  (duration?.inMilliseconds.toDouble() ?? 0.0)
                  : 0.0,
              valueColor: AlwaysStoppedAnimation(Colors.cyan),
              backgroundColor: Colors.grey.shade400,
            ),
          ),
          Text(
            position != null
                ? "${positionText ?? ''} / ${durationText ?? ''}"
                : duration != null
                ? durationText
                : '',
            style: TextStyle(fontSize: size.width * 0.04),
          )
        ]),
      ],
    );
  }
}
