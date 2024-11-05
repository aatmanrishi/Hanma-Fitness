import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/videoModel.dart';

Future<List<Video>> fetchVideos(String query) async {
  const String apiKey = 'YOUR_RAPIDAPI_KEY'; // Replace with your actual API key
  const String apiHost = 'youtube-search-and-download.p.rapidapi.com';
  
  final url = Uri.https(apiHost, '/search', {
    'query': query,
    'maxResults': '3', // Requesting at most 3 results
  });

  try {
    final response = await http.get(url, headers: {
      'x-rapidapi-host': apiHost,
      'x-rapidapi-key': apiKey,
    });

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final videoModel = VideoModel.fromJson(jsonResponse);

      return videoModel.contents.map((content) => content.video).where((video) => video != null).cast<Video>().toList();
    } else {
      throw Exception('Failed to load videos');
    }
  } catch (e) {
    print('Error: $e');
    return []; // Return an empty list on error
  }
}
