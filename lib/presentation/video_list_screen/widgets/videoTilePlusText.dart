import 'package:flutter/material.dart';

class VideoTilePlusTileWidget extends StatelessWidget {
  const VideoTilePlusTileWidget({
    super.key,
    required this.size,
    required this.imageUrl,
    required this.title,
  });

  final Size size;
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // color: Colors.red,
          width: size.width * 0.85,
          height: size.height * 0.20,
          child: Image.network(imageUrl, fit: BoxFit.fitWidth,
              loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
                color: Colors.white,
              ),
            );
          }, errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/image_placeholder.png',
              fit: BoxFit.cover,
            );
          }),
        ),
        Container(
          padding: const EdgeInsets.only(left: 2, right: 2),
          color: Colors.white.withOpacity(0.8),
          height: size.height * 0.06,
          width: size.width * 0.85,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                style: TextStyle(fontSize: size.height * 0.06 * 0.34),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }
}
