import 'package:cimpl/domain/company.dart';
import 'package:cimpl/domain/date_time_serializer.dart';
import 'package:cimpl/domain/enums.dart';
import 'package:cimpl/domain/extra_risk_taking.dart';
import 'package:cimpl/domain/insurance_proposal.dart';
import 'package:cimpl/domain/limit_request.dart';
import 'package:cimpl/domain/insurance_proposal.dart';

part 'insurance_request_serializer.dart';

class InsuranceRequest {
  int id;
  Company customer;
  DateTime creationDate;
  DateTime startDate;
  int nrOfYears;
  List<InsuranceProposal> proposals;
  List<LimitRequest> limitRequests;
  PremiumOptions premiumOptionChoice;
  int estimatedTurnover;
  TurnoverDeclarationFrequency turnoverDeclarationFrequencyChoice;
  int coveragePercentage;
  PaymentOptions paymentOptionChoice;
  bool tailorMadeGoods;
  int averageTimeBetweenAcceptanceAndDeliveryOfOrder;
  int maxTimeBetweenAcceptanceAndDeliveryOfOrder;
  int mostUsedPaymentConditionInDays;
  int maxPaymentConditionInDays;
  int invoicingTerm;
  int averageDaysSalesOutstanding;
  ExtraRiskTaking extraRiskTaking;
  InsuranceRequestStatus insuranceRequestStatus;
  bool fabricationRisk;

  InsuranceRequest(this.id, this.customer, this.creationDate, this.startDate,
      this.nrOfYears, this.proposals, this.limitRequests, this.premiumOptionChoice,
      this.estimatedTurnover, this.turnoverDeclarationFrequencyChoice,
      this.coveragePercentage, this.paymentOptionChoice, this.tailorMadeGoods,
      this.averageTimeBetweenAcceptanceAndDeliveryOfOrder,
      this.maxTimeBetweenAcceptanceAndDeliveryOfOrder,
      this.mostUsedPaymentConditionInDays, this.maxPaymentConditionInDays,
      this.invoicingTerm, this.averageDaysSalesOutstanding,
      this.extraRiskTaking, this.insuranceRequestStatus, this.fabricationRisk);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory InsuranceRequest.fromJson(Map<String, dynamic> json) => _$InsuranceRequestFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$InsuranceRequestToJson(this);
}