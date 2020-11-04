import 'package:cimpl/domain/insurance_request.dart';
import 'package:cimpl/insurance_proposal_overview_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InsuranceRequestDetailPage extends StatelessWidget {
  final InsuranceRequest request;

  InsuranceRequestDetailPage({Key key, @required this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var eurosInCurrentLocale = new NumberFormat.currency(symbol: "€", decimalDigits: 0);

    void _pushProposals() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InsuranceProposalOverviewPage(request: request),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Request (${request.creationDate.day}-${request.creationDate.month}-${request.creationDate.year})"),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.attach_money), onPressed: _pushProposals),
        ],
      ),
      body: ListView.builder(
        itemCount: request.limitRequests.length,
        itemBuilder: (context, position) {
          return Column(
            children: <Widget>[
              ListTile(
                  leading: CircleAvatar(
                      child: Text(request.limitRequests[position].buyer.companyName[0])
                  ),
                  title: Text("${request.limitRequests[position].buyer.companyName} (${request.limitRequests[position].buyer.registrationNumber})"),
                  subtitle: Text(eurosInCurrentLocale.format(request.limitRequests[position].amount))
              ),
              Divider(
                height: 2.0,
                color: Colors.grey,
              )
            ],
          );
        },
      ),
    );
  }


}
