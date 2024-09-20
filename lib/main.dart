import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:movie_app/widgets/toprated.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = 'dab3e0287852be3d6170e13579e8e4ec';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYWIzZTAyODc4NTJiZTNkNjE3MGUxMzU3OWU4ZTRlYyIsIm5iZiI6MTcyNjgyNTI5Ny44MzEwNjcsInN1YiI6IjY2ZWIwMTJiYjI5MTdlYjE4MDBiYzBkMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lXfLm980klagmKQAz3DX8XRrATo4xxt0GKlztHJnsOE';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map treandingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = treandingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(trendingmovies);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: ModifiedText(
          text: 'Flutter Movie App❤️',
          color: Colors.white,
          size: 20,
        ),
      ),
      body: ListView(
        children: [
          TV(tv: tv),
          TopRatedMovies(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies),
        ],
      ),
    );
  }
}
