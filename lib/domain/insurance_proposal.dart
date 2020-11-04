import 'package:cimpl/domain/company.dart';
import 'package:cimpl/domain/date_time_serializer.dart';
import 'package:cimpl/domain/enums.dart';
import 'package:cimpl/domain/extra_risk_taking.dart';
import 'package:cimpl/domain/limit_proposal.dart';
import 'package:cimpl/domain/limit_request.dart';

part 'insurance_proposal_serializer.dart';

class InsuranceProposal {
  int id;
  Company insurer;
  DateTime creationDate;
  List<LimitProposal> limitProposals;
  int insurersMaxLiability;
  int insuranceRequestId;
  TurnoverDeclarationFrequency turnoverDeclarationFrequencyChoice;
  int minimumPremiumPercentage;
  int coveragePercentage;
  int premiumPercentageOffer;
  PaymentOptions paymentOptionChoice;
  InsuranceProposalStatus insuranceProposalStatus;
  ExtraRiskTaking extraRiskTaking;

  InsuranceProposal(this.id, this.insurer, this.creationDate, this.limitProposals,
      this.insurersMaxLiability, this.insuranceRequestId,
      this.turnoverDeclarationFrequencyChoice, this.minimumPremiumPercentage,
      this.coveragePercentage, this.premiumPercentageOffer,
      this.paymentOptionChoice, this.insuranceProposalStatus,
      this.extraRiskTaking);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory InsuranceProposal.fromJson(Map<String, dynamic> json) => _$InsuranceProposalFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  //Map<String, dynamic> toJson() => _$InsuranceProposalToJson(this);
}