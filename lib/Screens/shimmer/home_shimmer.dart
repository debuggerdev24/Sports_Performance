import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          // FadeShimmer(
          //   height: 8,
          //   radius: 15,
          //   width: size.width / 4,
          //   baseColor: Colors.grey.shade500,
          //   highlightColor: Colors.grey.shade300,
          // ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer(
                height: 8,
                radius: 15,
                width: size.width / 3,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              FadeShimmer(
                height: 8,
                radius: 15,
                width: size.width / 4,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
            ],
          ),
          const SizedBox(height: 20),
          FadeShimmer(
            radius: 15,
            width: size.width,
            height: size.height / 4,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 25),
          // FadeShimmer(
          //   height: 8,
          //   radius: 15,
          //   width: size.width / 4,
          //   baseColor: Colors.grey.shade500,
          //   highlightColor: Colors.grey.shade300,
          // ),
          // const SizedBox(height: 25),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Wrap(
          //     spacing: 15,
          //     children: List.generate(
          //       5,
          //       (index) => FadeShimmer(
          //         radius: 15,
          //         height: size.width / 4,
          //         width: size.width / 4,
          //         baseColor: Colors.grey.shade500,
          //         highlightColor: Colors.grey.shade300,
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(height: 25),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width / 4,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer(
                radius: 15,
                height: size.width / 3,
                width: size.width / 2.4,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              FadeShimmer(
                radius: 15,
                height: size.width / 3,
                width: size.width / 2.4,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
            ],
          ),
          // const SizedBox(height: 25),
          // FadeShimmer(
          //   height: 8,
          //   radius: 15,
          //   width: size.width / 4,
          //   baseColor: Colors.grey.shade500,
          //   highlightColor: Colors.grey.shade300,
          // ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer(
                radius: 15,
                height: size.width / 3,
                width: size.width / 2.4,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              FadeShimmer(
                radius: 15,
                height: size.width / 3,
                width: size.width / 2.4,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
            ],
          ),
          // const SizedBox(height: 25),
          // FadeShimmer(
          //   height: 8,
          //   radius: 15,
          //   width: size.width / 4,
          //   baseColor: Colors.grey.shade500,
          //   highlightColor: Colors.grey.shade300,
          // ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer(
                radius: 15,
                height: size.width / 3,
                width: size.width / 2.4,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              FadeShimmer(
                radius: 15,
                height: size.width / 3,
                width: size.width / 2.4,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
            ],
          ),
          const SizedBox(height: 25),
          FadeShimmer(
            height: 8,
            radius: 15,
            width: size.width / 4,
            baseColor: Colors.grey.shade500,
            highlightColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer.round(
                size: 70,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 10),
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 3,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 15),
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 60,
            height: 45,
            child: VerticalDivider(thickness: 3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeShimmer.round(
                size: 70,
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.grey.shade300,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 10),
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 3,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 15),
                    FadeShimmer(
                      height: 8,
                      radius: 15,
                      width: size.width / 4,
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
