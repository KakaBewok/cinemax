import 'package:cinemax/web_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> filmPosters = [
    'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
    'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return const WebScreen();
        } else {
          return ListView.builder(
            itemCount: filmPosters.length,
            itemBuilder: (context, index) {
              return FilmPosterCard(posterUrl: filmPosters[index]);
            },
          );
        }
      },
    );
  }
}

class FilmPosterCard extends StatelessWidget {
  final String posterUrl;

  const FilmPosterCard({Key? key, required this.posterUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        constraints:
            const BoxConstraints(maxWidth: 600.0), // Max width for mobile
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              posterUrl,
              fit: BoxFit.cover,
              height: 200.0,
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Film Title',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Release Date: January 1, 2023'),
            ),
          ],
        ),
      ),
    );
  }
}
