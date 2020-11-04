import 'package:cimpl/domain/date_time_serializer.dart';

part 'limit_proposal_serializer.dart';

class LimitProposal {
  int id;
  DateTime fromDate;
  int nrOfQuarters;
  int insuredAmount;
  int limitRequestId;
  int premiumPercentageOffer;

  LimitProposal(this.id, this.fromDate, this.nrOfQuarters, this.insuredAmount,
      this.limitRequestId, this.premiumPercentageOffer);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory LimitProposal.fromJson(Map<String, dynamic> json) => _$LimitProposalFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  //Map<String, dynamic> toJson() => _$LimitProposalToJson(this);
}