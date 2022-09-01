import 'package:geolocator/geolocator.dart';

final _mockPosition = Position(
  longitude: 37.61753425011479,
  latitude: 55.75207343413345,
  timestamp: DateTime.now(),
  accuracy: 0,
  altitude: 0,
  heading: 0,
  speed: 0,
  speedAccuracy: 0,
);

class GeocodingUtil {
  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position? position;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      try {
        position = await Geolocator.getLastKnownPosition();
        // ignore: empty_catches
      } catch (e) {
        position = _mockPosition;
      }
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        try {
          position = await Geolocator.getLastKnownPosition();
          // ignore: empty_catches
        } catch (e) {
          position = _mockPosition;
        }
      }
    }

    if (permission == LocationPermission.deniedForever) {
      try {
        position = await Geolocator.getLastKnownPosition();
        // ignore: empty_catches
      } catch (e) {
        position = _mockPosition;
      }
    }

    try {
      position ??= await Geolocator.getCurrentPosition();
    } catch (e) {
      position = _mockPosition;
    }

    return position;
  }
}
