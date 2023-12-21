import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_a2h/application/list_videos/list_video_bloc.dart';
import 'package:video_player_a2h/application/screen_player/screen_player_bloc.dart';
import 'package:video_player_a2h/core/common/duration_format.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<ScreenPlayerBloc>(context).add(Dispose());
        BlocProvider.of<ListVideoBloc>(context).add(ShowVideoList());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Video Playing'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.white])),
          child: BlocBuilder<ScreenPlayerBloc, ScreenPlayerState>(
            builder: (context, state) {
              if (state.controller != null) {
                state.controller!.addListener(() {
                  BlocProvider.of<ScreenPlayerBloc>(context).add(
                      UpdateVideoPosition(
                          time: state.controller!.value.position.inSeconds
                              .toDouble()));
                });
                //---------------------------------------------duration format parsing
                Duration currentduration =
                    CustomDurationParse.parseVideoDuration(
                        state.controller!.value.position.toString());
                Duration tDuration = CustomDurationParse.parseVideoDuration(
                    state.controller!.metadata.duration.toString());

                String showduration =
                    CustomDurationParse.formatVideoDuration(currentduration);
                String totalduration =
                    CustomDurationParse.formatVideoDuration(tDuration);

                //-------------------------------------------------------------------
                return Column(
                  children: [
                    // Container(
                    //   height: 10,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controlsTimeOut: const Duration(seconds: 0),
                            onReady: () {
                              BlocProvider.of<ScreenPlayerBloc>(context)
                                  .add(PlayerReady());
                            },
                            onEnded: (metaData) {
                              BlocProvider.of<ScreenPlayerBloc>(context)
                                  .add(PauseVideo());
                            },
                            controller: state.controller!,
                          ),
                          builder: (context, player) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                //-------------------------------------------------------video title
                                SizedBox(
                                    width: double.maxFinite,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        state.videoTile!,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                                const SizedBox(
                                  height: 28,
                                ),
                                //----------------------------------------------video player
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(child: player)),
                                const SizedBox(
                                  height: 40,
                                ),
                                //-----------------------------------------------seek bar
                                Slider(
                                  value: state.currentVideoPosition,
                                  min: 0.0,
                                  thumbColor: Colors.blue[900],
                                  activeColor: Colors.blue[900],
                                  max: state
                                      .controller!.metadata.duration.inSeconds
                                      .toDouble(),
                                  onChanged: (value) {
                                    //----------------------------------------- Seek to the selected position in the video
                                    BlocProvider.of<ScreenPlayerBloc>(context)
                                        .add(UpdateVideoPosition(
                                            time: value.toDouble()));

                                    //------------------------------------seek function
                                  state.controller!.seekTo(
                                          Duration(seconds: value.toInt()));
                                  },
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(showduration),
                                    Text(totalduration)
                                  ],
                                ),
                                //----------------------------------------------play / pause controls

                                state.start == true
                                    ? IconButton(
                                        icon: Icon(
                                          state.isPausedState
                                              ? Icons.play_arrow
                                              : Icons.pause,
                                          size: 50,
                                        ),
                                        onPressed: () {
                                          if (state.controller!.value
                                                  .playerState ==
                                              PlayerState.playing) {
                                            BlocProvider.of<ScreenPlayerBloc>(
                                                    context)
                                                .add(PauseVideo());
                                          } else {
                                            BlocProvider.of<ScreenPlayerBloc>(
                                                    context)
                                                .add(ResumeVideo());
                                          }
                                        },
                                      )
                                    : const CircularProgressIndicator(
                                        strokeAlign: 1,
                                      )
                              ],
                            );
                          }),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
