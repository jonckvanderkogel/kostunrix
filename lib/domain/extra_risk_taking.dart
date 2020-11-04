import 'package:cimpl/domain/enums.dart';

part 'extra_risk_taking_serializer.dart';

class ExtraRiskTaking {
  ExtraRiskTakingOptions choice;
  int value;

  ExtraRiskTaking(this.choice, this.value);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory ExtraRiskTaking.fromJson(Map<String, dynamic> json) => _$ExtraRiskTakingFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ExtraRiskTakingToJson(this);
}