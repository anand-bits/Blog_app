import 'package:flutter/material.dart';
import 'api.dart';
import 'blog_model.dart';
import 'blog_detail_screen.dart';

class BlogListScreen extends StatefulWidget {
  @override
  _BlogListScreenState createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  List<Blog> blogs = [];

  @override
  void initState() {
    super.initState();
    fetchBlogsData();
  }

  Future<void> fetchBlogsData() async {
    try {
      final blogData = await Api.fetchBlogs();
      setState(() {
        blogs = blogData.map((item) => Blog(item['title'], item['image_url'])).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog List'),
      ),
      body: ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (ctx, index) {
          final blog = blogs[index];
          return Card(
            elevation: 3,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => BlogDetailScreen(blog),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    blog.imageUrl,
                    height: 300, // Adjust image height as needed
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      blog.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
