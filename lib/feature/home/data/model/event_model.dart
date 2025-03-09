
import 'dart:convert';

class Organizer {
  final int? id;
  final String? name;
  final String? picture;

  Organizer({required this.id, required this.name, required this.picture});

  factory Organizer.fromJson(Map<String, dynamic> json) {
    return Organizer(
      id: json['id'],
      name: json['name'],
      picture: json['picture'],
    );
  }
}

class EventHomeModel {
  final int? eventId;
  final String? title;
  final String? address;
  final String? date;
  final String? picture;
  final int? numberOfGoing;
  final Organizer? organizer;

  EventHomeModel({
    required this.eventId,
    required this.title,
    required this.address,
    required this.date,
    required this.picture,
    required this.numberOfGoing,
    required this.organizer,
  });

  factory EventHomeModel.fromJson(Map<String, dynamic> json) {
    return EventHomeModel(
      eventId: json['event_id'],
      title: json['title'],
      address: json['address'],
      date: json['date'],
      picture: json['picture'],
      numberOfGoing: json['number_of_going'],
      organizer: Organizer.fromJson(json['organizer']),
    );
  }

  // Add a method to convert EventHomeModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'event_id': eventId,
      'title': title,
      'address': address,
      'date': date,
      'picture': picture,
      'number_of_going': numberOfGoing,
    };
  }

  // Convert the EventHomeModel to a JSON string
  String toJsonString() {
    return jsonEncode(toJson());
  }

  // Create an EventHomeModel instance from a JSON string
  static EventHomeModel fromJsonString(String jsonString) {
    return EventHomeModel.fromJson(jsonDecode(jsonString));
  }
}

