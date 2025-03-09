class EventListModel {
  final int? id;
  final String? picture;
  final String? date;
  final String? title;
  final String? address;
  final int? numberOfGoing;
  final Organizer? organizer;

  EventListModel({
     this.id,
     this.picture,
     this.date,
     this.title,
     this.address,
     this.numberOfGoing,
     this.organizer,
  });

  factory EventListModel.fromJson(Map<String, dynamic> json) {
    return EventListModel(
      id: json["event_id"],
      picture: json["picture"],
      date: json["date"],
      title: json["title"],
      address: json["address"],
      numberOfGoing: json["number_of_going"],
      organizer: Organizer.fromJson(json["organizer"]),
    );
  }
}

class Organizer {
  final int? id;
  final String? name;
  final String? picture;

  Organizer({
     this.id,
     this.name,
     this.picture,
  });

  factory Organizer.fromJson(Map<String, dynamic> json) {
    return Organizer(
      id: json["id"],
      name: json["name"],
      picture: json["picture"],
    );
  }
}
