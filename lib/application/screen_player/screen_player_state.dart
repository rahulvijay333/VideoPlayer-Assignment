part of 'screen_player_bloc.dart';

class ScreenPlayerState {
  final YoutubePlayerController? controller;
  final bool isPausedState;
  final String? videoId;
  final double currentVideoPosition;
  final bool start;
  final String? videoTile;

  factory ScreenPlayerState.intial() {
    return ScreenPlayerState(
        controller: null,
        isPausedState: false,
        videoId: null,
        currentVideoPosition: 0.0,
        start: false,
        videoTile: '');
  }

  ScreenPlayerState(
      {required this.controller,
      required this.isPausedState,
      required this.videoId,
      required this.currentVideoPosition,
      required this.start,
      required this.videoTile});
}

// class ScreenPlayerInitial extends ScreenPlayerState {}

// class PlayVideoSuccess extends ScreenPlayerState {
//   final YoutubePlayerController controller;

//   PlayVideoSuccess({required this.controller});
// }

// class VideoLoading extends ScreenPlayerState {}

// class PlayVideoPaused extends ScreenPlayerState {
//    final YoutubePlayerController controller;

//   PlayVideoPaused({required this.controller});
// }

// class PlayVideoResume extends Screen