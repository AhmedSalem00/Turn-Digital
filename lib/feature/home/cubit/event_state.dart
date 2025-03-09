import 'package:booking_application/feature/home/data/model/event_model.dart';
import 'package:equatable/equatable.dart';

sealed class EventState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventLoaded extends EventState {
  final List<EventHomeModel> events;
  EventLoaded(this.events);

  @override
  List<Object?> get props => [events];
}

class EventError extends EventState {
  final String message;
  EventError(this.message);

  @override
  List<Object?> get props => [message];
}

