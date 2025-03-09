import 'package:dio/dio.dart';

import '../model/event_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<EventHomeModel>> fetchEvents() async {
    try {
      Response response = await _dio.get('http://api.td-dev.turndigital.net/api/events?page=1&limit=5');
      if (response.statusCode == 200) {
        List events = response.data['data']['events'];
        print(response.data);
        return events.map((e) => EventHomeModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      print("Error fetching events: $e");
      return [];
    }
  }
}
