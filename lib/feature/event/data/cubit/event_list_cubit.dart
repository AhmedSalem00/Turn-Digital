import 'package:bloc/bloc.dart';
import 'package:booking_application/feature/event/data/model/event_list_model.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'event_list_state.dart';

class EventsListCubit extends Cubit<EventsListState> {
  EventsListCubit() : super(EventsInitial()){
    fetchEvents();
  }

  final Dio _dio = Dio();
  final String _baseUrl = "http://api.td-dev.turndigital.net/api/events";
  int currentPage = 1;
  final int pageSize = 10;
  bool hasMore = true;
  List<EventListModel> events = [];

  Future<void> fetchEvents({bool loadMore = false}) async {
    if (!hasMore && loadMore) return;

    if (!loadMore) {
      emit(EventsLoading());
    }

    try {
      final response = await _dio.get("$_baseUrl?page=$currentPage&limit=$pageSize");

      if (response.statusCode == 200) {
        final data = response.data;
        List<EventListModel> newEvents = (data["data"]["events"] as List)
            .map((e) => EventListModel.fromJson(e))
            .toList();

        events.addAll(newEvents);

        // Update pagination status
        currentPage++;
        hasMore = currentPage <= data["data"]["total_pages"];

        emit(EventsLoaded(events));
      } else {
        emit(EventsError("Failed to load events"));
      }
    } catch (e) {
      emit(EventsError(e.toString()));
    }
  }
  String formatEventDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat("EEE, MMM d • h:mm a").format(dateTime);
  }

}