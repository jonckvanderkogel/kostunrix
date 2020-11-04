import 'dart:convert';

import 'package:cimpl/base_authenticated_service.dart';
import 'package:cimpl/domain/enums.dart';
import 'package:cimpl/domain/insurance_request.dart';
import 'package:cimpl/domain/insurance_request_list_wrapper.dart';
import 'package:cimpl/login_service.dart';
import 'package:http/http.dart' as http;

class InsuranceService extends BaseAuthenticatedService {
  var insuranceUrl = "${LoginService.baseUrl}/insurance";

  Future<List<InsuranceRequest>> getOwnInsuranceRequestsByInsuranceRequestStatus(InsuranceRequestStatus filterStatus) async {
    final url = "$insuranceUrl/ownInsuranceRequestsByInsuranceRequestStatus?filterStatus=${insuranceRequestStatusEnumMap[filterStatus]}";
    return http.get(url, headers: getHeaders(), )
        .then((response) {
      if (response.statusCode == 200) {
        var requests = jsonDecode(response.body);
        List<Map<String, dynamic>> insuranceRequestList = new List<Map<String, dynamic>>.from(requests);
        var requestsWrapper = InsuranceRequestListWrapper.fromJson(insuranceRequestList);
        return requestsWrapper.insuranceRequests;
      } else {
        print("error retrieving InsuranceRequests");
        return [];
      }
    });
  }
}