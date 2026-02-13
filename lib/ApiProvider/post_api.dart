import 'dart:convert';
import 'dart:io';

import 'package:neorchatasks/Configurations/urls/post_url.dart';

class PostApi {
  final HttpClient httpClient = HttpClient();

  Future<List<Map<String, dynamic>>> fetchPosts() async {
    final uri = Uri.parse(fetchPostsUrl);
    final request = await httpClient.getUrl(uri);
    final response = await request.close();
    final body = await response.transform(utf8.decoder).join();
    if (response.statusCode != 200) {
      throw Exception('Error ${response.statusCode}: $body');
    }
    final Map<String, dynamic> jsonMap = jsonDecode(body);
    final List<dynamic> jsonList = jsonMap['posts'];
    return jsonList.map((item) => item as Map<String, dynamic>).toList();
  }
}
