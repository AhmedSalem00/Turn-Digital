import 'package:booking_application/feature/event%20details/data/model/event_details_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_details_state.dart';

class EventDetailsCubit extends Cubit<EventDetailsState> {
  EventDetailsCubit(Dio dio) : super(EventDetailsInitial());

  final Dio _dio = Dio();
  final String apiUrl = "http://api.td-dev.turndigital.net/api/events/50";

  void fetchEventDetails(int eventId) async {
    emit(EventDetailsLoading());
    try {
      final response = await _dio.get(apiUrl);
      if (response.statusCode == 200 && response.data['success'] == true) {
        final event = EventDetailsModel.fromJson(response.data['data']);
        emit(EventDetailsSuccess(event));
      } else {
        emit(EventDetailsError("Failed to fetch event details"));
      }
    } catch (e) {
      emit(EventDetailsError("An error occurred: ${e.toString()}"));
    }
  }
}