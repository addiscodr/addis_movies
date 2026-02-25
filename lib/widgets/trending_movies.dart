import 'package:addis_movies/description.dart';
import 'package:addis_movies/utils/text.dart';
import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  final List trendingMovies;
  const TrendingMovies({super.key, required this.trendingMovies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Trending Movies',
            color: Colors.deepOrange,
            size: 21,
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendingMovies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: trendingMovies[index]['title'],
                          description: trendingMovies[index]['overview'],
                          bannerUrl:
                              'https://image.tmdb.org/t/p/w500/${trendingMovies[index]['backdrop_path']}',

                          posterUrl:
                              'https://image.tmdb.org/t/p/w500/${trendingMovies[index]['poster_path']}',
                          vote: (trendingMovies[index]['vote_average'] as num).toDouble()
                              .toStringAsFixed(1),
                          launchOn: trendingMovies[index]['release_date'],
                        ),
                      ),
                    );
                  },

                  child: trendingMovies[index]['title'] != null
                      ? Container(
                        padding: EdgeInsets.only(right: 3),
                        child: SizedBox(
                          
                            width: 140,
                            child: Column(
                              children: [
                                Flexible(
                                  child: Container(
                                    height: 180,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500/${trendingMovies[index]['backdrop_path']}',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ModifiedText(
                                  text:
                                      trendingMovies[index]['title'] ??
                                      'Loading...',
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
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
