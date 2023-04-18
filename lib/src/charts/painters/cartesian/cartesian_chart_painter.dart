import 'dart:math';

import 'package:chart_it/src/charts/constants/defaults.dart';
import 'package:chart_it/src/charts/data/core.dart';
import 'package:chart_it/src/charts/painters/text/chart_text_painter.dart';
import 'package:chart_it/src/charts/state/bar_series_state.dart';
import 'package:chart_it/src/charts/state/painting_state.dart';
import 'package:chart_it/src/extensions/primitives.dart';
import 'package:flutter/material.dart';

class CartesianChartPainter {
  late Rect graphPolygon;
  late double graphHeight;
  late double graphWidth;
  late Offset graphOrigin;
  late Offset axisOrigin;

  late double graphUnitWidth;
  late double graphUnitHeight;

  late double valueUnitWidth;
  late double valueUnitHeight;

  late double xUnitValue;
  late double _xUnitsCount;
  late double totalXRange;

  late double yUnitValue;
  late double _yUnitsCount;
  late double totalYRange;

  CartesianChartStyle style;
  List<PaintingState> states;
  CartesianRangeResult rangeData;

  late Paint _bgPaint;
  late Paint _gridBorder;
  late Paint _gridTick;
  late Paint _axisPaint;

  CartesianChartPainter({
    required this.style,
    required this.states,
    required this.rangeData,
  }) {
    _bgPaint = Paint();
    _gridBorder = Paint()..style = PaintingStyle.stroke;
    _gridTick = Paint()..style = PaintingStyle.stroke;
    _axisPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;
  }

  void paint(Canvas canvas, Size size) {
    // Calculate constraints for the graph
    _calculateGraphConstraints(size);

    // Paint the background
    // var bg = Paint()..color = style.backgroundColor;
    canvas.clipRect(Offset.zero & size);
    canvas.drawPaint(_bgPaint..color = style.backgroundColor);

    _drawGridLines(canvas, size);

    // Finally for every data series, we will construct a painter and handover
    // the canvas to them to draw the data sets into the required chart
    for (var i = 0; i < states.length; i++) {
      var state = states[i];
      if (state is BarSeriesState) {
        state.painter.paint(state.data, canvas, this, state.config);
      } else {
        throw ArgumentError('No State of this type exists!');
      }
    }

    // We will draw axis on top of the painted chart data.
    _drawAxis(canvas, size);
  }

  void _drawGridLines(Canvas canvas, Size size) {
    var border = _gridBorder
      ..color = style.gridStyle!.gridLineColor
      ..strokeWidth = style.gridStyle!.gridLineWidth;

    var tickPaint = _gridTick
      ..color = style.axisStyle!.tickColor
      ..strokeWidth = style.axisStyle!.tickWidth;

    var x = graphPolygon.left;
    // create vertical lines
    for (var i = 0; i <= _xUnitsCount; i++) {
      var p1 = Offset(x, graphPolygon.bottom);
      var p2 = Offset(x, graphPolygon.top);
      canvas.drawLine(p1, p2, border);

      // Draw ticks along x-axis
      canvas.drawLine(
        p1,
        Offset(p1.dx, p1.dy + style.axisStyle!.tickLength),
        tickPaint,
      );

      x += graphUnitWidth;
    }

    // create horizontal lines
    for (var i = 0; i <= _yUnitsCount; i++) {
      var y = graphPolygon.bottom - graphUnitHeight * i;

      var p1 = Offset(graphPolygon.left, y);
      var p2 = Offset(graphPolygon.right, y);
      canvas.drawLine(p1, p2, border);

      // Draw ticks along y-axis
      canvas.drawLine(
        p1,
        Offset(p1.dx - style.axisStyle!.tickLength, p1.dy),
        tickPaint,
      );
    }
  }

