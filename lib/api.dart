import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  //Future is something is not avilable for now but available in Future and List,Map is The return Type of fetch Blogs();
  // Dynamic means Data Types of Any Type
  //Basically fetchblogs() api is creating and its will call the url given with header


  static Future<List<Map<String, dynamic>>> fetchBlogs() async {
    final String apiUrl = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    final String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'x-hasura-admin-secret': adminSecret,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> blogList = json.decode(response.body)['blogs'];
        return blogList.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
