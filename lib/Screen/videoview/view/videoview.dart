import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/Screen/Provider/VideoProvider.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  VideoProvider? providerTrue;
  VideoProvider? providerFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<VideoProvider>(context, listen: false).loadVideo();
  }

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<VideoProvider>(context, listen: true);
    providerFalse = Provider.of<VideoProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Chewie(
          controller: providerTrue!.chewieController!,
        ),
      ),
    );
  }

  @override
  void dispose() {
    providerFalse!.chewieController!.pause();
    super.dispose();
  }
}
