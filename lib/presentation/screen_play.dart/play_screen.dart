import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_a2h/application/screen_player/screen_player_bloc.dart';
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

        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Video Playing'),
            centerTitle: true,
          ),
          body: BlocBuilder<ScreenPlayerBloc, ScreenPlayerState>(
            builder: (context, state) {
              if (state.controller != null) {
                state.controller!.addListener(() {
                  BlocProvider.of<ScreenPlayerBloc>(context).add(
                      UpdateVideoPosition(
                          time: state.controller!.value.position.inSeconds
                              .toDouble()));
                });
      
                return Column(
                  children: [
                    Container(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controlsTimeOut: const Duration(seconds: 0),
                            showVideoProgressIndicator: true,
                            bufferIndicator: const CircularProgressIndicator(
                              color: Colors.red,
                            ),
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
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )),
                                const SizedBox(
                                  height: 28,
                                ),
                                //----------------------------------------------video player
                                player,
                                //-----------------------------------------------seek bar
                                Slider(
                                  value: state.currentVideoPosition,
                                  min: 0.0,
                                  max: state
                                      .controller!.metadata.duration.inSeconds
                                      .toDouble(),
                                  onChanged: (value) {
                                    // Seek to the selected position in the video
                                    BlocProvider.of<ScreenPlayerBloc>(context)
                                        .add(UpdateVideoPosition(
                                            time: value.toDouble()));
                                    state.controller!
                                        .seekTo(Duration(seconds: value.toInt()));
                                  },
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
