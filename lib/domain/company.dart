import 'package:cimpl/domain/location.dart';

part 'company_serializer.dart';

class Company {
  int id;
  String registrationNumber;
  String companyName;
  String street;
  int houseNumber;
  String houseNumberExtension;
  String city;
  String zipcode;
  String country;
  String btw;
  String lei;
  String rsin;
  List<String> sbi;
  Location location;
  List<String> websites;

  Company(this.id, this.registrationNumber, this.companyName, this.street,
      this.houseNumber, this.houseNumberExtension, this.city, this.zipcode,
      this.country, this.btw, this.lei, this.rsin, this.sbi, this.location,
      this.websites);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}