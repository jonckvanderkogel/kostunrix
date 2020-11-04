import 'package:cimpl/domain/insurance_request.dart';
import 'package:cimpl/proposals_chart_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cimpl/calculation_utils.dart';

class InsuranceProposalOverviewPage extends StatelessWidget {
  final InsuranceRequest request;

  InsuranceProposalOverviewPage({Key key, @required this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var eurosInCurrentLocale = new NumberFormat.currency(symbol: "€", decimalDigits: 0);
    var percentage = new NumberFormat.percentPattern("nl_NL");

    void _pushProposals() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProposalsChartPage.fromInsuranceRequest(request),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Proposals"),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.scatter_plot), onPressed: _pushProposals),
        ],
      ),
      body: ListView.builder(
        itemCount: request.proposals.length,
        itemBuilder: (context, position) {
          return Column(
            children: <Widget>[
              ListTile(
                  leading: CircleAvatar(
                      child: Text(request.proposals[position].insurer.companyName[0])
                  ),
                  title: Text("${request.proposals[position].insurer.companyName}"),
                  subtitle: Text("${eurosInCurrentLocale.format(calculateEuroPrice(request.proposals[position], request))}, Risk Appetite: ${percentage.format(calculateTotalAppetite(request.proposals[position], request))}")
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
