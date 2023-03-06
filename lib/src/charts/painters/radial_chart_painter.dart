import 'package:flutter/material.dart';
import 'package:flutter_charts/src/charts/painters/radial_painter.dart';
import 'package:flutter_charts/src/common/radial_observer.dart';

class RadialChartPainter extends CustomPainter {
  late double graphWidth;
  late double graphHeight;
  late Offset graphOrigin;
  late Rect graphConstraints;

  late double unitStep;

  final RadialObserver observer;
  final List<RadialPainter> painters;

  RadialChartPainter({
    required this.observer,
    required this.painters,
  }) : super(repaint: observer);

  @override
  bool shouldRepaint(RadialChartPainter oldDelegate) =>
      observer.shouldRepaint(oldDelegate.observer);

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate constraints for the graph
    _calculateGraphConstraints(size);
    // TODO: Construct a radial grid for polar or radar charts if required

    // Finally we will handover canvas to the implementing painter
    // to draw plot and draw the chart data
    for (final painter in painters) {
      painter.paint(canvas, size);
    }
  }

  _calculateGraphConstraints(Size widgetSize) {
    // TODO: Calculate the effective width & height of the graph
    graphOrigin = Offset(widgetSize.width * 0.5, widgetSize.height * 0.5);
    graphWidth = widgetSize.width * 0.8;
    graphHeight = widgetSize.height * 0.8;

    graphConstraints = Rect.fromCenter(
      center: graphOrigin,
      width: graphWidth,
      height: graphHeight,
    );

    // TODO: Calculate Unit Step by bounding the max value's Circle within graph
  }
}
