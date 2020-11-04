import 'package:cimpl/domain/enums.dart';
import 'package:cimpl/domain/insurance_proposal.dart';
import 'package:cimpl/domain/insurance_request.dart';
import 'package:cimpl/domain/limit_proposal.dart';

double calculateEuroPrice(
    InsuranceProposal insuranceProposal, InsuranceRequest insuranceRequest) {
  var turnover = insuranceRequest.estimatedTurnover;
  var premium = insuranceProposal.premiumPercentageOffer;
  var grossEuros = turnover * (premium / 10000);
  var limitEuros = _calculateLimitEuros(insuranceProposal, insuranceRequest);

  return grossEuros + limitEuros;
}

double _calculateLimitEuros(
    InsuranceProposal insuranceProposal, InsuranceRequest insuranceRequest) {
  if (insuranceRequest.premiumOptionChoice ==
      PremiumOptions.PERCENTAGE_OF_TURNOVER) {
    return _calculateLimitEurosForTurnoverBased(
        insuranceProposal, insuranceRequest);
  } else {
    return _calculateLimitEurosForLimitBased(insuranceProposal);
  }
}

double _calculateLimitEurosForTurnoverBased(
    InsuranceProposal insuranceProposal, InsuranceRequest insuranceRequest) {
  var endOfFirstYear = new DateTime(insuranceRequest.startDate.year + 1,
      insuranceRequest.startDate.month, insuranceRequest.startDate.day);
  var startOfFirstYear = insuranceRequest.startDate;
  const quarterMillis = 7884000000;
  return insuranceProposal.limitProposals
      .where((limitProposal) =>
          limitProposal.premiumPercentageOffer >
              insuranceProposal.premiumPercentageOffer &&
          startOfFirstYear.isBefore(limitProposal.fromDate))
      .map((limitProposal) {
    var limitEuros = limitProposal.insuredAmount *
        (limitProposal.premiumPercentageOffer / 10000);
    var startOfLimit = limitProposal.fromDate;
    var endOfLimit = new DateTime(
        limitProposal.fromDate.year,
        limitProposal.fromDate.month + (limitProposal.nrOfQuarters * 3),
        limitProposal.fromDate.day);

    var limitEurosTimesPeriod;
    if (endOfFirstYear.isBefore(endOfLimit)) {
      limitEurosTimesPeriod =
          ((endOfFirstYear.difference(startOfLimit)).inMilliseconds /
                  quarterMillis) *
              limitEuros;
    } else {
      limitEurosTimesPeriod =
          ((endOfLimit.difference(startOfLimit)).inMilliseconds /
                  quarterMillis) *
              limitEuros;
    }

    return limitEurosTimesPeriod;
  }).fold(0, (sum, current) => sum + current);
}

double _calculateLimitEurosForLimitBased(InsuranceProposal insuranceProposal) {
  return insuranceProposal.limitProposals.map((limitProposal) {
    var limitEuros = limitProposal.insuredAmount * (limitProposal.premiumPercentageOffer / 10000);
    return limitEuros * limitProposal.nrOfQuarters;
  }).reduce((sum, current) => sum + current);
}

double _calculateAppetite(InsuranceProposal insuranceProposal, InsuranceRequest insuranceRequest, bool predicate(LimitProposal limitProposal)) {
  var limitRequestSum = insuranceRequest
      .limitRequests
      .map((limitRequest) => limitRequest.amount)
      .fold(0, (sum, current) => sum + current);

  var limitProposalSum = insuranceProposal
      .limitProposals
      .where(predicate)
      .map((limitProposal) => limitProposal.insuredAmount)
      .fold(0, (sum, current) => sum + current);

  return limitProposalSum / limitRequestSum;
}

double calculateBaseAppetite(InsuranceProposal insuranceProposal, InsuranceRequest insuranceRequest) {
  return _calculateAppetite(insuranceProposal, insuranceRequest, (limitProposal) => limitProposal.premiumPercentageOffer <= insuranceProposal.premiumPercentageOffer);
}

double calculateTotalAppetite(InsuranceProposal insuranceProposal, InsuranceRequest insuranceRequest) {
  return _calculateAppetite(insuranceProposal, insuranceRequest, (_) => (true));
}

double calculateOtherOptionsScore(InsuranceProposal insuranceProposal, InsuranceRequest insuranceRequest) {
  double highScore = insuranceRequest.premiumOptionChoice == PremiumOptions.PERCENTAGE_OF_LIMIT ? 0.45 : 0.3;
  double coverageScore = insuranceRequest.coveragePercentage <= insuranceProposal.coveragePercentage ? highScore : 0;
  double extraRiskTakingScore = 0.0;
  if (insuranceRequest.extraRiskTaking.choice == insuranceProposal.extraRiskTaking.choice) {
    extraRiskTakingScore = insuranceRequest.extraRiskTaking.value >= insuranceProposal.extraRiskTaking.value ? highScore : 0;
  }
  double paymentOptionScore = paymentOptionsOrderMap[insuranceRequest.paymentOptionChoice] >= paymentOptionsOrderMap[insuranceProposal.paymentOptionChoice] ? 0.1 : 0;

  double turnoverDeclarationFrequencyScore = 0;

  if (insuranceRequest.premiumOptionChoice == PremiumOptions.PERCENTAGE_OF_TURNOVER) {
    turnoverDeclarationFrequencyScore = turnoverDeclarationFrequencyOrderMap[insuranceRequest.turnoverDeclarationFrequencyChoice] >= turnoverDeclarationFrequencyOrderMap[insuranceProposal.turnoverDeclarationFrequencyChoice] ? highScore : 0;
  }

  return coverageScore + extraRiskTakingScore + paymentOptionScore + turnoverDeclarationFrequencyScore;
}

const paymentOptionsOrderMap = <PaymentOptions, int> {
  PaymentOptions.FULL_PREMIUM_IN_ADVANCE: 1,
  PaymentOptions.AFTERWARDS_PER_QUARTER: 2,
  PaymentOptions.AFTERWARDS_PER_MONTH: 3
};

const turnoverDeclarationFrequencyOrderMap = <TurnoverDeclarationFrequency, int> {
  TurnoverDeclarationFrequency.NA: 1,
  TurnoverDeclarationFrequency.TWELVE_MONTHS: 2,
  TurnoverDeclarationFrequency.SIX_MONTHS: 3,
  TurnoverDeclarationFrequency.THREE_MONTHS: 4
};
