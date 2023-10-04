import 'package:flutter/material.dart';
import 'api.dart';
import 'blog_model.dart';
import 'blog_detail_screen.dart';
//BlogListScreen is Stateful wodget Means It will chnage the ui ..

class BlogListScreen extends StatefulWidget {
  @override
  _BlogListScreenState createState() => _BlogListScreenState();
}
class _BlogListScreenState extends State<BlogListScreen> {
  List<Blog> blogs = [];

  @override
  // this Means it will be callled when the widget is created.

  void initState() {
    super.initState();
    // Api called .
    fetchBlogsData();
  }
  //After getting the data from The api , I m fitting the data in blogdata class .


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

  // Function to toggle the favorite status of a blog
  void toggleFavoriteStatus(int index) {
    setState(() {
      blogs[index].isFavorite = !blogs[index].isFavorite;
    });
  }

  // The build method defines The User Interface of The  BlogListScreen

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
                    height: 300,
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
                  IconButton(
                    icon: Icon(
                      blog.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      toggleFavoriteStatus(index); // Toggle favorite status
                    },
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
