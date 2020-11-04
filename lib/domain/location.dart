part 'location_serializer.dart';

class Location {
  String lat;
  String lon;

  Location(this.lat, this.lon);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$LocationToJson(this);

}