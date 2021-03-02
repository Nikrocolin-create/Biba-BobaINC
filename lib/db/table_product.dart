import 'Model.dart';
class LocationPollution extends Model {

  static String table = 'location_pollution';

  final Uint8List picture;

  LocationPollution({ this.id, this.path, this.latitude, this.longitude,
    this.o3, this.co, this.no2, this.pm25, this.no, this.so2, this.pm10, this.nh3, this.aqi});
}