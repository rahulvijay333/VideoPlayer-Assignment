import 'dart:io';

import 'package:dio/dio.dart';
import 'package:video_player_a2h/core/Api/api_end_points.dart';
import 'package:video_player_a2h/domain/model/video_list_model/item.dart';
import 'package:video_player_a2h/domain/model/video_list_model/video_list_model.dart';

class VideoFetchService {
  // video fetching function to call server and get list of videos

  Future<(String, List<Item>?)> getVideoList() async {
    try {
      final Response response = await Dio().get(ApiEndpoints.getVideoUrl);
      if (response.statusCode == 200) {
        //parsing  data received from server to custom class model
        final data = VideoListModel.fromJson(response.data);
        //retrived video list and passed to bloc state
        final videoLists = data.items;

        return ('', videoLists!);
      } else {
        return ('Error happened in Api Call', null);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.error is SocketException) {
          return ('Not conected to internet', null);
        } else if (e.response!.statusCode == 400) {
          return ('video not found', null);
        } else if (e.response!.statusCode == 403) {
          return ('Request is not properly authorized', null);
        } else if (e.response!.statusCode == 404) {
          return ('Video not found', null);
        }
      }

      return ('server failed,try after sometime', null);
    }
  }
}
