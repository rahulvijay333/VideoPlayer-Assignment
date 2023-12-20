import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_a2h/application/list_videos/list_video_bloc.dart';
import 'package:video_player_a2h/application/screen_player/screen_player_bloc.dart';
import 'package:video_player_a2h/infrastructure/videoList/video_fetch_api.dart';
import 'package:video_player_a2h/presentation/splash_screen/screen_splash.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoFetchService videoFetchService = VideoFetchService();

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ListVideoBloc(videoFetchService),
          ),
          BlocProvider(
            create: (context) => ScreenPlayerBloc(),
          )
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}
