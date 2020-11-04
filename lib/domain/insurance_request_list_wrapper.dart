import 'package:cimpl/domain/insurance_request.dart';

class InsuranceRequestListWrapper {
  List<InsuranceRequest> insuranceRequests;

  InsuranceRequestListWrapper(this.insuranceRequests);

  InsuranceRequestListWrapper.fromJson(List<Map<String, dynamic>> json) {
    insuranceRequests = json.map((Map<String, dynamic> model)=> InsuranceRequest.fromJson(model)).toList();
  }
}