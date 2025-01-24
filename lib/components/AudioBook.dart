import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sportperformance/Components/AudioPlayer.dart';
import 'package:sportperformance/Utils/utils.dart';
import 'package:sportperformance/extensions/context_extension.dart';

class AudioBook extends StatelessWidget {

  final int index;
  AudioBook({super.key, required this.index});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Utils.showMyDialog(context, MyAudioPlayer());
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: const [
              CircleAvatar(
                radius: 31,
                backgroundColor: Colors.black,
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/audioBook.png"),
              ),
            ],
          ),
          Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${context.translator.audioBookChapter1} ${index + 1}",
                  // translator.getString("AudioBook.chapter1"),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
