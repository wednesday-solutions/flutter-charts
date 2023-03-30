import 'package:chart_it/src/animations/tweens.dart';
import 'package:chart_it/src/charts/data/core/shared/chart_text_style.dart';
import 'package:chart_it/src/charts/data/pie/pie_series.dart';
import 'package:chart_it/src/extensions/primitives.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Callback for Mapping a String Value to a Label
typedef SliceMapper = String Function(num percentage, num value);

/// Base Series for any type of Data which can be plotted
/// on a Radial Type Chart.
abstract class RadialSeries {
  /// Checks the Subclass Type and returns the casted instance
  /// to the matched callback. All callbacks must be provided.
  T when<T>({
    required T Function(PieSeries series) onPieSeries,
  }) {
    switch (runtimeType) {
      case PieSeries:
        return onPieSeries(this as PieSeries);
      default:
        throw TypeError();
    }
  }

  /// Checks the Subclass Type and returns the casted instance
  /// to the matched callback.
  ///
  /// [orElse] is triggered if the callback for the matched type is not provided.
  T maybeWhen<T>({
    T Function(PieSeries series)? onPieSeries,
    required T Function() orElse,
  }) {
    switch (runtimeType) {
      case PieSeries:
        return onPieSeries?.call(this as PieSeries) ?? orElse();
      default:
        throw TypeError();
    }
  }

  /// Static method to Check the Subclass Type when we do not have
  /// an instance for an object extending this class.
  ///
  /// Does the same operation as [maybeWhen].
  static T whenType<T>(
    Type type, {
    T Function()? onPieSeries,
    required T Function() orElse,
  }) {
    switch (type) {
      case PieSeries:
        return onPieSeries?.call() ?? orElse();
      default:
        throw TypeError();
    }
  }
}

abstract class RadialConfig {}

/// Converts [current] and [target] list of [RadialSeries] to
/// a list of [Tween] of type [RadialSeries]
List<Tween<RadialSeries>>? toRadialTweens(
  List<RadialSeries>? current,
  List<RadialSeries> target,
) {
  return buildTweens(current, target, builder: (current, target) {
    final currentValue =
        current == null || current.runtimeType != target.runtimeType
            ? null
            : current;
    return target.when(
      onPieSeries: (series) {
        return PieSeriesTween(
          begin: currentValue.asOrDefault(PieSeries.zero()),
          end: series,
        );
      },
    );
  });
}

/// Defines that the Axis Type is for a [PolarChart], and
/// provides Styling for Elements only for PolarChart Axis Type
///
/// See Also: [RadialAxis]
class PolarAxis extends RadialAxis with EquatableMixin {
  PolarAxis({
    required super.tickStyle,
    super.gridLineStrokeColor,
    super.gridLineStrokeWidth,
  });

  @override
  List<Object?> get props => [
        super.tickStyle,
        super.gridLineStrokeColor,
        super.gridLineStrokeWidth,
      ];

  PolarAxis copyWith(
    ChartTextStyle? tickStyle,
    Color? gridLineStrokeColor,
    double? gridLineStrokeWidth,
  ) {
    return PolarAxis(
      tickStyle: tickStyle ?? super.tickStyle,
      gridLineStrokeColor: gridLineStrokeColor ?? super.gridLineStrokeColor,
      gridLineStrokeWidth: gridLineStrokeWidth ?? super.gridLineStrokeWidth,
    );
  }
}

/// Defines that the Axis Type is for a [RadarChart], and
/// provides Styling for Elements only for RadarChart Axis Type
///
/// See Also: [RadialAxis]
class RadarAxis extends RadialAxis with EquatableMixin {
  /// The Color of the Angled Axis Line
  Color angleLineStrokeColor;

  /// The Width/Thickness of the Angled Axis Line
  double angleLineStrokeWidth;

  /// Styling for the Label for the Angled Axes
  ChartTextStyle angleLabelStyle;

  RadarAxis({
    required super.tickStyle,
    required this.angleLabelStyle,
    super.gridLineStrokeColor,
    super.gridLineStrokeWidth,
    this.angleLineStrokeColor = Colors.black45,
    this.angleLineStrokeWidth = 1.0,
  });

  @override
  List<Object?> get props => [
        super.tickStyle,
        angleLabelStyle,
        super.gridLineStrokeColor,
        super.gridLineStrokeWidth,
        angleLineStrokeColor,
        angleLineStrokeWidth,
      ];

  RadarAxis copyWith({
    ChartTextStyle? tickStyle,
    Color? gridLineStrokeColor,
    double? gridLineStrokeWidth,
    Color? angleLineStrokeColor,
    double? angleLineStrokeWidth,
    ChartTextStyle? angleLabelStyle,
  }) {
    return RadarAxis(
      tickStyle: tickStyle ?? super.tickStyle,
      gridLineStrokeColor: gridLineStrokeColor ?? super.gridLineStrokeColor,
      gridLineStrokeWidth: gridLineStrokeWidth ?? super.gridLineStrokeWidth,
      angleLineStrokeColor: angleLineStrokeColor ?? this.angleLineStrokeColor,
      angleLineStrokeWidth: angleLineStrokeWidth ?? this.angleLineStrokeWidth,
      angleLabelStyle: angleLabelStyle ?? this.angleLabelStyle,
    );
  }
}

/// Defines the Structure for any type of Axis
/// which are Applicable for a Radial Type Chart
abstract class RadialAxis {
  /// Styling for the Tick Labels
  final ChartTextStyle tickStyle;

  /// The Color of the Grid Lines
  final Color gridLineStrokeColor;

  /// The Width/Thickness of the Grid Lines
  final double gridLineStrokeWidth;

  RadialAxis({
    required this.tickStyle,
    this.gridLineStrokeColor = Colors.black45,
    this.gridLineStrokeWidth = 1.0,
  });
}
