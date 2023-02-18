import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tiktok/Screen/Provider/VideoProvider.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoProvider? providerTrue;
  VideoProvider? providerFalse;

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      Provider.of<VideoProvider>(context, listen: false).loadVideo();
    }

    providerTrue = Provider.of<VideoProvider>(context, listen: true);
    providerFalse = Provider.of<VideoProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: Text("Video Player"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: ListView.builder(
              itemCount: providerTrue!.video_data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      providerTrue!.changepath(index);
                      Navigator.pushNamed(
                        context,
                        "vi",
                      );
                      // Chewie(
                      //   controller: providerTrue!.chewieController!,
                      // );
                    },
                    child: Container(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.asset(
                              "${providerFalse!.video_data[index].image}",
                              width: double.infinity,
                              height: double.infinity,
                              cacheHeight: 200,
                              cacheWidth: 350,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 150,right: 230),
                            child: Center(
                              child: Text(
                                "${providerFalse!.video_data[index].name}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          // IconButton(
                          //     onPressed: () {
                          //       // providerTrue!.all_video[index];
                          //     },
                          //     icon: Icon(Icons.play_arrow))
                        ],
                      ),
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )

          // Center(
          //   child: Text("hello"),
          // )

          //     Container(
          //   child: Chewie(
          //     controller: providerTrue!.chewieController!,
          //   ),
          // ),
          ),
    );
  }
}
