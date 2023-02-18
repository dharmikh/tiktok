import 'package:chewie/chewie.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/Screen/Modal/videoModal.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier {
  List all_video = [
    "assets/video/khajurbhai.mp4",
    "assets/video/spiderman.mp4",
    "assets/video/videoplay.mp4",
  ];
  List<videoModal> video_data = [
    videoModal(
        image: "assets/image/khajurbhai.jpg",
        name: "#funny",
        video: "assets/video/khajurbhai.mp4"),
    videoModal(
        image: "assets/image/spiderwoman.webp",
        name: "🤣🤣😂",
        video: "assets/video/spiderman.mp4"),
    videoModal(
        image: "assets/image/devang.jpeg",
        name: "🤟🤟🤟",
        video: "assets/video/videoplay.mp4"),
  ];

  int? index;

  void changepath(ind) {
    index = ind;
    notifyListeners();
  }

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  void loadVideo() {
    videoPlayerController = VideoPlayerController.asset('${all_video[index!]}')
      ..initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: false,
    );
  }
}
