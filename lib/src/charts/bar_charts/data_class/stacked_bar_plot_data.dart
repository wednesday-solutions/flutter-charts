import 'package:equatable/equatable.dart';
import 'bar_plot_data.dart';
import 'bar_data.dart';

class StackedBarPlotData extends BarPlotData with EquatableMixin {
  StackedBarPlotData(super.x, this.yBarData);

  final List<BarData> yBarData;

  @override
  List<Object?> get props => [x, yBarData];
}