class EventDetailsModel {
  final int? eventId;
  final String? picture;
  final String? date;
  final String? title;
  final String? address;
  final int? numberOfGoing;
  final String? addressTitle;
  final double? latitude;
  final double? longitude;
  final String? aboutEvent;
  final double? eventPrice;
  final OrganizeModel? organizer;

  EventDetailsModel({
     this.eventId,
     this.picture,
     this.date,
     this.title,
     this.address,
     this.numberOfGoing,
     this.addressTitle,
     this.latitude,
     this.longitude,
     this.aboutEvent,
     this.eventPrice,
     this.organizer,
  });

  factory EventDetailsModel.fromJson(Map<String, dynamic> json) {
    return EventDetailsModel(
      eventId: json['event_id'],
      picture: json['picture'],
      date: json['date'],
      title: json['title'],
      address: json['address'],
      numberOfGoing: json['number_of_going'],
      addressTitle: json['address_title'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      aboutEvent: json['about_event'],
      eventPrice: double.parse(json['event_price']),
      organizer: OrganizeModel.fromJson(json['organizer']),
    );
  }
}
class OrganizeModel {
  final int? id;
  final String? name;
  final String? picture;

  OrganizeModel({required this.id, required this.name, required this.picture});

  factory OrganizeModel.fromJson(Map<String, dynamic> json) {
    return OrganizeModel(
      id: json['id'],
      name: json['name'],
      picture: json['picture'],
    );
  }
}