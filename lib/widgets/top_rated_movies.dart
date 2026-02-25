import 'package:addis_movies/description.dart';
import 'package:addis_movies/utils/text.dart';
import 'package:flutter/material.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRatedMovies;
  const TopRatedMovies({super.key, required this.topRatedMovies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Top Rated Movies',
            color: Colors.deepOrange,
            size: 21,
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRatedMovies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: topRatedMovies[index]['title'],
                          description: topRatedMovies[index]['overview'],
                          bannerUrl:
                              'https://image.tmdb.org/t/p/w500/${topRatedMovies[index]['backdrop_path']}',
                          posterUrl:
                              'https://image.tmdb.org/t/p/w500/${topRatedMovies[index]['poster_path']}',
                          vote: (topRatedMovies[index]['vote_average'] as num)
                              .toDouble()
                              .toStringAsFixed(1),
                          launchOn: topRatedMovies[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: topRatedMovies[index]['title'] != null
                      ? Container(
                          padding: EdgeInsets.only(right: 3),
                          width: 140,
                          child: Column(
                            children: [
                              Flexible(
                                child: Container(
                                  height: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500/${topRatedMovies[index]['backdrop_path']}',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ModifiedText(
                                text:
                                    topRatedMovies[index]['title'] ??
                                    'Loading...',
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        )
                      : Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
