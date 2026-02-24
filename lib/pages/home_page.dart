import 'package:addis_movies/utils/text.dart';
import 'package:addis_movies/widgets/top_rated_movies.dart';
import 'package:addis_movies/widgets/trending_movies.dart';
import 'package:addis_movies/widgets/tv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> trendingMovies = [];
  List<Map<String, dynamic>> topRatedMovies = [];
  List<Map<String, dynamic>> tvShows = [];

  late final String apiKey;
  late final String readAccessToken;

  @override
  void initState() {
    super.initState();

    apiKey = dotenv.env['API_KEY'] ?? '';
    readAccessToken = dotenv.env['READ_API_ACCESS_TOKEN'] ?? '';

    if (apiKey.isEmpty || readAccessToken.isEmpty) {
      debugPrint('API keys missing in .env file');
    }

    loadMovies();
  }

  bool isLoading = true;
  String? errorMessage;

  Future<void> loadMovies() async {
    try {
      final tmdb = TMDB(
        ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showLogs: false),
      );

      final trendingResults = await tmdb.v3.trending.getTrending();
      final topRatedResults = await tmdb.v3.movies.getTopRated();
      final tvResults = await tmdb.v3.tv.getPopular();

      if (!mounted) return;

      setState(() {
        trendingMovies = List<Map<String, dynamic>>.from(
          trendingResults['results'],
        );
        topRatedMovies = List<Map<String, dynamic>>.from(
          topRatedResults['results'],
        );
        tvShows = List<Map<String, dynamic>>.from(tvResults['results']);
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: ModifiedText(text: 'Addis Movies', color: Colors.red, size: 30),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
          ? Center(child: Text(errorMessage!))
          : ListView(
              children: [
                TV(tv: tvShows),
                TopRatedMovies(topRatedMovies: topRatedMovies),
                TrendingMovies(trendingMovies: trendingMovies),
              ],
            ),
    );
  }
}
