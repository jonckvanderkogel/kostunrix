part of 'insurance_request.dart';

InsuranceRequest _$InsuranceRequestFromJson(Map<String, dynamic> json) {
  return InsuranceRequest(
      json['id'] as int,
      json['customer'] == null
          ? null
          : json['customer']['company'] == null ? null : Company.fromJson(json['customer']['company'] as Map<String, dynamic>),
      json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      json['startDate'] == null
          ? null
          : DateTime.parse(DateTimeSerializer.fromJson(json['startDate'] as Map<String, dynamic>)),
      json['nrOfYears'] as int,
      (json['proposals'] as List)
          ?.map((e) => e == null
          ? null
          : InsuranceProposal.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['limitRequests'] as List)
          ?.map((e) => e == null
          ? null
          : LimitRequest.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      enumDecodeNullable(
          premiumOptionsEnumMap, json['premiumOptionChoice']),
      json['estimatedTurnover'] as int,
      enumDecodeNullable(turnoverDeclarationFrequencyEnumMap,
          json['turnoverDeclarationFrequencyChoice']),
      json['coveragePercentage'] as int,
      enumDecodeNullable(
          paymentOptionsEnumMap, json['paymentOptionChoice']),
      json['tailorMadeGoods'] as bool,
      json['averageTimeBetweenAcceptanceAndDeliveryOfOrder'] as int,
      json['maxTimeBetweenAcceptanceAndDeliveryOfOrder'] as int,
      json['mostUsedPaymentConditionInDays'] as int,
      json['maxPaymentConditionInDays'] as int,
      json['invoicingTerm'] as int,
      json['averageDaysSalesOutstanding'] as int,
      json['extraRiskTaking'] == null
          ? null
          : ExtraRiskTaking.fromJson(
          json['extraRiskTaking'] as Map<String, dynamic>),
      enumDecodeNullable(
          insuranceRequestStatusEnumMap, json['insuranceRequestStatus']),
      json['fabricationRisk'] as bool);
}

Map<String, dynamic> _$InsuranceRequestToJson(InsuranceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer': instance.customer,
      'creationDate': instance.creationDate?.toIso8601String(),
      'startDate': instance.startDate?.toIso8601String(),
      'nrOfYears': instance.nrOfYears,
      'limitRequests': instance.limitRequests,
      'premiumOptionChoice':
      premiumOptionsEnumMap[instance.premiumOptionChoice],
      'estimatedTurnover': instance.estimatedTurnover,
      'turnoverDeclarationFrequencyChoice':
      turnoverDeclarationFrequencyEnumMap[
      instance.turnoverDeclarationFrequencyChoice],
      'coveragePercentage': instance.coveragePercentage,
      'paymentOptionChoice':
      paymentOptionsEnumMap[instance.paymentOptionChoice],
      'tailorMadeGoods': instance.tailorMadeGoods,
      'averageTimeBetweenAcceptanceAndDeliveryOfOrder':
      instance.averageTimeBetweenAcceptanceAndDeliveryOfOrder,
      'maxTimeBetweenAcceptanceAndDeliveryOfOrder':
      instance.maxTimeBetweenAcceptanceAndDeliveryOfOrder,
      'mostUsedPaymentConditionInDays': instance.mostUsedPaymentConditionInDays,
      'maxPaymentConditionInDays': instance.maxPaymentConditionInDays,
      'invoicingTerm': instance.invoicingTerm,
      'averageDaysSalesOutstanding': instance.averageDaysSalesOutstanding,
      'extraRiskTaking': instance.extraRiskTaking,
      'insuranceRequestStatus':
      insuranceRequestStatusEnumMap[instance.insuranceRequestStatus],
      'fabricationRisk': instance.fabricationRisk
    };
