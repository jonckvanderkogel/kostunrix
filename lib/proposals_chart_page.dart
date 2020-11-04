import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_common/common.dart' as common;
import 'package:cimpl/domain/insurance_proposal.dart';
import 'package:cimpl/domain/insurance_request.dart';
import 'package:cimpl/calculation_utils.dart';
import 'package:flutter/material.dart';

class ProposalsChartPage extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  ProposalsChartPage(this.seriesList, {this.animate});

  factory ProposalsChartPage.fromInsuranceRequest(InsuranceRequest request) {
    return new ProposalsChartPage(
      _createDataFromInsuranceRequest(request),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Comparing proposals"),
        ),
        body: new Padding(
            padding: new EdgeInsets.only(top: 5.0, bottom: 18.0), // for some reason the bottom needs to be at least 18, otherwise a datapoint at the absolute top left is not rendered
            child: new charts.ScatterPlotChart(
              seriesList,
              animate: animate,
              primaryMeasureAxis: new charts.PercentAxisSpec(),
              domainAxis: new charts.NumericAxisSpec(
                  tickProviderSpec: new charts.BasicNumericTickProviderSpec(
                      zeroBound: false, dataIsInWholeNumbers: false)),
              behaviors: [
                new charts.ChartTitle('Price in € (EUR)',
                    behaviorPosition: charts.BehaviorPosition.bottom,
                    titleOutsideJustification:
                        charts.OutsideJustification.middleDrawArea),
                new charts.ChartTitle('Risk Appetite (%)',
                    behaviorPosition: charts.BehaviorPosition.start,
                    titleOutsideJustification:
                        charts.OutsideJustification.middleDrawArea),
                new charts.SeriesLegend(position: charts.BehaviorPosition.top),
              ],
            )));
  }

  static List<charts.Series<InsuranceProposalDataPoint, double>>
      _createDataFromInsuranceRequest(InsuranceRequest request) {
    var palettes =
        charts.MaterialPalette.getOrderedPalettes(request.proposals.length)
            .iterator;
    return request.proposals.map((proposal) {
      palettes.moveNext();
      return _createDataPoint(request, proposal, palettes.current.shadeDefault);
    }).toList();
  }

  static charts.Series<InsuranceProposalDataPoint, double> _createDataPoint(
      InsuranceRequest request,
      InsuranceProposal proposal,
      common.Color color) {
    return new charts.Series<InsuranceProposalDataPoint, double>(
        id: proposal.insurer.companyName,
        // Providing a color function is optional.
        colorFn: (InsuranceProposalDataPoint point, _) => color,
        domainFn: (InsuranceProposalDataPoint point, _) => point.euroPrice,
        measureFn: (InsuranceProposalDataPoint point, _) => point.riskAppetite,
        // Providing a radius function is optional.
        radiusPxFn: (InsuranceProposalDataPoint point, _) => point.radius,
        data: [
          new InsuranceProposalDataPoint(
              calculateEuroPrice(proposal, request),
              calculateTotalAppetite(proposal, request),
              calculateOtherOptionsScore(proposal, request) * 5 + 5)
        ]);
  }
}

class InsuranceProposalDataPoint {
  final double euroPrice;
  final double riskAppetite;
  final double radius;

  InsuranceProposalDataPoint(this.euroPrice, this.riskAppetite, this.radius);
}
