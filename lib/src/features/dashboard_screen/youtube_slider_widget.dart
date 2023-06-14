import 'package:flutter/material.dart';



class YoutubePage extends StatefulWidget {
  @override
  _YoutubePageState createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  final List<String> videoUrls = [
    'https://youtu.be/PJvm4wZ5zFs',
    'https://youtu.be/t6ejwWYrO4M',
    'https://youtu.be/fT2qZgWgjVA',
    'https://youtu.be/SLIXcG-kwPQ',
    'https://youtu.be/NwjO4shb0k4',
    'https://youtu.be/wZJDuvT9t_M',
    'https://youtu.be/dLcosVhPZnE',
    'https://youtu.be/SLIXcG-kwPQ',
    'https://youtu.be/t6ejwWYrO4M',
  ];

  final PageController _pageController = PageController(viewportFraction: 0.8);

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final thumbnailWidth = MediaQuery.of(context).size.width * 0.6;
    final thumbnailHeight = thumbnailWidth * 9 / 16;

    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: (videoUrls.length / 3).ceil(),
            itemBuilder: (context, index) {
              final startIndex = index * 3;
              final endIndex = (index * 3) + 3;
              final pageVideos = videoUrls.sublist(
                startIndex,
                endIndex > videoUrls.length ? videoUrls.length : endIndex,
              );

              return Row(
                children: pageVideos.map((videoUrl) {
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 3.0),
                      child: Image.network(
                        'https://img.youtube.com/vi/${videoUrl.substring(videoUrl.lastIndexOf('/') + 1)}/0.jpg',
                        fit: BoxFit.cover,
                        width: thumbnailWidth,
                        height: thumbnailHeight,
                      ),
                    ),
                  );
                }).toList(),
              );
            },
            onPageChanged: (index) {
              // Handle page change
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate((videoUrls.length / 3).ceil(), (index) {
            return Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.blue : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}
