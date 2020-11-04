part of 'extra_risk_taking.dart';

ExtraRiskTaking _$ExtraRiskTakingFromJson(Map<String, dynamic> json) {
  return ExtraRiskTaking(
      enumDecodeNullable(extraRiskTakingOptionsEnumMap, json['choice']),
      json['value'] as int);
}

Map<String, dynamic> _$ExtraRiskTakingToJson(ExtraRiskTaking instance) =>
    <String, dynamic>{
      'choice': extraRiskTakingOptionsEnumMap[instance.choice],
      'value': instance.value
    };

