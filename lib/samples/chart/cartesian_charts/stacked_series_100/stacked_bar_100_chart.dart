/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

/// Local imports
import '../../../../model/sample_view.dart';

/// Renders the stacked bar 100 chart sample.
class StackedBar100Chart extends SampleView {
  const StackedBar100Chart(Key key) : super(key: key);

  @override
  _StackedBar100ChartState createState() => _StackedBar100ChartState();
}

/// State class of the stacked bar 100 chart.
class _StackedBar100ChartState extends SampleViewState {
  _StackedBar100ChartState();

  @override
  Widget build(BuildContext context) {
    return getStackedBar100Chart();
  }

  /// Returns the cartesian stacked bar 100 chart.
  SfCartesianChart getStackedBar100Chart() {
  return SfCartesianChart(
    plotAreaBorderWidth: 1,
    title: ChartTitle(text: isCardView ? '' : 'Sales comparison of fruits'),
    legend: Legend(isVisible: !isCardView),
    primaryXAxis: CategoryAxis(
      majorGridLines: MajorGridLines(width: 0),
    ),
    primaryYAxis: NumericAxis(
        rangePadding: ChartRangePadding.none,
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0)),
    series: _getStackedBarSeries(),
    tooltipBehavior:
        TooltipBehavior(enable: true, header: '', canShowMarker: false),
  );
}

/// Returns the list of chart series which need to render on the stacked bar 100 chart.
List<ChartSeries<_ChartData, String>> _getStackedBarSeries() {
  final List<_ChartData> chartData = <_ChartData>[
    _ChartData('Jan', 6, 6, 1),
    _ChartData('Feb', 8, 8, 1.5),
    _ChartData('Mar', 12, 11, 2),
    _ChartData('Apr', 15.5, 16, 2.5),
    _ChartData('May', 20, 21, 3),
    _ChartData('June', 24, 25, 3.5),
  ];
  return <ChartSeries<_ChartData, String>>[
    StackedBar100Series<_ChartData, String>(
        enableTooltip: true,
        dataSource: chartData,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.apple,
        name: 'Apple'),
    StackedBar100Series<_ChartData, String>(
        enableTooltip: true,
        dataSource: chartData,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.orange,
        name: 'Orange'),
    StackedBar100Series<_ChartData, String>(
        enableTooltip: true,
        dataSource: chartData,
        xValueMapper: (_ChartData sales, _) => sales.x,
        yValueMapper: (_ChartData sales, _) => sales.wastage,
        name: 'Wastage')
  ];
}
}

/// Private class for storing the stacked bar 100 series data points.
class _ChartData {
  _ChartData(this.x, this.apple, this.orange, this.wastage);
  final String x;
  final num apple;
  final num orange;
  final num wastage;
}