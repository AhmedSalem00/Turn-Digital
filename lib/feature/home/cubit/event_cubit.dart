import 'package:bloc/bloc.dart';
import 'package:booking_application/feature/home/data/model/event_model.dart';
import 'package:booking_application/feature/home/data/repos/event_repos.dart';

import 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final ApiService apiService;
  EventCubit(this.apiService) : super(EventInitial()){
    fetchEvents();
  }
  void fetchEvents() async {
    emit(EventLoading());
    try {
      List<EventHomeModel> events = await apiService.fetchEvents();
      emit(EventLoaded(events));
    } catch (e) {
      emit(EventError("Failed to load events"));
    }
  }


}
