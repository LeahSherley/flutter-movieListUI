/*import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=086c0f9f9229419f8704dbb549550920'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> results = data['results'];

        setState(() {
          movies = results.map((json) => Movie.fromJson(json)).toList();
        });
      } else {
        throw Exception('Failed to fetch movies');
      }
    } catch (error) {
      //print('Error fetching movies: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[50],
        title: Text("MovieList",
            style: TextStyle(
              fontSize: 15,
              color: Colors.orange[900],
            )),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 20,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 0.7,
        ),
        children: [
          for (final movie in movies)
            MyMovie(
              movie: movie,
            )
        ],
      ),
    );
  }
}

class MyMovie extends StatelessWidget {
  const MyMovie({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber[100],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w200${movie.imagePath}',
                width: double.infinity,
                height: 150.0,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                        child: Icon(
                      Icons.image_not_supported_rounded,
                    )),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 5.0,
              ),
              child: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 3.0,
                bottom: 10.0,
              ),
              child: Text(
                "Release date: ${movie.releaseDate}",
                style: const TextStyle(
                  fontSize: 11.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    movie.rating.toString(),
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Text(
                movie.overview,
                style: const TextStyle(
                  fontSize: 11.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_app/models/movie_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=086c0f9f9229419f8704dbb549550920'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> results = data['results'];

        setState(() {
          movies = results.map((json) => Movie.fromJson(json)).toList();
        });
      } else {
        throw Exception('Failed to fetch movies');
      }
    } catch (error) {
      //print('Error fetching movies: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.amber[50],
        title: const Text(
          "MovieList",
          style: TextStyle(
            fontSize: 13,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: CarouselSlider(
          options: CarouselOptions(
            //height: 400,
            aspectRatio: 0.7,
            viewportFraction: 0.82,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: movies.map((movie) {
            return Builder(
              builder: (BuildContext context) {
                return MyMovie(movie: movie);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class MyMovie extends StatelessWidget {
  const MyMovie({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(movie.title)));
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber[100],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w200${movie.imagePath}',
                width: double.infinity,
                height: 150.0,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.image_not_supported_rounded),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                top: 5.0,
              ),
              child: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                top: 3.0,
                bottom: 10.0,
              ),
              child: Text(
                "Release date: ${movie.releaseDate}",
                style: const TextStyle(
                  fontSize: 11.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${movie.rating.toString()}/10 IMDb",
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
              ),
              child: Text(
                movie.overview,
                style: const TextStyle(
                  fontSize: 11.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
