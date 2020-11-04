part of 'insurance_proposal.dart';

InsuranceProposal _$InsuranceProposalFromJson(Map<String, dynamic> json) {
  return InsuranceProposal(
      json['id'] as int,
      json['insurer'] == null
          ? null
          : json['insurer']['company'] == null ? null : Company.fromJson(json['insurer']['company'] as Map<String, dynamic>),
      json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      (json['limitProposals'] as List)
          ?.map((e) => e == null
          ? null
          : LimitProposal.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['insurersMaxLiability'] as int,
      json['insuranceRequestId'] as int,
      enumDecodeNullable(turnoverDeclarationFrequencyEnumMap, json['turnoverDeclarationFrequencyChoice']),
      json['minimumPremiumPercentage'] as int,
      json['coveragePercentage'] as int,
      json['premiumPercentageOffer'] as int,
      enumDecodeNullable(paymentOptionsEnumMap, json['paymentOptionChoice']),
      enumDecodeNullable(insuranceProposalStatusEnumMap, json['insuranceProposalStatus']),
      json['extraRiskTaking'] == null
      ? null
          : ExtraRiskTaking.fromJson(json['extraRiskTaking'] as Map<String, dynamic>));
}
