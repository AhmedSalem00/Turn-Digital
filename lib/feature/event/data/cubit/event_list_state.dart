
import 'package:booking_application/feature/event/data/model/event_list_model.dart';

abstract class EventsListState {}

class EventsInitial extends EventsListState {}

class EventsLoading extends EventsListState {}

class EventsLoaded extends EventsListState {
  final List<EventListModel> events;
  EventsLoaded(this.events);
}

class EventsError extends EventsListState {
  final String message;
  EventsError(this.message);
}
