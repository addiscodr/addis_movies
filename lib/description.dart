import 'package:addis_movies/utils/text.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, vote, launchOn;
  const Description({
    super.key,
    required this.name,
    required this.description,
    required this.bannerUrl,
    required this.posterUrl,
    required this.vote,
    required this.launchOn,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTree) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: ModifiedText(
                      text: ' ⭐ Average Rating - $vote',
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(text: name, color: Colors.white, size: 24),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(
                text: 'Release date - $launchOn',
                color: Colors.white,
                size: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                description,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
