import 'dart:ui';

import 'package:chart_it/src/charts/state/painting_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

/// Holds the unit values and ranges of the chart.
class GridUnitsData extends Equatable {
  final bool isInitState;
  final double xUnitValue;
  final double xUnitsCount;
  final double yUnitValue;
  final double yUnitsCount;
  final double totalXRange;
  final double totalYRange;
  final double maxXRange;
  final double maxYRange;
  final double minXRange;
  final double minYRange;

  const GridUnitsData({
    this.isInitState = false,
    required this.xUnitValue,
    required this.xUnitsCount,
    required this.yUnitValue,
    required this.yUnitsCount,
    required this.totalXRange,
    required this.totalYRange,
    required this.maxXRange,
    required this.maxYRange,
    required this.minXRange,
    required this.minYRange,
  });

  static const zero = GridUnitsData(
    xUnitValue: 1,
    xUnitsCount: 1,
    yUnitValue: 1,
    yUnitsCount: 1,
    totalXRange: 0,
    totalYRange: 0,
    maxXRange: 0,
    maxYRange: 0,
    minXRange: 0,
    minYRange: 0,
  );

  static GridUnitsData lerp(
      GridUnitsData? current, GridUnitsData target, double t) {
    return GridUnitsData(
      isInitState: target.isInitState,
      xUnitValue: lerpDouble(
              current?.xUnitValue ?? target.xUnitValue, target.xUnitValue, t) ??
          1,
      xUnitsCount: lerpDouble(current?.xUnitsCount ?? target.xUnitsCount,
              target.xUnitsCount, t) ??
          0.0,
      yUnitValue: lerpDouble(
              current?.yUnitValue ?? target.yUnitValue, target.yUnitValue, t) ??
          1,
      yUnitsCount: lerpDouble(current?.yUnitsCount ?? target.yUnitsCount,
              target.yUnitsCount, t) ??
          0.0,
      totalXRange: lerpDouble(current?.totalXRange ?? target.totalXRange,
              target.totalXRange, t) ??
          0.0,
      totalYRange: lerpDouble(current?.totalYRange ?? target.totalYRange,
              target.totalYRange, t) ??
          0.0,
      maxXRange: lerpDouble(current?.maxXRange, target.maxXRange, t) ?? 0,
      maxYRange: lerpDouble(current?.maxYRange, target.maxYRange, t) ?? 0,
      minXRange: lerpDouble(current?.minXRange, target.minXRange, t) ?? 0,
      minYRange: lerpDouble(current?.minYRange, target.minYRange, t) ?? 0,
    );
  }

  GridUnitsData copyWith({
    bool? isInitState,
    double? xUnitValue,
    double? xUnitsCount,
    double? yUnitValue,
    double? yUnitsCount,
    double? totalXRange,
    double? totalYRange,
    double? maxXRange,
    double? maxYRange,
    double? minXRange,
    double? minYRange,
  }) {
    return GridUnitsData(
      isInitState: isInitState ?? this.isInitState,
      xUnitValue: xUnitValue ?? this.xUnitValue,
      xUnitsCount: xUnitsCount ?? this.xUnitsCount,
      yUnitValue: yUnitValue ?? this.yUnitValue,
      yUnitsCount: yUnitsCount ?? this.yUnitsCount,
      totalXRange: totalXRange ?? this.totalXRange,
      totalYRange: totalYRange ?? this.totalYRange,
      maxXRange: maxXRange ?? this.maxXRange,
      maxYRange: maxYRange ?? this.maxYRange,
      minXRange: minXRange ?? this.minXRange,
      minYRange: minYRange ?? this.minYRange,
    );
  }

  @override
  List<Object> get props => [
        isInitState,
        xUnitsCount,
        xUnitValue,
        yUnitsCount,
        yUnitValue,
        totalXRange,
        totalYRange,
        maxXRange,
        maxYRange,
        minXRange,
        minYRange
      ];

  @override
  String toString() {
    return 'GridUnitsData{isInitState: $isInitState, xUnitValue: $xUnitValue, xUnitsCount: $xUnitsCount, yUnitValue: $yUnitValue, yUnitsCount: $yUnitsCount, totalXRange: $totalXRange, totalYRange: $totalYRange, maxXRange: $maxXRange, maxYRange: $maxYRange, minXRange: $minXRange, minYRange: $minYRange}';
  }
}

