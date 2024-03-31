import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:video_url_validator/video_url_validator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPresentation extends StatefulWidget {
  const VideoPresentation({super.key});

  @override
  State<VideoPresentation> createState() => _VideoPresentationState();
}

class _VideoPresentationState extends State<VideoPresentation> {
  late YoutubePlayerController controller;
  late String youtubPath = "https://www.youtube.com/watch?v=8A2t_tAjMz8";
  var validator = VideoURLValidator();
  late bool validatorStatus =
      validator.validateYouTubeVideoURL(url: youtubPath);
  @override
  void initState() {
    if (validatorStatus == true) {
      controller = YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(youtubPath)!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("วีดีโอแนะนำตัว"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (validatorStatus == true)
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: YoutubePlayer(
                        controller: controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.amber,
                        progressColors: const ProgressBarColors(
                            playedColor: Colors.amber,
                            handleColor: Colors.amberAccent),
                      ),
                    ),
                  ),
                if (validatorStatus == false) const Text("ไม่มีวีดีโอนี้")
              ],
            ),
          ),
        ));
  }
}
