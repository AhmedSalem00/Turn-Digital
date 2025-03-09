class ProfileModel {
  final String name;
  final String picture;
  final int numberOfFollowing;
  final int numberOfFollowers;
  final String about;
  final List<EventModel> events;
  final List<ReviewModel> reviews;

  ProfileModel({
    required this.name,
    required this.picture,
    required this.numberOfFollowing,
    required this.numberOfFollowers,
    required this.about,
    required this.events,
    required this.reviews,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    var eventList = json['data']['events'] as List;
    var reviewList = json['data']['reviews'] as List;

    return ProfileModel(
      name: json['data']['name'],
      picture: json['data']['picture'],
      numberOfFollowing: json['data']['number_of_following'],
      numberOfFollowers: json['data']['number_of_followers'],
      about: json['data']['about'],
      events: eventList.map((e) => EventModel.fromJson(e)).toList(),
      reviews: reviewList.map((r) => ReviewModel.fromJson(r)).toList(),
    );
  }
}

class EventModel {
  final String id;
  final String picture;
  final String date;
  final String title;

  EventModel({
    required this.id,
    required this.picture,
    required this.date,
    required this.title,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'].toString(),
      picture: json['picture'],
      date: json['date'],
      title: json['title'],
    );
  }
}

class ReviewModel {
  final String reviewId;
  final String reviewerPicture;
  final String reviewerName;
  final int rate;
  final String review;
  final String reviewDate;

  ReviewModel({
    required this.reviewId,
    required this.reviewerPicture,
    required this.reviewerName,
    required this.rate,
    required this.review,
    required this.reviewDate,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      reviewId: json['review_id'].toString(),
      reviewerPicture: json['reviewer_picture'],
      reviewerName: json['reviewer_name'],
      rate: json['rate'],
      review: json['review'],
      reviewDate: json['review_date'],
    );
  }
}