  void _drawAxis(Canvas canvas, Size size) {
    var axisPaint = _axisPaint
      ..color = style.axisStyle!.axisColor
      ..strokeWidth = style.axisStyle!.axisWidth;

    // We will use a L shaped path for the Axes
    var axis = Path();
    axis.moveTo(graphPolygon.topLeft.dx, graphPolygon.topLeft.dy);
    axis.lineTo(axisOrigin.dx, axisOrigin.dy); // +ve y axis
    axis.lineTo(graphPolygon.right, axisOrigin.dy); // +ve x axis

    if (rangeData.minYRange.isNegative) {
      // Paint negative Y-axis if we have negative values
      axis.moveTo(graphPolygon.bottomLeft.dx, graphPolygon.bottomLeft.dy);
      axis.lineTo(axisOrigin.dx, axisOrigin.dy); // -ve y axis
    }

    if (rangeData.minXRange.isNegative) {
      // Paint negative X-axis if we have Negative values
      axis.lineTo(graphPolygon.left, axisOrigin.dy); // -ve x axis
    }

    canvas.drawPath(axis, axisPaint);
    drawLabels(canvas);
  }

  void drawLabels(Canvas canvas) {
    var x = graphPolygon.left;
    var maxIterations = max(_xUnitsCount, _yUnitsCount);
    var showXLabels = style.axisStyle?.showXAxisLabels ?? true;
    var showYLabels = style.axisStyle?.showYAxisLabels ?? true;

    for (var i = 0; i <= maxIterations; i++) {
      // We will plot texts and point along both X & Y axis
      if (showXLabels && i <= _xUnitsCount) {
        ChartTextPainter.fromChartTextStyle(
          text: i.toPrecision(2).toString(),
          chartTextStyle:
              style.axisStyle?.tickLabelStyle ?? defaultChartTextStyle,
        ).paint(
          canvas: canvas,
          offset:
              Offset(x, graphPolygon.bottom + style.axisStyle!.tickLength + 15),
        );

        // increment by unitWidth every iteration along x
        x += graphUnitWidth;
      }

      if (showYLabels && i <= _yUnitsCount) {
        final textStyle =
            style.axisStyle?.tickLabelStyle ?? defaultChartTextStyle;
        ChartTextPainter.fromChartTextStyle(
          text: (rangeData.minYRange + (yUnitValue * i))
              .toPrecision(2)
              .toString(),
          chartTextStyle: textStyle.copyWith(align: TextAlign.end),
        ).paint(
          canvas: canvas,
          offset: Offset(
            graphPolygon.left - style.axisStyle!.tickLength - 15,
            graphPolygon.bottom - graphUnitHeight * i,
          ),
        );
      }
    }
  }

  _calculateGraphConstraints(Size widgetSize) {
    // TODO: Calculate the effective width & height of the graph
    graphOrigin = Offset(widgetSize.width * 0.5, widgetSize.height * 0.5);
    graphWidth = widgetSize.width * 0.8;
    graphHeight = widgetSize.height * 0.8;

    graphPolygon = Rect.fromCenter(
      center: graphOrigin,
      width: graphWidth,
      height: graphHeight,
    );

    xUnitValue = style.gridStyle!.xUnitValue!.toDouble();
    yUnitValue = style.gridStyle!.yUnitValue!.toDouble();

    totalXRange = rangeData.maxXRange.abs() + rangeData.minXRange.abs();
    _xUnitsCount = totalXRange / xUnitValue;

    totalYRange = rangeData.maxYRange.abs() + rangeData.minYRange.abs();
    _yUnitsCount = totalYRange / yUnitValue;

    // We will get unitWidth & unitHeight by dividing the
    // graphWidth & graphHeight into X parts
    graphUnitWidth = graphWidth / _xUnitsCount;
    graphUnitHeight = graphHeight / _yUnitsCount;

    // Get the unitValue if the data range was within the graph's constraints
    valueUnitWidth = graphWidth / totalXRange;
    valueUnitHeight = graphHeight / totalYRange;

    // Calculate the Offset for Axis Origin
    var negativeXRange =
        (rangeData.minXRange.abs() / xUnitValue) * graphUnitWidth;
    var negativeYRange =
        (rangeData.minYRange.abs() / yUnitValue) * graphUnitHeight;
    var xOffset = graphPolygon.left + negativeXRange;
    var yOffset = graphPolygon.bottom - negativeYRange;
    axisOrigin = Offset(xOffset, yOffset);
  }
}
