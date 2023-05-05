import 'package:foodie/views/detail_video.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String name;
  final String cook_time_minutes;
  final String? thumbnail_url;
  final String? videoUrl;

  RecipeCard({
    required this.name,
    required this.cook_time_minutes,
    this.thumbnail_url,
    this.videoUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 220,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: const Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: NetworkImage(thumbnail_url ??
                'https://png.pngtree.com/png-vector/20220623/ourmid/pngtree-food-logo-png-image_5297921.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 19, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: videoUrl != 'noVideo' ? true : false,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => videoUrl != null
                                      ? DetailVideo(videoUrl: videoUrl!)
                                      : Container()))
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.play_circle_fill_rounded,
                              color: Colors.yellow,
                              size: 18,
                            ),
                            SizedBox(width: 7),
                            Text(
                              'Play video',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        const SizedBox(width: 7),
                        Text(
                          "$cook_time_minutes mins",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
