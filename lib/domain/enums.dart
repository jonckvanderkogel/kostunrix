enum PremiumOptions {
  PERCENTAGE_OF_TURNOVER, PERCENTAGE_OF_LIMIT
}

enum TurnoverDeclarationFrequency {
  NA, THREE_MONTHS, SIX_MONTHS, TWELVE_MONTHS
}

enum PaymentOptions {
  FULL_PREMIUM_IN_ADVANCE, AFTERWARDS_PER_MONTH, AFTERWARDS_PER_QUARTER
}

enum ExtraRiskTakingOptions {
  NONE, AGGREGATE_FIRST_LOSS, CLAIMS_THRESHOLD, EACH_AND_EVERY
}

enum InsuranceRequestStatus {
  DRAFT, SUBMITTED, AGREED, CANCELLED
}

enum InsuranceProposalStatus {
  DRAFT, SUBMITTED, AGREED, REJECTED, WITHDRAWN
}

const premiumOptionsEnumMap = <PremiumOptions, String> {
  PremiumOptions.PERCENTAGE_OF_TURNOVER: 'PERCENTAGE_OF_TURNOVER',
  PremiumOptions.PERCENTAGE_OF_LIMIT: 'PERCENTAGE_OF_LIMIT'
};

const turnoverDeclarationFrequencyEnumMap =
<TurnoverDeclarationFrequency, String> {
  TurnoverDeclarationFrequency.NA: 'NA',
  TurnoverDeclarationFrequency.THREE_MONTHS: 'THREE_MONTHS',
  TurnoverDeclarationFrequency.SIX_MONTHS: 'SIX_MONTHS',
  TurnoverDeclarationFrequency.TWELVE_MONTHS: 'TWELVE_MONTHS'
};

const paymentOptionsEnumMap = <PaymentOptions, String>{
  PaymentOptions.FULL_PREMIUM_IN_ADVANCE: 'FULL_PREMIUM_IN_ADVANCE',
  PaymentOptions.AFTERWARDS_PER_MONTH: 'AFTERWARDS_PER_MONTH',
  PaymentOptions.AFTERWARDS_PER_QUARTER: 'AFTERWARDS_PER_QUARTER'
};

const extraRiskTakingOptionsEnumMap = <ExtraRiskTakingOptions, String>{
  ExtraRiskTakingOptions.NONE: 'NONE',
  ExtraRiskTakingOptions.AGGREGATE_FIRST_LOSS: 'AGGREGATE_FIRST_LOSS',
  ExtraRiskTakingOptions.CLAIMS_THRESHOLD: 'CLAIMS_THRESHOLD',
  ExtraRiskTakingOptions.EACH_AND_EVERY: 'EACH_AND_EVERY'
};

const insuranceRequestStatusEnumMap = <InsuranceRequestStatus, String>{
  InsuranceRequestStatus.DRAFT: 'DRAFT',
  InsuranceRequestStatus.SUBMITTED: 'SUBMITTED',
  InsuranceRequestStatus.AGREED: 'AGREED',
  InsuranceRequestStatus.CANCELLED: 'CANCELLED'
};

const insuranceProposalStatusEnumMap = <InsuranceProposalStatus, String> {
  InsuranceProposalStatus.DRAFT: "DRAFT",
  InsuranceProposalStatus.SUBMITTED: "SUBMITTED",
  InsuranceProposalStatus.AGREED: "AGREED",
  InsuranceProposalStatus.REJECTED: "REJECTED",
  InsuranceProposalStatus.WITHDRAWN: "WITHDRAWN"
};

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
      orElse: () => throw ArgumentError(
          '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}