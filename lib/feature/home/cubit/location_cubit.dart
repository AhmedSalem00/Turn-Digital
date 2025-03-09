import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  bool showLocation = false;

  LocationCubit() : super(LocationLoading()) {
    fetchLocation();
  }

  void toggleLocation() {
    print("will toggle location");
    if (state is LocationLoaded) {
      final currentState = state as LocationLoaded;
      showLocation = !showLocation;
      emit(LocationLoading());
      emit(LocationLoaded(
        city: currentState.city,
        country: currentState.country,
        isVisible: !currentState.isVisible,
      ));
    }
  }

  Future<void> fetchLocation() async {
    emit(LocationLoading());

    try {
      PermissionStatus permission = await Permission.location.request();

      if (permission.isDenied || permission.isPermanentlyDenied) {
        emit(LocationError(message:"Location permission denied."));
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String city = place.locality ?? "Unknown City";
        String country = place.country ?? "Unknown Country";

        emit(LocationLoaded(city: city, country: country));
      } else {
        emit( LocationError(message:"Could not determine location."));
      }
    } catch (e) {
      emit(LocationError(message:"Cannot get location"));
    }
  }
}
