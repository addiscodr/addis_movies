import 'package:addis_movies/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
                  // Banner Image
                  Positioned.fill(
                    child: Image.network(
                      bannerUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    ),
                  ),

                  // Dark gradient for better visibility
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black54, Colors.transparent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),

                  // 🔙 Cupertino Back Button
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 10,
                    left: 10,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const CircleAvatar(
                        backgroundColor: Colors.black54,
                        radius: 20,
                        child: Icon(
                          CupertinoIcons.back,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),

                  // ⭐ Rating Text
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: ModifiedText(
                      text: '⭐ Average Rating - $vote',
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
