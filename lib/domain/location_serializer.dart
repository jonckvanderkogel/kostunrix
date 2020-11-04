part of 'location.dart';

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(json['lat'] as String, json['lon'] as String);
}

Map<String, dynamic> _$LocationToJson(Location instance) =>
    <String, dynamic>{'lat': instance.lat, 'lon': instance.lon};
