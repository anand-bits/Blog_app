import 'package:flutter/material.dart';
import 'blog_model.dart'; // Import the Blog class

class BlogDetailScreen extends StatelessWidget {
  final Blog blog;

  BlogDetailScreen(this.blog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            blog.imageUrl,
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Text(
            blog.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Add more details about the blog here
        ],
      ),
    );
  }
}
