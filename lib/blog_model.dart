


class Blog {
  final String title;
  final String imageUrl;
  bool isFavorite; // New property to track favorite status

  Blog(this.title, this.imageUrl, {this.isFavorite = false});
}
