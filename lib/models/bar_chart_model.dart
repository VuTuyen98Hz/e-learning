class BarChartModel {
  List<double> listValueBarChart;
  List<String> listTopTitleBarChart;

  BarChartModel(
      {this.listValueBarChart = const [],
      this.listTopTitleBarChart = const []});

  factory BarChartModel.fromMap(Map data) {
    return BarChartModel(
      listValueBarChart: ((data['listValueBarChart'] ??[]) as List)
          .map((item) => item as double)
          .toList(),
      listTopTitleBarChart: ((data['listTopTitleBarChart'] ??[]) as List)
          .map((item) => item as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'listValueBarChart': listValueBarChart,
    'listTopTitleBarChart': listTopTitleBarChart,

  };


}

