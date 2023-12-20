import 'package:video_player_a2h/infrastructure/api_key/api_key.dart';

const baseUrl = 'https://www.googleapis.com/youtube/v3/videos';

class ApiEndpoints {
  static const getVideoUrl =
      '$baseUrl?part=snippet&chart=mostPopular&regionCode=US&key=$apiKey';
}


//youtube apikey has been git ignored for security purpose