import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchEquipmentList() async {
  final url = 'https://exercisedb.p.rapidapi.com/exercises/equipmentList';
  final headers = {
    'x-rapidapi-host': 'exercisedb.p.rapidapi.com',
    'x-rapidapi-key': 'f592e2f097msh4d63e33559c0b83p163512jsncaf7d36f5840',
  };

  try {
    final response = await http.get(Uri.parse(url), headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final List<dynamic> data = jsonDecode(response.body);
      // You can then use this data as needed
      return data;
    } else {
      print(response.statusCode);
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load equipment list');
    }
  } catch (e) {
    print('Error: $e'); // Handle any errors
    return [];
  }
}
