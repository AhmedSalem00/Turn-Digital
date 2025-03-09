import 'package:booking_application/feature/event%20details/data/model/event_details_model.dart';

abstract class EventDetailsState {}

class EventDetailsInitial extends EventDetailsState {}

class EventDetailsLoading extends EventDetailsState {}

class EventDetailsSuccess extends EventDetailsState {
  final EventDetailsModel event;
  EventDetailsSuccess(this.event);
}

class EventDetailsError extends EventDetailsState {
  final String message;
  EventDetailsError(this.message);
}