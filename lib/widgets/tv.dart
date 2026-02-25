import 'package:addis_movies/description.dart';
import 'package:addis_movies/utils/text.dart';
import 'package:flutter/material.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: 'Popular TV Shows',
            color: Colors.deepOrange,
            size: 21,
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: tv[index]['name'],
                          description: tv[index]['overview'],
                          bannerUrl:
                              'https://image.tmdb.org/t/p/w500/${tv[index]['backdrop_path']}',
                          posterUrl:
                              'https://image.tmdb.org/t/p/w500/${tv[index]['poster_path']}',
                          vote: (tv[index]['vote_average'].toDouble() as num).toStringAsFixed(1),
                          launchOn: tv[index]['first_air_date'],
                        ),
                      ),
                    );
                  },
                  child: SingleChildScrollView(
                    child: tv[index]['original_name'] != null
                        ? Container(
                            padding: EdgeInsets.all(5),
                            width: 250,
                            child: Column(
                              children: [
                                Container(
                                  width: 250,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500/${tv[index]['backdrop_path']}',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  width: 250,
                                  height: 140,
                                  child: ModifiedText(
                                    text:
                                        tv[index]['original_name'] ??
                                        'Loading...',
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
