class Movie{
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final double rating;
  final String imagePath;

  const Movie({
    required this.title,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.rating,
    required this.imagePath,

  });

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      rating: json['vote_average'].toDouble(),
      imagePath: json['poster_path'],
    );
  }
}