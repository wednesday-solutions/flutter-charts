import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';

class TestPieChart extends StatefulWidget {
  const TestPieChart({Key? key}) : super(key: key);

  @override
  State<TestPieChart> createState() => _TestPieChartState();
}

class _TestPieChartState extends State<TestPieChart> {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      title: const Text('Demo Chart'),
      chartWidth: 500,
      chartHeight: 500,
      chartStyle: const RadialChartStyle(
        backgroundColor: Colors.blueGrey,
      ),
      data: PieSeries(
        donutRadius: 40.0,
        donutSpaceColor: Colors.white,
        donutLabelStyle:
            const ChartTextStyle(textStyle: TextStyle(color: Colors.black45)),
        donutLabel: () => 'Crypto',
        slices: <SliceData>[
          SliceData(
            value: 5,
            label: (percent, value) => 'Doge',
            style: const SliceDataStyle(
              radius: 90,
              color: Colors.deepOrange,
            ),
          ),
          SliceData(
            value: 15,
            label: (percent, value) => 'Tether',
            style: const SliceDataStyle(
              radius: 100,
              color: Colors.green,
            ),
          ),
          SliceData(
            value: 25,
            label: (percent, value) => 'Etherium',
            style: const SliceDataStyle(
              radius: 100,
              color: Colors.amber,
              strokeWidth: 5.0,
              strokeColor: Colors.white,
            ),
          ),
          SliceData(
            value: 30,
            label: (percent, value) => 'Bitcoin',
            style: const SliceDataStyle(
              radius: 80,
              color: Colors.cyan,
              strokeWidth: 2.0,
              strokeColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}