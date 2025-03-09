
sealed class LocationState{}
class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final String city;
  final String country;
  final bool isVisible;

  LocationLoaded({
    required this.city,
    required this.country,
    this.isVisible = false,
  });

  @override
  List<Object?> get props => [city, country, isVisible];
}

class LocationError extends LocationState {
  final String message;
  LocationError({required this.message});

  @override
  List<Object?> get props => [message];
}
