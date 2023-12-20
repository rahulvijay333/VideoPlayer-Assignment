import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'screen_player_event.dart';
part 'screen_player_state.dart';

class ScreenPlayerBloc extends Bloc<ScreenPlayerEvent, ScreenPlayerState> {
  ScreenPlayerBloc() : super(ScreenPlayerState.intial()) {
    on<PlayVideo>((event, emit) {
      //intialize youtube controller
      //this event is called when user clicks a video from the list
      
      YoutubePlayerController youtubePlayerController = YoutubePlayerController(
          initialVideoId: event.vedioId,
          flags: const YoutubePlayerFlags(
              enableCaption: false,
              hideControls: true,
              mute: false,
              loop: false,
              autoPlay: true));

      emit(ScreenPlayerState(
          controller: youtubePlayerController,
          isPausedState: false,
          videoId: event.vedioId,
          currentVideoPosition: 0.0,
          start: false,
          videoTile: event.videoTitle));
    });

    on<PlayerReady>((event, emit) {
      emit(ScreenPlayerState(
          controller: state.controller,
          isPausedState: false,
          videoId: state.videoId,
          currentVideoPosition: state.currentVideoPosition,
          start: true,
          videoTile: state.videoTile));
    });

    on<PauseVideo>((event, emit) {
      state.controller!.pause();
      emit(ScreenPlayerState(
          controller: state.controller,
          isPausedState: true,
          videoId: state.videoId,
          currentVideoPosition: state.currentVideoPosition,
          start: state.start,
          videoTile: state.videoTile));
    });

    on<ResumeVideo>((event, emit) {
      state.controller!.play();

      emit(ScreenPlayerState(
          controller: state.controller,
          isPausedState: false,
          videoId: state.videoId,
          currentVideoPosition: state.currentVideoPosition,
          start: state.start,
          videoTile: state.videoTile));
    });

    on<UpdateVideoPosition>((event, emit) {
      double time = event.time;
      emit(ScreenPlayerState(
          controller: state.controller,
          isPausedState: state.isPausedState,
          videoId: state.videoId,
          currentVideoPosition: time,
          start: state.start,
          videoTile: state.videoTile));
    });

    on<Dispose>((event, emit) {
      state.controller!.dispose();
      emit(ScreenPlayerState.intial());
    });
  }
}
