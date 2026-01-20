import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

/// Location Service for handling GPS and geocoding
/// Manages location permissions and city/country detection
class LocationService {
  static LocationService? _instance;

  /// Get singleton instance
  static LocationService getInstance() {
    _instance ??= LocationService();
    return _instance!;
  }

  // ══════════════════════════════════════════════════════════════════════════
  // PERMISSION HANDLING
  // ══════════════════════════════════════════════════════════════════════════

  /// Check if location services are enabled
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  /// Get current permission status
  Future<LocationPermission> getPermissionStatus() async {
    return await Geolocator.checkPermission();
  }

  /// Request location permission
  /// Returns true if permission granted, false otherwise
  Future<bool> requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // Cannot request permission, user must enable from settings
      return false;
    }

    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  /// Open app settings (for when permission is denied forever)
  Future<bool> openSettings() async {
    return await Geolocator.openAppSettings();
  }

  /// Open location settings
  Future<bool> openLocationSettings() async {
    return await Geolocator.openLocationSettings();
  }

  // ══════════════════════════════════════════════════════════════════════════
  // LOCATION FETCHING
  // ══════════════════════════════════════════════════════════════════════════

  /// Get current position
  Future<Position?> getCurrentPosition() async {
    try {
      final hasPermission = await requestPermission();
      if (!hasPermission) return null;

      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
        timeLimit: const Duration(seconds: 10),
      );
    } catch (e) {
      return null;
    }
  }

  /// Get city and country from coordinates
  Future<LocationInfo?> getCityFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      final placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        return LocationInfo(
          city: place.locality ?? place.subAdministrativeArea ?? 'Unknown',
          country: place.country ?? 'Unknown',
          countryCode: place.isoCountryCode ?? '',
          administrativeArea: place.administrativeArea ?? '',
        );
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  /// Get current location info (city and country)
  Future<LocationInfo?> getCurrentLocationInfo() async {
    final position = await getCurrentPosition();
    if (position == null) return null;

    return await getCityFromCoordinates(position.latitude, position.longitude);
  }
}

/// Location information model
class LocationInfo {
  final String city;
  final String country;
  final String countryCode;
  final String administrativeArea;

  LocationInfo({
    required this.city,
    required this.country,
    required this.countryCode,
    required this.administrativeArea,
  });

  @override
  String toString() => '$city, $country';
}
