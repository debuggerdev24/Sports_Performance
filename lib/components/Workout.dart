import 'package:flutter/material.dart';
import 'package:sportperformance/Components/VideoPlay.dart';
import 'package:sportperformance/Utils/utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Workout extends StatelessWidget {
  final String image;
  final String video;
  final String title;
  final double? width;
  final double? height;
  const Workout({
    required this.video,
    required this.image,
    required this.title,
    this.width,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    String videoUrl = video;
    String? videoId = YoutubePlayer.convertUrlToId(videoUrl);
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Utils.showMyDialog(
          context,
          VideoPlay(
            video: '',
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(15),
          //   child: Image.asset(
          //     "assets/images/session.PNG",
          //     fit: BoxFit.fill,
          //     width: size.width / 1.2,
          //     height: size.height / 4,
          //   ),
          // ),
          padding: EdgeInsets.zero,
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://img.youtube.com/vi/$videoId/maxresdefault.jpg',
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Text('Image not found'));
                },
                width: width ?? size.width / 1.5,
                height: height ?? size.height / 5.5,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
