import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player_a2h/application/list_videos/list_video_bloc.dart';
import 'package:video_player_a2h/application/screen_player/screen_player_bloc.dart';
import 'package:video_player_a2h/presentation/screen_play/play_screen.dart';
import 'package:video_player_a2h/presentation/video_list_screen/widgets/videoTilePlusText.dart';

class ScreenList extends StatelessWidget {
  const ScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blueAccent.shade100,
          appBar: AppBar(
            title: const Text('Video List'),centerTitle: true,
          ),
          body: BlocBuilder<ListVideoBloc, ListVideoState>(
            builder: (context, state) {
              if (state is ListVideoLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ListVideoSuccess) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 15,bottom: 15),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: state.videoList.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<ScreenPlayerBloc>(context).add(
                              PlayVideo(
                                  vedioId: state.videoList[index].id!,
                                  videoTitle:
                                      state.videoList[index].snippet!.title!));
    
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return const PlayScreen();
                            },
                          ));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: VideoTilePlusTileWidget(
                            size: size,
                            imageUrl: state
                                .videoList[index].snippet!.thumbnails!.high!.url!,
                            title: state.videoList[index].snippet!.title ?? "",
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is ListVideoFailure) {
                return  Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.errorMessage),
                      IconButton(onPressed: () {
                        //refresh state
                         BlocProvider.of<ListVideoBloc>(context).add(ShowVideoList());
                      }, icon: const Icon(Icons.refresh))
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          )),
    );
  }
}
