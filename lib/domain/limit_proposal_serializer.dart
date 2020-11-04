part of 'limit_proposal.dart';

LimitProposal _$LimitProposalFromJson(Map<String, dynamic> json) {
  return LimitProposal(
      json['id'] as int,
      json['fromDate'] == null
          ? null
          : DateTime.parse(DateTimeSerializer.fromJson(json['fromDate'] as Map<String, dynamic>)),
      json['nrOfQuarters'] as int,
      json['insuredAmount'] as int,
      json['limitRequestId'] as int,
      json['premiumPercentageOffer'] as int);
}
