import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_a2h/domain/model/video_list_model/item.dart';
import 'package:video_player_a2h/infrastructure/videoList/video_fetch_api.dart';

part 'list_video_event.dart';
part 'list_video_state.dart';

class ListVideoBloc extends Bloc<ListVideoEvent, ListVideoState> {
  final VideoFetchService _videoFetchService;

  ListVideoBloc(this._videoFetchService) : super(ListVideoInitial()) {
    //this event is called to show list of videos to the user
    
    on<ShowVideoList>((event, emit) async {
      emit(ListVideoLoading());
      //calling video fetching service
      final (error, response) = await _videoFetchService.getVideoList();

      if (error.isEmpty) {
        //if fetching video list is success emit success state

        emit(ListVideoSuccess(videoList: response!));
      } else {
        //if fetching video list is failure emit failed state

        emit(ListVideoFailure(errorMessage: error));
      }
    });
  }
}
