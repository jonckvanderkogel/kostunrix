part of 'company.dart';

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
      json['id'] as int,
      json['registrationNumber'] as String,
      json['companyName'] as String,
      json['street'] as String,
      json['houseNumber'] as int,
      json['houseNumberExtension'] as String,
      json['city'] as String,
      json['zipcode'] as String,
      json['country'] as String,
      json['btw'] as String,
      json['lei'] as String,
      json['rsin'] as String,
      (json['sbi'] as List)?.map((e) => e as String)?.toList(),
      json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      (json['websites'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
  'id': instance.id,
  'registrationNumber': instance.registrationNumber,
  'companyName': instance.companyName,
  'street': instance.street,
  'houseNumber': instance.houseNumber,
  'houseNumberExtension': instance.houseNumberExtension,
  'city': instance.city,
  'zipcode': instance.zipcode,
  'country': instance.country,
  'btw': instance.btw,
  'lei': instance.lei,
  'rsin': instance.rsin,
  'sbi': instance.sbi,
  'location': instance.location,
  'websites': instance.websites
};
