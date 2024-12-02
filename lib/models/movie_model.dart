class MovieModel {
  final String movieName;
  final List<String> categories;
  final String imagePath;

  MovieModel(
      {
        required this.movieName,
        required this.categories,
        required this.imagePath
      }
      );

  @override
  String toString() {
    return categories.join(" , ");
  }
}