part of 'screen_player_bloc.dart';

class ScreenPlayerEvent {}

class PlayVideo extends ScreenPlayerEvent {
  final String vedioId;
  final String videoTitle;

  PlayVideo({required this.vedioId, required this.videoTitle});
}

class PauseVideo extends ScreenPlayerEvent {}

class ResumeVideo extends ScreenPlayerEvent {}

class UpdateVideoPosition extends ScreenPlayerEvent {
  final double time;

  UpdateVideoPosition({required this.time});
}

class Dispose extends ScreenPlayerEvent {}

class PlayerReady extends ScreenPlayerEvent {}
