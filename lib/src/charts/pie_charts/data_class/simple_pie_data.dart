import 'package:equatable/equatable.dart';
import 'package:flutter_charts/src/charts/pie_charts/data_class/pie_data.dart';

class SimplePieData extends PieData with EquatableMixin {
  SimplePieData(super.pieceData);

  @override
  List<Object?> get props => [];
}
