

import 'dart:convert';

import 'MarkerData.dart';
import 'package:http/http.dart' as http;

class MarkerService {
  final String baseUrl;

  MarkerService(this.baseUrl);

  Future<List<MarkerData>> fetchMarkers() async {
    final response = await http.get(Uri.parse('$baseUrl/lists/branches'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((marker) => MarkerData.fromJson(marker)).toList();
    } else {
      throw Exception('Failed to load markers');
    }
  }
}