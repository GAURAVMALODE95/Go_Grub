import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchRestaurants() async {
  final response = await http.get(Uri.parse('http://192.168.20.95:3000/restaurants'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch data');
  }
}
