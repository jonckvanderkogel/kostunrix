import 'package:cimpl/domain/insurance_request.dart';
import 'package:cimpl/domain/limit_request.dart';
import 'package:cimpl/insurance_request_detail_page.dart';
import 'package:cimpl/insurance_service.dart';
import 'package:cimpl/push_notification_service.dart';
import 'package:cimpl/route_service.dart';
import 'package:flutter/material.dart';
import 'package:cimpl/domain/enums.dart';

class InsuranceRequestsPage extends StatefulWidget {
  static String tag = 'insurance-requests-page';
  @override
  InsuranceRequestsState createState() => new InsuranceRequestsState();
}

class InsuranceRequestsState extends State<InsuranceRequestsPage> with RouteAware {
  final _insuranceService = new InsuranceService();
  final RouteService _routeService = RouteService();
  var _pushNotificationService; // initiing push notifications;
  List<InsuranceRequest> _insuranceRequests = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeService.routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    _routeService.routeObserver.unsubscribe(this);
    super.dispose();
  }

  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    _insuranceService.getOwnInsuranceRequestsByInsuranceRequestStatus(InsuranceRequestStatus.SUBMITTED).then((result) {
      setState(() {
        _insuranceRequests = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return new WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        appBar: AppBar(
          leading: new Container(),
          title: const Text('Insurance Requests'),
        ),
        body: _buildList(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _pushNotificationService = new PushNotificationService(context);

    _insuranceService.getOwnInsuranceRequestsByInsuranceRequestStatus(InsuranceRequestStatus.SUBMITTED).then((result) {
      setState(() {
        _insuranceRequests = result;
      });
    });
  }

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(5.0),
        itemCount: _insuranceRequests.length * 2,
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;

          return _buildRow(_insuranceRequests[index]);
        });
  }

  Widget _buildRow(InsuranceRequest request) {
    return ListTile(
      title: Text("${getTopThreeLimitRequests(request)} (${request.creationDate.day}-${request.creationDate.month}-${request.creationDate.year})"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InsuranceRequestDetailPage(request: request),
          ),
        );
      },
    );
  }

  String getTopThreeLimitRequests(InsuranceRequest insuranceRequest) {
    List<LimitRequest> limitRequests = insuranceRequest.limitRequests;

    limitRequests.sort((limitRequest1, limitRequest2) => limitRequest2.amount - limitRequest1.amount);

    return limitRequests
        .take(3)
        .map((limitRequest) => limitRequest.buyer.companyName)
        .join(", ");
  }
}