class CartesianData with EquatableMixin {
  List<PaintingState> states;
  GridUnitsData gridUnitsData;

  CartesianData({
    required this.states,
    required this.gridUnitsData,
  });

  factory CartesianData.zero({
    required GridUnitsData gridUnitsData,
  }) {
    return CartesianData(
      states: List.empty(),
      gridUnitsData: gridUnitsData,
    );
  }

  static CartesianData lerp(
    CartesianData? current,
    CartesianData target,
    double t,
  ) {
    return CartesianData(
      states: PaintingState.lerpStateList(current?.states, target.states, t),
      gridUnitsData:
          GridUnitsData.lerp(current?.gridUnitsData, target.gridUnitsData, t),
    );
  }

  @override
  List<Object> get props => [states, gridUnitsData];
}

class CartesianDataTween extends Tween<CartesianData> {
  /// A Tween to interpolate between two [CartesianData]
  ///
  /// [end] object must not be null.
  CartesianDataTween({
    required CartesianData? begin,
    required CartesianData end,
  }) : super(begin: begin, end: end);

  @override
  CartesianData lerp(double t) => CartesianData.lerp(begin, end!, t);
}

abstract class CartesianConfig with EquatableMixin {}

class CartesianPaintingGeometryData extends Equatable {
  final Rect graphPolygon;
  final Offset axisOrigin;

  final double graphUnitWidth;
  final double graphUnitHeight;

  final double valueUnitWidth;
  final double valueUnitHeight;

  final GridUnitsData unitData;

  final double xUnitValue;

  const CartesianPaintingGeometryData({
    required this.graphPolygon,
    required this.axisOrigin,
    required this.graphUnitWidth,
    required this.graphUnitHeight,
    required this.valueUnitWidth,
    required this.valueUnitHeight,
    required this.unitData,
    required this.xUnitValue,
  });

  static const zero = CartesianPaintingGeometryData(
    graphPolygon: Rect.zero,
    axisOrigin: Offset.zero,
    graphUnitWidth: 1,
    graphUnitHeight: 1,
    valueUnitWidth: 1,
    valueUnitHeight: 1,
    unitData: GridUnitsData.zero,
    xUnitValue: 1,
  );

  @override
  List<Object?> get props => [
        graphPolygon,
        axisOrigin,
        graphUnitWidth,
        graphUnitHeight,
        valueUnitWidth,
        valueUnitHeight,
        unitData,
        xUnitValue
      ];

  CartesianPaintingGeometryData copyWith({
    Rect? graphPolygon,
    Offset? axisOrigin,
    double? graphUnitWidth,
    double? graphUnitHeight,
    double? valueUnitWidth,
    double? valueUnitHeight,
    GridUnitsData? unitData,
    EdgeInsets? graphEdgeInsets,
    double? xUnitValue,
  }) {
    return CartesianPaintingGeometryData(
      graphPolygon: graphPolygon ?? this.graphPolygon,
      axisOrigin: axisOrigin ?? this.axisOrigin,
      graphUnitWidth: graphUnitWidth ?? this.graphUnitWidth,
      graphUnitHeight: graphUnitHeight ?? this.graphUnitHeight,
      valueUnitWidth: valueUnitWidth ?? this.valueUnitWidth,
      valueUnitHeight: valueUnitHeight ?? this.valueUnitHeight,
      unitData: unitData ?? this.unitData,
      xUnitValue: xUnitValue ?? this.xUnitValue,
    );
  }

  CartesianPaintingGeometryData atOffset(Offset offset) {
    return copyWith(
      graphPolygon: graphPolygon.translate(offset.dx, offset.dy),
      axisOrigin: axisOrigin + offset,
    );
  }

  @override
  String toString() {
    return 'CartesianPaintingGeometryData{graphPolygon: $graphPolygon, axisOrigin: $axisOrigin, graphUnitWidth: $graphUnitWidth, graphUnitHeight: $graphUnitHeight, valueUnitWidth: $valueUnitWidth, valueUnitHeight: $valueUnitHeight, unitData: $unitData, xUnitValue: $xUnitValue}';
  }
}
