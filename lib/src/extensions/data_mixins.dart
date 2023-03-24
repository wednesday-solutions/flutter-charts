import 'package:chart_it/src/charts/data/core/cartesian/cartesian_data.dart';

mixin CartesianDataMixin<T> {
  double get minXValue;

  double get maxXValue;

  double get minYValue;

  double get maxYValue;

  double get minXRange;

  double get maxXRange;

  double get minYRange;

  double get maxYRange;

  void aggregateData(List<T> data);

  CartesianConfig? getConfig(T series);
}
