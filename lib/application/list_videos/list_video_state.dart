part of 'list_video_bloc.dart';

class ListVideoState {}

class ListVideoInitial extends ListVideoState {}

class ListVideoLoading extends ListVideoState {}

class ListVideoSuccess extends ListVideoState {
  final List<Item> videoList;

  ListVideoSuccess({required this.videoList});
}

class ListVideoFailure extends ListVideoState {
  final String errorMessage;

  ListVideoFailure({required this.errorMessage});
}
