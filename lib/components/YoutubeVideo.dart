import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideo extends StatefulWidget {
  final String video;
  final bool showControl;
  final Function()? enterFullScreen;
  final Function()? exitFullScreen;

  const YoutubeVideo(
    this.video,
    this.showControl, {
    this.enterFullScreen,
    this.exitFullScreen,
  });
  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  late YoutubePlayerController _controller;
  late String videoId;
  bool fullScreen = false;

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.video).toString();
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: widget.showControl == true ? true : false,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
        showLiveFullscreenButton: false,
        hideControls: widget.showControl == true ? false : true,
        hideThumbnail: widget.showControl == true ? false : true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: fullScreen
          ? size.width / size.height
          : (size.width / 1.2) / (size.height / 4),
      child: YoutubePlayerBuilder(
        onEnterFullScreen: () {
          fullScreen = true;
          setState(() {});
        },
        onExitFullScreen: () {
          fullScreen = false;
          setState(() {});
        },
        player: YoutubePlayer(
          controller: _controller,
          aspectRatio: (size.width / 1.2) / (size.height / 4),
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
        ),
        builder: (context, player) {
          return player;
        },
      ),
    );
  }
}
