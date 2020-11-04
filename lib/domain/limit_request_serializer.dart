part of 'limit_request.dart';

LimitRequest _$LimitRequestFromJson(Map<String, dynamic> json) {
  return LimitRequest(
      json['id'] as int,
      json['fromDate'] == null
          ? null
          : DateTime.parse(DateTimeSerializer.fromJson(json['fromDate'] as Map<String, dynamic>)),
      json['nrOfQuarters'] as int,
      json['amount'] as int,
      json['creditTerms'] as int,
      json['cancelable'] as bool,
      json['anyOverduepayments'] as bool,
      json['nrOfDaysOverdueOldestInvoice'] as int,
      json['buyer'] == null
          ? null
          : Company.fromJson(json['buyer'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LimitRequestToJson(LimitRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fromDate': instance.fromDate?.toIso8601String(),
      'nrOfQuarters': instance.nrOfQuarters,
      'amount': instance.amount,
      'creditTerms': instance.creditTerms,
      'cancelable': instance.cancelable,
      'anyOverduepayments': instance.anyOverduepayments,
      'nrOfDaysOverdueOldestInvoice': instance.nrOfDaysOverdueOldestInvoice,
      'buyer': instance.buyer
    };
