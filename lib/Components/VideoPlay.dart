import 'dart:developer';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Models/PlannigModel.dart';

class VideoPlay extends StatefulWidget {
  //late PlanningModel planningModel;
  String? video;
  @override
  VideoPlay({required this.video});

  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  bool fullScreen = false;
  @override
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.video.toString(),
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )
      ..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return YoutubePlayer(controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blueAccent,
      onReady: () {
        setState(() {
          _isPlayerReady = !_isPlayerReady;
        });
      },
    );
    // return BetterPlayer.network(
    //   '${widget.video}.mp4' ?? "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    //   betterPlayerConfiguration: BetterPlayerConfiguration(
    //     aspectRatio: (size.width / 1.2) / (size.height / 4),
    //     autoPlay: true,
    //     fit: BoxFit.fill,
    //     expandToFill: false,
    //     fullScreenAspectRatio: size.width / size.height,
    //     controlsConfiguration: BetterPlayerControlsConfiguration(
    //       controlsHideTime: Duration(microseconds: 500),
    //       showControlsOnInitialize: false,
    //       controlBarColor: Colors.black12,
    //       enableOverflowMenu: false,
    //       enableFullscreen: true,
    //       enableQualities: false,
    //       enablePip: false,
    //       enableSkips: false,
    //       enableSubtitles: false,
    //     ),
    //   ),
    // );
  }
}
