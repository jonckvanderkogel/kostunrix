import 'package:cimpl/domain/company.dart';
import 'package:cimpl/domain/date_time_serializer.dart';

part 'limit_request_serializer.dart';

class LimitRequest {
  int id;
  DateTime fromDate;
  int nrOfQuarters;
  int amount;
  int creditTerms;
  bool cancelable;
  bool anyOverduepayments;
  int nrOfDaysOverdueOldestInvoice;
  Company buyer;

  LimitRequest(this.id, this.fromDate, this.nrOfQuarters, this.amount,
      this.creditTerms, this.cancelable, this.anyOverduepayments,
      this.nrOfDaysOverdueOldestInvoice, this.buyer);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory LimitRequest.fromJson(Map<String, dynamic> json) => _$LimitRequestFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$LimitRequestToJson(this);
}